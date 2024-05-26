import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generate_repo.g.dart';

@riverpod
String gState(GStateRef ref) {
  return 'Hello, you motherfucker!';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(const Duration(seconds: 3));

  return 10;
}

@Riverpod(
  keepAlive: true,
)
Future<int> gStateSpotFuture(GStateSpotFutureRef ref) async {
  await Future.delayed(const Duration(seconds: 3));

  return 100;
}

@riverpod
int gStateMultiply(
  GStateMultiplyRef ref, {
  required int num1,
  required int num2,
}) {
  return num1 * num2;
}
