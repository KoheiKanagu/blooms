import { DocumentData, DocumentReference } from '@google-cloud/firestore';
import { ReportState } from '../domain/report';

/**
 * stateをアップデート
 *
 * @param documentReference
 * @param state
 */
export async function updateReportState(
  documentReference: DocumentReference<DocumentData>,
  state: ReportState,
): Promise<void> {
  await documentReference.update({
    state,
  });
}
