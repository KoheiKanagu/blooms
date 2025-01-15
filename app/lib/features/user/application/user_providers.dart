import 'dart:async';

import 'package:blooms/constants/collection_path.dart';
import 'package:blooms/features/authentication/application/firebase_user_providers.dart';
import 'package:blooms/features/user/domain/user.dart';
import 'package:blooms/utils/firebase/firebase_providers.dart';
import 'package:blooms/utils/timestamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_providers.g.dart';

@riverpod
CollectionReference<User> userCollectionReference(
  Ref ref,
) =>
    ref
        .watch(firebaseFirestoreProvider)
        .collection(CollectionPath.kUsers)
        .withConverter(
          fromFirestore: User.fromFirestore,
          toFirestore: User.toFirestore,
        );

@riverpod
Stream<DocumentSnapshot<User>> userDocumentSnapshot(
  Ref ref,
  String uid,
) =>
    ref.watch(userCollectionReferenceProvider).doc(uid).snapshots();

typedef UserControllerData = ({
  DocumentReference<User> reference,
  User user,
});

@riverpod
class UserController extends _$UserController {
  @override
  Raw<Future<UserControllerData>> build() {
    final completer = Completer<UserControllerData>();

    Future(
      () async {
        try {
          final uid = await ref.watch(firebaseUserUidProvider.future);
          if (uid != null) {
            final snapshot =
                await ref.watch(userDocumentSnapshotProvider(uid).future);
            final user = snapshot.data();

            if (user != null) {
              completer.complete(
                (
                  user: user,
                  reference: snapshot.reference,
                ),
              );
            }
          }
        } on Exception catch (e) {
          completer.completeError(e);
        }
      },
    );

    return completer.future;
  }

  Future<void> delete() async {
    final (:reference, :user) = await state;
    await reference.update(
      TimestampConverter.addDeletedAt(
        user.toJson(),
      ),
    );
  }
}
