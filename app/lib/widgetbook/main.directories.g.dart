// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:blooms/features/condition/presentation/condition_form.dart'
    as _i2;
import 'package:blooms/features/highlight/presentation/highlight_create_page.dart'
    as _i3;
import 'package:blooms/features/highlight/presentation/highlight_create_page_tile.dart'
    as _i4;
import 'package:blooms/features/highlight/presentation/highlight_page_list_tile.dart'
    as _i5;
import 'package:blooms/features/highlight/presentation/highlight_type_label.dart'
    as _i6;
import 'package:blooms/features/onboarding/presentation/onboarding_page.dart'
    as _i7;
import 'package:blooms/features/onboarding/presentation/onboarding_page_body_assistant.dart'
    as _i8;
import 'package:blooms/features/onboarding/presentation/onboarding_page_body_highlight.dart'
    as _i9;
import 'package:blooms/features/onboarding/presentation/onboarding_page_body_lets_start.dart'
    as _i10;
import 'package:blooms/features/onboarding/presentation/onboarding_page_body_name.dart'
    as _i11;
import 'package:blooms/features/onboarding/presentation/onboarding_page_body_privacy.dart'
    as _i12;
import 'package:blooms/features/reminder/presentation/reminder_page.dart'
    as _i13;
import 'package:blooms/features/startup/presentation/startup_page.dart' as _i14;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'features',
    children: [
      _i1.WidgetbookFolder(
        name: 'condition',
        children: [
          _i1.WidgetbookFolder(
            name: 'presentation',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'ConditionForm',
                useCase: _i1.WidgetbookUseCase(
                  name: 'ConditionForm',
                  builder: _i2.conditionForm,
                ),
              )
            ],
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'highlight',
        children: [
          _i1.WidgetbookFolder(
            name: 'presentation',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'HighlightCreatePage',
                useCase: _i1.WidgetbookUseCase(
                  name: 'HighlightCreatePage',
                  builder: _i3.highlightCreatePage,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'HighlightCreatePageTile',
                useCase: _i1.WidgetbookUseCase(
                  name: 'HighlightCreatePageTile',
                  builder: _i4.highlightCreatePageTile,
                ),
              ),
              _i1.WidgetbookComponent(
                name: 'HighlightPageListTile',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'failure',
                    builder: _i5.highlightPageListTileFailure,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'inProgress',
                    builder: _i5.highlightPageListTileInProgress,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'pending',
                    builder: _i5.highlightPageListTile,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'success',
                    builder: _i5.highlightPageListTileSuccess,
                  ),
                ],
              ),
              _i1.WidgetbookLeafComponent(
                name: 'HighlightTypeLabel',
                useCase: _i1.WidgetbookUseCase(
                  name: 'HighlightTypeLabel',
                  builder: _i6.highlightTypeLabel,
                ),
              ),
            ],
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'onboarding',
        children: [
          _i1.WidgetbookFolder(
            name: 'presentation',
            children: [
              _i1.WidgetbookComponent(
                name: 'OnboardingPage',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'OnboardingPage',
                    builder: _i7.onboardingPage,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'assistant',
                    builder: _i8.onboardingPageBodyAssistant,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'highlight',
                    builder: _i9.onboardingPageBodyHighlight,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'lets start',
                    builder: _i10.onboardingPageBodyLetsStart,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'name',
                    builder: _i11.onboardingPageBodyName,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'privacy',
                    builder: _i12.onboardingPageBodyPrivacy,
                  ),
                ],
              )
            ],
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'reminder',
        children: [
          _i1.WidgetbookFolder(
            name: 'presentation',
            children: [
              _i1.WidgetbookComponent(
                name: 'ReminderPage',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'condition',
                    builder: _i13.reminderPageCondition,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'highlight',
                    builder: _i13.reminderPageHighlight,
                  ),
                ],
              )
            ],
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'startup',
        children: [
          _i1.WidgetbookFolder(
            name: 'presentation',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'AppStartupErrorWidget',
                useCase: _i1.WidgetbookUseCase(
                  name: 'AppStartupErrorWidget',
                  builder: _i14.startupPageError,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'AppStartupLoadingWidget',
                useCase: _i1.WidgetbookUseCase(
                  name: 'AppStartupLoadingWidget',
                  builder: _i14.startupPage,
                ),
              ),
            ],
          )
        ],
      ),
    ],
  )
];
