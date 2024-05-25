import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generate_repo.g.dart';

@riverpod
String gState(GStateRef ref) {
  return 'Hello, you motherfucker!';
}
