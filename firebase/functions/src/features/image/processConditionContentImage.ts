import * as blurhash from 'blurhash';
import { randomUUID } from 'crypto';
import { getStorage } from 'firebase-admin/storage';
import { onCall } from 'firebase-functions/https';
import { isUndefined } from 'lodash';
import sharp from 'sharp';
import { outSensitiveLog } from '../../utils/sensitive_log';
import { StoragePath } from '../../utils/storagePath';
import { ProcessConditionContentImageRequest } from './domain/processConditionContentImageRequest';
import { ProcessConditionContentImageResponse } from './domain/processConditionContentImageResponse';

/**
 * 画像をエンコードしてCloud Storageに保存、BlurHashを生成する。
 *
 * @returns gs:// のパスとBlurHash
 */
export const processConditionContentImage = onCall({
  memory: '512MiB',
}, async (request) => {
  const uid = request.auth?.uid;
  if (isUndefined(uid)) {
    throw new Error('Unauthorized');
  }

  const req = request.data as ProcessConditionContentImageRequest;

  let buffer: Buffer;
  if (req.base64 != null) {
    // Base64にエンコードされた画像
    buffer = Buffer.from(req.base64, 'base64');
  } else if (req.blob != null) {
    // Blobの画像
    buffer = Buffer.from(req.blob);
  } else {
    throw new Error('Invalid image data');
  }

  // リサイズ
  const resizedImage = sharp(buffer)
    // 画像の向きを自動で修正
    .rotate()
    .resize(
      {
        width: 1024,
        height: 1024,
        fit: 'inside',
      })
    // ensureAlphaしないとBlurHashでエラーになる
    // ref: https://github.com/woltapp/blurhash/issues/107
    .ensureAlpha();

  // BlurHashを生成
  const { data, info } = await resizedImage
    .raw()
    .toBuffer({
      resolveWithObject: true,
    });

  const blurHash = blurhash.encode(
    new Uint8ClampedArray(data),
    info.width,
    info.height,
    4,
    3,
  );

  // uuid付きのランダムなファイル名を生成
  const filePath = `${StoragePath.IMAGES}/${uid}/${randomUUID()}.webp`;
  const bucket = getStorage().bucket();

  // WebPにエンコードして保存
  const webPBuffer = await resizedImage
    .webp()
    .toBuffer();
  await bucket
    .file(filePath)
    .save(webPBuffer);

  // レスポンス
  const response: ProcessConditionContentImageResponse = {
    gsFilePath: `gs://${bucket.name}/${filePath}`,
    blurHash,
    width: info.width,
    height: info.height,
    mimeType: 'image/webp',
  };

  outSensitiveLog('response', response);
  return response;
});
