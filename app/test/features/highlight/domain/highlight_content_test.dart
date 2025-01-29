import 'package:blooms/features/highlight/domain/highlight_content.dart';
import 'package:blooms/features/highlight/domain/highlight_period.dart';
import 'package:blooms/features/highlight/domain/highlight_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'fromJson',
    () {
      test('private', () {
        final now = Timestamp.now();

        final json = {
          'style': 'private',
          'startAt': now,
          'period': 'past21days',
          'subjectiveTrend': 'subjectiveTrend',
          'objectiveTrend': 'objectiveTrend',
          'analysisResult': 'analysisResult',
          'advice': 'advice',
          'abstract': 'abstract',
          'state': 'inProgress',
          'promptFileUri': 'promptFileUri',
        };

        final expected = HighlightContent.fromJson(json);

        expect(
          expected,
          HighlightContent.private(
            startAt: now,
            period: HighlightPeriod.past21days,
            subjectiveTrend: 'subjectiveTrend',
            objectiveTrend: 'objectiveTrend',
            analysisResult: 'analysisResult',
            advice: 'advice',
            abstract: 'abstract',
            state: HighlightState.inProgress,
            promptFileUri: 'promptFileUri',
          ),
        );
      });

      test('professional', () {
        final now = Timestamp.now();

        final json = {
          'style': 'professional',
          'startAt': now,
          'period': 'past21days',
          'analysisResults': ['analysisResults'],
          'abstract': 'abstract',
          'state': 'inProgress',
          'promptFileUri': 'promptFileUri',
        };

        final expected = HighlightContent.fromJson(json);

        expect(
          expected,
          HighlightContent.professional(
            startAt: now,
            period: HighlightPeriod.past21days,
            analysisResults: ['analysisResults'],
            abstract: 'abstract',
            state: HighlightState.inProgress,
            promptFileUri: 'promptFileUri',
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
