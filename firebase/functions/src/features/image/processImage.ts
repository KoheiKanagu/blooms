import { encode } from 'blurhash';
import { onCall } from 'firebase-functions/https';
import { isUndefined } from 'lodash';
import sharp from 'sharp';
import { ProcessImagesRequest, ProcessImagesResponse } from './domain/processImagesRequest';

/**
 * 画像をエンコードしてCloud Storageに保存、BlurHashを生成する。
 *
 * @returns gs:// のパスとBlurHash
 */
export const processImage = onCall(async (request) => {
  const uid = request.auth?.uid;
  if (isUndefined(uid)) {
    throw new Error('Unauthorized');
  }

  const date = request.data as ProcessImagesRequest;
  for (const image of date.images) {
    // base64の画像をデコード
    // リサイズしてWebPにエンコード
    const buffer = Buffer.from(image.base64, 'base64');
    const resizedImage = sharp(buffer)
      .resize(
        {
          width: 1024,
          height: 1024,
          fit: 'inside',
        })
      .webp();

    const metadata = await resizedImage.metadata();
    const width = metadata.width;
    const height = metadata.height;

    if (isUndefined(width) || isUndefined(height)) {
      throw new Error('Invalid image. Width or height is undefined.');
    }

    // BlurHashを生成
    const uint8ClampedArray = new Uint8ClampedArray(
      await resizedImage.toBuffer(),
    );

    const blurHash = encode(uint8ClampedArray, width, height, 4, 3);

    // Save resizedImage to Cloud Storage and generate BlurHash
    // ...

    const response: ProcessImagesResponse = {
      images: [
        {
          gsPath: 'gs://path/to/image',
          blurHash,
          width,
          height,
          mimeType: 'image/webp',
        },
      ],
    };
  }
});
