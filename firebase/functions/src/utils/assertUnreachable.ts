// https://stackoverflow.com/a/39419171/12856415
export function assertUnreachable(x: never): never {
  throw new Error(`Unexpected value: ${String(x)}`);
}
