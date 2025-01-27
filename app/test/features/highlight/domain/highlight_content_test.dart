import 'package:blooms/features/highlight/domain/highlight_content.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'fromJson',
    () {
      test('forOwn', () {
        final json = {
          'style': 'forOwn',
          'subjectiveTrend': 'subjectiveTrend',
          'objectiveTrend': 'objectiveTrend',
          'analysisResult': 'analysisResult',
          'advice': 'advice',
          'abstract': 'abstract',
        };

        final expected = HighlightContent.fromJson(json);

        expect(
          expected,
          const HighlightContent.forOwn(
            subjectiveTrend: 'subjectiveTrend',
            objectiveTrend: 'objectiveTrend',
            analysisResult: 'analysisResult',
            advice: 'advice',
            abstract: 'abstract',
          ),
        );
      });

      test('forProfessional', () {
        final json = {
          'style': 'forProfessional',
          'analysisResults': ['analysisResults'],
          'abstract': 'abstract',
        };

        final expected = HighlightContent.fromJson(json);

        expect(
          expected,
          const HighlightContent.forProfessional(
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
