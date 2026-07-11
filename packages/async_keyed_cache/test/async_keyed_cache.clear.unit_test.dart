import 'dart:async';

import 'package:async_keyed_cache/async_keyed_cache.dart';
import 'package:test/test.dart';

void main() async {
  group('AsyncKeyedCache.clear().unitTest', () {
    test('should invalidate the cache', () async {
      final handler = AsyncKeyedCache();
      handler.completers['one'] = Completer<DateTime>();
      handler.completers['two'] = Completer<DateTime>();

      expect(handler.completers.isEmpty, false);
      expect(handler.completers.length, 2);

      handler.clear();

      expect(handler.completers.isEmpty, true);
    });
  });
}
