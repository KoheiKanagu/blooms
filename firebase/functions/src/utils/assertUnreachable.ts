/**
 * Asserts that an unreachable code path has been hit.
 *
 * This function is intended to be used for exhaustive type checking in switch statements or conditional chains. When invoked, it throws an error that includes the unexpected value, indicating that a case was not properly handled.
 *
 * @param x The unexpected value which should never occur.
 * @throws {Error} Always throws an error containing the unexpected value.
 */
export function assertUnreachable(x: never): never {
  throw new Error(`Unexpected value: ${String(x)}`);
}
