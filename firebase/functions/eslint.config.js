const stylistic = require('@stylistic/eslint-plugin');
const tsEslint = require('typescript-eslint');
const jestPlugin = require('eslint-plugin-jest');

/** @type {import("eslint").Linter.FlatConfig[]} */
module.exports = [
  {
    ignores: [
      '**/lib/**',
      '**/src/openapi/**',
    ],
  },
  stylistic.configs['recommended-flat'],
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
