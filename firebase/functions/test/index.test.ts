it('エミュレータに接続されていること', () => {
  expect(process.env['FIREBASE_AUTH_EMULATOR_HOST']).toBe('127.0.0.1:9099');
  expect(process.env['FIRESTORE_EMULATOR_HOST']).toBe('127.0.0.1:8080');
  expect(process.env['FIREBASE_STORAGE_EMULATOR_HOST']).toBe('127.0.0.1:9199');
});
