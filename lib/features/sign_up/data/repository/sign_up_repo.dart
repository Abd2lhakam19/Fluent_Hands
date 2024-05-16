import 'package:fluent_hands/core/api/api_consumer.dart';

class SingUpRepo {
  ApiConsumer api;
  SingUpRepo({required this.api});
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {}
}
