import { getDateRange } from '../../../../src/features/highlight/application/updateHighlightContent';

describe('getDateRange', () => {
  // 2025-01-15 12:30:00
  const baseDate = new Date(2025, 0, 15, 12, 30, 0);

  it('past1dayは正しい日付範囲を返すこと', () => {
    const { startDate, endDate } = getDateRange('past1day', baseDate);

    console.log(startDate.getTimezoneOffset());

    expect(startDate).toEqual(new Date(2025, 0, 15, 0, 0, 0));
    expect(endDate).toEqual(new Date(2025, 0, 15, 23, 59, 59));
  });

  it('past7daysは正しい日付範囲を返すこと', () => {
    const { startDate, endDate } = getDateRange('past7days', baseDate);

    expect(startDate).toEqual(new Date(2025, 0, 9, 0, 0, 0));
    expect(endDate).toEqual(new Date(2025, 0, 15, 23, 59, 59));
  });

  it('past14daysは正しい日付範囲を返すこと', () => {
    const { startDate, endDate } = getDateRange('past14days', baseDate);

    expect(startDate).toEqual(new Date(2025, 0, 2, 0, 0, 0));
    expect(endDate).toEqual(new Date(2025, 0, 15, 23, 59, 59));
  });

  it('past21daysは正しい日付範囲を返すこと', () => {
    const { startDate, endDate } = getDateRange('past21days', baseDate);

    // 去年になる
    expect(startDate).toEqual(new Date(2024, 11, 26, 0, 0, 0));
    expect(endDate).toEqual(new Date(2025, 0, 15, 23, 59, 59));
  });

  it('past28daysは正しい日付範囲を返すこと', () => {
    const { startDate, endDate } = getDateRange('past28days', baseDate);

    // 去年になる
    expect(startDate).toEqual(new Date(2024, 11, 19, 0, 0, 0));
    expect(endDate).toEqual(new Date(2025, 0, 15, 23, 59, 59));
  });
});
