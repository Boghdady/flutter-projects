import 'dart:async';

class ValidatorMixin {
  // Validate email
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (emailValue, emailSink) {
    if (emailValue.contains('@')) {
      emailSink.add(emailValue);
    } else {
      emailSink.addError('Enter a valid email');
    }
  });

  // Validate password
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (passwordValue, passwordSink) {
    if (passwordValue.length >= 8) {
      passwordSink.add(passwordValue);
    } else {
      passwordSink.addError('Password must be more than 8 characters');
    }
  });
}
