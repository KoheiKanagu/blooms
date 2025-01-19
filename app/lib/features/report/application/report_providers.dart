import 'package:blooms/constants/collection_path.dart';
import 'package:blooms/features/report/domain/report.dart';
import 'package:blooms/utils/firebase/firebase_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_providers.g.dart';

@riverpod
CollectionReference<Report> reportCollectionReference(Ref ref) => ref
    .read(firebaseFirestoreProvider)
    .collection(CollectionPath.kReports)
    .withConverter(
      fromFirestore: Report.fromFirestore,
      toFirestore: Report.toFirestore,
    );
