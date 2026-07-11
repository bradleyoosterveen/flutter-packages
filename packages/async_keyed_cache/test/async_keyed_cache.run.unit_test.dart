import 'package:async_keyed_cache/async_keyed_cache.dart';
import 'package:test/test.dart';

void main() async {
  group('AsyncKeyedCache.run().unitTest', () {
    test('should return the result of the action', () async {
      final result = await AsyncKeyedCache().run<String>(
        key: 'key',
        action: () async => 'result',
      );

      expect(result, 'result');
    });
    test(
      'should return the result of the action and invalidate the cache',
      () async {
        final handler = AsyncKeyedCache();
        const key = 'key';
        final now = DateTime.now();

        final firstResult = await handler.run<DateTime>(
          key: key,
          action: () async => now,
        );

        expect(firstResult, now);

        final nowInOneHour = now.add(const Duration(hours: 1));

        final secondResult = await handler.run<DateTime>(
          key: key,
          action: () async => nowInOneHour,
        );

        expect(secondResult, nowInOneHour);
        expect(handler.completers.isEmpty, true);
      },
    );
    test(
      'should return the same result when called again with the same key and a duration of non-zero',
      () async {
        final handler = AsyncKeyedCache();
        const key = 'key';
        final now = DateTime.now();

        final firstResult = await handler.run<DateTime>(
          key: key,
          action: () async => now,
          duration: const Duration(hours: 1),
        );

        expect(firstResult, now);
        expect(handler.completers.isEmpty, false);

        final secondResult = await handler.run<DateTime>(
          key: key,
          action: () async => DateTime.now().add(const Duration(hours: 1)),
          duration: const Duration(hours: 1),
        );

        expect(secondResult, now);
      },
    );
    test(
      'should return the same exception when called again with the same key and a duration of non-zero',
      () async {
        final handler = AsyncKeyedCache();
        const key = 'key';
        final exception = Exception();

        final firstResult = handler.run<DateTime>(
          key: key,
          action: () async => throw exception,
          duration: const Duration(hours: 1),
        );

        expect(firstResult, throwsA(exception));

        final secondResult = handler.run<DateTime>(
          key: key,
          action: () async => DateTime.now(),
          duration: const Duration(hours: 1),
        );

        expect(secondResult, throwsA(exception));
      },
    );
    test('should properly throw an error on exception', () async {
      final handler = AsyncKeyedCache();
      const key = 'key';

      final result = handler.run<DateTime>(
        key: key,
        action: () async => throw Exception(),
      );

      expect(result, throwsException);
    });
  });
}
