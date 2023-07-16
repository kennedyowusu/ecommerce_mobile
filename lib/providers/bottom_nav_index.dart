import 'package:flutter_riverpod/flutter_riverpod.dart';

StateProvider<int> currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});
