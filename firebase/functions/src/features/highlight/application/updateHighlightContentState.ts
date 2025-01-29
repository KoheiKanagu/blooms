import { DocumentData, DocumentReference } from '@google-cloud/firestore';
import { HighlightState } from '../domain/highlight';

/**
 * stateをアップデート
 *
 * @param documentReference
 * @param state
 */
export async function updateHighlightContentState(
  documentReference: DocumentReference<DocumentData>,
  state: HighlightState,
): Promise<void> {
  await documentReference.update({
    content: {
      state: state,
    },
  });
}
