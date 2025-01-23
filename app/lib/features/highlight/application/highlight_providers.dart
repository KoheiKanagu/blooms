import 'package:blooms/constants/collection_path.dart';
import 'package:blooms/constants/deleted_at.dart';
import 'package:blooms/features/authentication/application/firebase_user_providers.dart';
import 'package:blooms/features/highlight/domain/highlight.dart';
import 'package:blooms/features/highlight/domain/highlight_type.dart';
import 'package:blooms/utils/firebase/firebase_providers.dart';
import 'package:clock/clock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'highlight_providers.g.dart';

@riverpod
CollectionReference<Highlight> highlightCollectionReference(Ref ref) => ref
    .read(firebaseFirestoreProvider)
    .collection(CollectionPath.kHighlights)
    .withConverter(
      fromFirestore: Highlight.fromFirestore,
      toFirestore: Highlight.toFirestore,
    );

@riverpod
Future<Query<Highlight>> highlightQuery(Ref ref) async {
  final uid = await ref.watch(firebaseUserUidProvider.future);

  if (uid == null) {
    throw Exception('uid is null');
  }

  return ref
      .read(highlightCollectionReferenceProvider)
      .where('deletedAt', isNull: true)
      .where('subjectUid', isEqualTo: uid)
      .orderBy('startAt', descending: true);
}

@riverpod
Future<void> highlightCreate(
  Ref ref,
  HighlightType type,
) async {
  final uid = await ref.watch(firebaseUserUidProvider.future);

  if (uid == null) {
    throw Exception('uid is null');
  }

  final data = Highlight.create(
    type: type,
    subjectUid: uid,
    startAt: Timestamp.fromDate(clock.now()),
  );

  await ref.read(highlightCollectionReferenceProvider).add(data);
}

@riverpod
Future<void> highlightDelete(
  Ref ref, {
  required String documentId,
}) async {
  await ref
      .read(highlightCollectionReferenceProvider)
      .doc(documentId)
      .update(deletedAt);
}
