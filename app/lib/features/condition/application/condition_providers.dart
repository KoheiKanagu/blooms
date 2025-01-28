import 'package:blooms/constants/collection_path.dart';
import 'package:blooms/constants/deleted_at.dart';
import 'package:blooms/features/authentication/application/firebase_user_providers.dart';
import 'package:blooms/features/condition/domain/condition.dart';
import 'package:blooms/utils/firebase/firebase_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'condition_providers.g.dart';

@riverpod
CollectionReference<Condition> conditionCollectionReference(Ref ref) => ref
    .read(firebaseFirestoreProvider)
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
      .read(conditionCollectionReferenceProvider)
      .where('deletedAt', isNull: true)
      .where('createdBy', isEqualTo: uid)
      .orderBy('createdAt', descending: true);
}

@riverpod
Future<void> conditionDelete(
  Ref ref, {
  required String documentId,
}) async {
  await ref
      .read(conditionCollectionReferenceProvider)
      .doc(documentId)
      .update(deletedAt);
}

@riverpod
Future<void> conditionCreateText(
  Ref ref, {
  required String text,
}) async {
  final uid = await ref.read(firebaseUserUidProvider.future);
  if (uid == null) {
    throw Exception('uid is null');
  }

  await ref.read(conditionCollectionReferenceProvider).add(
        Condition.text(
          uid: uid,
          text: text,
        ),
      );
}
