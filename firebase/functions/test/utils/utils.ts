import { assertFails, assertSucceeds } from '@firebase/rules-unit-testing';

export function getFirestoreCoverageMeta(
  projectId: string,
) {
  return `http://localhost:8080/emulator/v1/projects/${projectId}:ruleCoverage.html`;
}

export async function expectFirestorePermissionDenied(
  promise: Promise<unknown>,
) {
  // eslint-disable-next-line @typescript-eslint/no-unsafe-assignment
  const errorResult = await assertFails(promise);
  // eslint-disable-next-line @typescript-eslint/no-unsafe-member-access
  expect(errorResult.code as unknown).toBe(
    'permission-denied',
  );
}

export async function expectStoragePermissionDenied(
  promise: Promise<unknown>,
) {
  // eslint-disable-next-line @typescript-eslint/no-unsafe-assignment
  const errorResult = await assertFails(promise);
  // eslint-disable-next-line @typescript-eslint/no-unsafe-member-access
  expect(errorResult.code as unknown).toBe(
    'storage/unauthorized',
  );
}

export async function expectPermissionSucceeds(
  promise: Promise<unknown>,
) {
  const successResult = await assertSucceeds(promise);
  expect(successResult).toBeDefined();
}
