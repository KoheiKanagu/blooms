import 'dart:async';

import 'package:blooms/constants/collection_path.dart';
import 'package:blooms/features/authentication/application/auth_providers.dart';
import 'package:blooms/features/authentication/application/firebase_user_providers.dart';
import 'package:blooms/features/user/domain/user.dart';
import 'package:blooms/utils/firebase/firebase_analytics.dart';
import 'package:blooms/utils/firebase/firebase_providers.dart';
import 'package:blooms/utils/my_logger.dart';
import 'package:blooms/utils/timestamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_providers.g.dart';

@Riverpod(keepAlive: true)
CollectionReference<User> userCollectionReference(Ref ref) => ref
    .watch(firebaseFirestoreProvider)
    .collection(CollectionPath.kUsers)
    .withConverter(
      fromFirestore: User.fromFirestore,
      toFirestore: User.toFirestore,
    );

@riverpod
Stream<DocumentSnapshot<User>> userDocumentSnapshot(Ref ref, String uid) =>
    ref.watch(userCollectionReferenceProvider).doc(uid).snapshots();

@riverpod
Future<void> userDelete(Ref ref) async {
  await ref.watch(firebaseAnalyticsProvider).logEvent(name: 'user_delete');

  logger.debug('add deletedAt');

  final results = await ref.watch(userProvider.future);
  if (results == null) {
    throw Exception('user is null');
  }

  final (:reference, :user) = results;

  await reference.update(TimestampConverter.addDeletedAt(user.toJson()));

  await ref.watch(authSignOutProvider.future);
  logger.debug('userDelete succeeded');
}

typedef UserDocument = ({DocumentReference<User> reference, User user});

@riverpod
Stream<UserDocument?> user(Ref ref) async* {
  final uid = await ref.watch(firebaseUserUidProvider.future);
  if (uid != null) {
    final snapshot = await ref.watch(userDocumentSnapshotProvider(uid).future);
    final user = snapshot.data();

    if (user == null) {
      yield null;
    } else {
      yield (user: user, reference: snapshot.reference);
    }
  }
}
