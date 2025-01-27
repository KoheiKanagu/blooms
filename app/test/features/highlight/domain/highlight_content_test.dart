import 'package:blooms/features/highlight/domain/highlight_content.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'fromJson',
    () {
      test('private', () {
        final json = {
          'style': 'private',
          'subjectiveTrend': 'subjectiveTrend',
          'objectiveTrend': 'objectiveTrend',
          'analysisResult': 'analysisResult',
          'advice': 'advice',
          'abstract': 'abstract',
        };

        final expected = HighlightContent.fromJson(json);

        expect(
          expected,
          const HighlightContent.private(
            subjectiveTrend: 'subjectiveTrend',
            objectiveTrend: 'objectiveTrend',
            analysisResult: 'analysisResult',
            advice: 'advice',
            abstract: 'abstract',
          ),
        );
      });

      test('professional', () {
        final json = {
          'style': 'professional',
          'analysisResults': ['analysisResults'],
          'abstract': 'abstract',
        };

        final expected = HighlightContent.fromJson(json);

        expect(
          expected,
          const HighlightContent.professional(
            analysisResults: ['analysisResults'],
            abstract: 'abstract',
          ),
        );
      });

      test('不明なStyleはHighlightContentEmptyになること', () {
        final json = {
          'style': 'unknown',
          'aaa': 'bbb',
        };

        final expected = HighlightContent.fromJson(json);

        expect(
          expected,
          const HighlightContent.empty(),
        );
      });
    },
  );
}
