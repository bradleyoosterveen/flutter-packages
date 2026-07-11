import 'dart:async';

import 'package:async_keyed_cache/async_keyed_cache.dart';
import 'package:test/test.dart';

void main() async {
  group('AsyncKeyedCache.invalidate().unitTest', () {
    test('should invalidate the cache', () async {
      final handler = AsyncKeyedCache();
      const key = 'key';
      handler.completers[key] = Completer<DateTime>();

      expect(handler.completers.isEmpty, false);

      handler.invalidate(key);

      expect(handler.completers.isEmpty, true);
    });
  });
}
