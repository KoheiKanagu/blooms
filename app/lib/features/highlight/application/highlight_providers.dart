import 'dart:convert';

import 'package:blooms/constants/collection_path.dart';
import 'package:blooms/constants/deleted_at.dart';
import 'package:blooms/features/authentication/application/firebase_user_providers.dart';
import 'package:blooms/features/highlight/domain/highlight.dart';
import 'package:blooms/features/highlight/domain/highlight_period.dart';
import 'package:blooms/utils/firebase/firebase_providers.dart';
import 'package:clock/clock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'highlight_providers.g.dart';

@Riverpod(keepAlive: true)
CollectionReference<Highlight> highlightCollectionReference(Ref ref) => ref
    .watch(firebaseFirestoreProvider)
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
      .watch(highlightCollectionReferenceProvider)
      .where('deletedAt', isNull: true)
      .where('subjectUid', isEqualTo: uid)
      .orderBy('content.startAt', descending: true);
}

@riverpod
Future<void> highlightCreate(Ref ref, {required HighlightPeriod period}) async {
  final uid = await ref.watch(firebaseUserUidProvider.future);

  if (uid == null) {
    throw Exception('uid is null');
  }

  final data = Highlight.summary(
    period: period,
    subjectUid: uid,
    startAt: Timestamp.fromDate(clock.now()),
  );

  await ref.watch(highlightCollectionReferenceProvider).add(data);
}

@riverpod
Future<void> highlightDelete(Ref ref, {required String documentId}) async {
  await ref
      .watch(highlightCollectionReferenceProvider)
      .doc(documentId)
      .update(deletedAt);
}

@riverpod
Future<String?> highlightPrompt(Ref ref, {required String? gsFilePath}) async {
  if (gsFilePath == null) {
    return null;
  }

  final data =
      await ref.watch(firebaseStorageProvider).refFromURL(gsFilePath).getData();
  if (data == null) {
    return null;
  }

  final string = utf8.decode(data);

  final json = jsonDecode(string) as List<dynamic>;

  const encoder = JsonEncoder.withIndent('  ');
  return encoder.convert(json);
}
