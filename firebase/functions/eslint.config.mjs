import stylistic from '@stylistic/eslint-plugin';
import jestPlugin from 'eslint-plugin-jest';
import * as tsEslint from 'typescript-eslint';

/** @type {import("eslint").Linter.Config[]} */
export default [
  {
    ignores: [
      '**/lib/**',
      '**/src/openapi/**',
    ],
  },
  stylistic.configs['recommended'],
  stylistic.configs.customize({
    semi: true,
    braceStyle: '1tbs',
  }),
  ...tsEslint.config({
    files: [
      'src/**/*.ts',
      'test/**/*.ts',
    ],
    plugins: {
      '@typescript-eslint': tsEslint.plugin,
      'jest': jestPlugin,
    },
    extends: [
      ...tsEslint.configs.recommendedTypeChecked,
      ...tsEslint.configs.stylisticTypeChecked,
    ],
    languageOptions: {
      parser: tsEslint.parser,
      parserOptions: {
        project: true,
      },
    },
  }),
  {
    files: [
      'test/**/*.ts',
    ],
    ...jestPlugin.configs['flat/recommended'],
    ...jestPlugin.configs['flat/style'],
    rules: {
      ...jestPlugin.configs['flat/recommended'].rules,
      ...jestPlugin.configs['flat/style'].rules,
      'jest/expect-expect': 'off',
    },
  },
];
