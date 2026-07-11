import 'dart:async';

import 'package:async_keyed_cache/async_keyed_cache.dart';
import 'package:test/test.dart';

void main() async {
  group('AsyncKeyedCache.scheduleInvalidate().unitTest', () {
    test('should invalidate the cache after the given duration', () async {
      final handler = AsyncKeyedCache();
      const key = 'key';

      handler.completers[key] = Completer<DateTime>();

      handler.scheduleInvalidate(key, const Duration(milliseconds: 10));

      expect(handler.completers.isEmpty, false);

      await Future.delayed(const Duration(milliseconds: 100));

      expect(handler.completers.isEmpty, true);
    });
  });
}
