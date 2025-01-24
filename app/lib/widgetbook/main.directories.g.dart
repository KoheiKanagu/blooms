// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:blooms/features/highlight/presentation/highlight_create_page.dart'
    as _i2;
import 'package:blooms/features/highlight/presentation/highlight_create_page_tile.dart'
    as _i3;
import 'package:blooms/features/highlight/presentation/highlight_page_list_tile.dart'
    as _i4;
import 'package:blooms/features/highlight/presentation/highlight_type_label.dart'
    as _i5;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'features',
    children: [
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
                  builder: _i2.highlightCreatePage,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'HighlightCreatePageTile',
                useCase: _i1.WidgetbookUseCase(
                  name: 'HighlightCreatePageTile',
                  builder: _i3.highlightCreatePageTile,
                ),
              ),
              _i1.WidgetbookComponent(
                name: 'HighlightPageListTile',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'failure',
                    builder: _i4.highlightPageListTileFailure,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'inProgress',
                    builder: _i4.highlightPageListTileInProgress,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'pending',
                    builder: _i4.highlightPageListTile,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'success',
                    builder: _i4.highlightPageListTileSuccess,
                  ),
                ],
              ),
              _i1.WidgetbookLeafComponent(
                name: 'HighlightTypeLabel',
                useCase: _i1.WidgetbookUseCase(
                  name: 'HighlightTypeLabel',
                  builder: _i5.highlightTypeLabel,
                ),
              ),
            ],
          )
        ],
      )
    ],
  )
];
