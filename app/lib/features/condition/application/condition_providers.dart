import 'dart:io';

import 'package:blooms/constants/collection_path.dart';
import 'package:blooms/constants/deleted_at.dart';
import 'package:blooms/constants/storage_path.dart';
import 'package:blooms/features/authentication/application/firebase_user_providers.dart';
import 'package:blooms/features/condition/domain/condition.dart';
import 'package:blooms/features/condition/domain/condition_content_audio_attachment.dart';
import 'package:blooms/features/condition/domain/condition_content_image_attachment.dart';
import 'package:blooms/features/condition/domain/process_condition_content_image_request.dart';
import 'package:blooms/features/condition/domain/process_condition_content_image_response.dart';
import 'package:blooms/features/condition/presentation/condition_form.dart';
import 'package:blooms/utils/firebase/firebase_providers.dart';
import 'package:blooms/utils/my_logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'condition_providers.g.dart';

@Riverpod(keepAlive: true)
CollectionReference<Condition> conditionCollectionReference(Ref ref) => ref
    .watch(firebaseFirestoreProvider)
    .collection(CollectionPath.kConditions)
    .withConverter(
      fromFirestore: Condition.fromFirestore,
      toFirestore: Condition.toFirestore,
    );

@riverpod
Future<Query<Condition>> conditionQuery(Ref ref) async {
  final uid = await ref.watch(firebaseUserUidProvider.future);

  if (uid == null) {
    throw Exception('uid is null');
  }

  return ref
      .watch(conditionCollectionReferenceProvider)
      .where('deletedAt', isNull: true)
      .where('subjectUid', isEqualTo: uid)
      .orderBy('createdAt', descending: true);
}

@riverpod
Future<void> conditionDelete(Ref ref, {required String documentId}) async {
  await ref
      .watch(conditionCollectionReferenceProvider)
      .doc(documentId)
      .update(deletedAt);
}

@riverpod
Future<void> conditionCreateText(Ref ref, {required String text}) async {
  final uid = await ref.watch(firebaseUserUidProvider.future);
  if (uid == null) {
    throw Exception('uid is null');
  }

  await ref
      .watch(conditionCollectionReferenceProvider)
      .add(Condition.text(uid: uid, text: text));
}

@riverpod
Future<void> conditionCreateImage(
  Ref ref, {
  required List<XFile> xFiles,
}) async {
  final uid = await ref.watch(firebaseUserUidProvider.future);
  if (uid == null) {
    throw Exception('uid is null');
  }

  final tasks = xFiles.map((xFile) async {
    logger.info('Upload image: ${xFile.path}');

    final request = ProcessConditionContentImageRequest(
      blob: await xFile.readAsBytes(),
    );

    final response = await ref
        .watch(firebaseFunctionsProvider)
        .httpsCallable('processConditionContentImage')
        .call<Map<String, dynamic>>(request.toJson())
        .then((e) => ProcessConditionContentImageResponse.fromJson(e.data));

    return ConditionContentImageAttachment.gs(
      gsFilePath: response.gsFilePath,
      mimeType: response.mimeType,
      width: response.width,
      height: response.height,
      blurHash: response.blurHash,
    );
  });

  final attachments = await Future.wait(tasks);
  await ref
      .watch(conditionCollectionReferenceProvider)
      .add(Condition.image(uid: uid, attachments: attachments));
}

@riverpod
Future<Reference> conditionAudioStorageReference(
  Ref ref, {
  required String uid,
  required String fileName,
}) async {
  return ref
      .watch(firebaseStorageProvider)
      .ref(StoragePath.kAudios)
      .child(uid)
      .child(fileName);
}

@riverpod
Future<void> conditionCreateAudio(Ref ref, {required XFile xFile}) async {
  final uid = await ref.watch(firebaseUserUidProvider.future);
  if (uid == null) {
    throw Exception('uid is null');
  }

  final reference = await ref.watch(
    conditionAudioStorageReferenceProvider(
      uid: uid,
      fileName: xFile.name,
    ).future,
  );

  final task = await reference.putFile(File(xFile.path));
  final mimeType = task.metadata?.contentType ?? '';

  await ref
      .watch(conditionCollectionReferenceProvider)
      .add(
        Condition.audio(
          uid: uid,
          attachments: [
            ConditionContentAudioAttachment.gs(
              reference: reference,
              mimeType: mimeType,
            ),
          ],
        ),
      );
}

/// [ConditionForm]の高さを計算する
@riverpod
class ConditionFormHeightController extends _$ConditionFormHeightController {
  @override
  double build() {
    return 0;
  }

  void calculateHeight(GlobalKey conditionFormKey) {
    final renderBox =
        conditionFormKey.currentContext?.findRenderObject() as RenderBox?;
    state = renderBox?.size.height ?? 0;
  }
}
