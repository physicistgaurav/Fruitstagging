// ignore_for_file: prefer_const_constructors

import 'package:fruittag/pages/mail_msg.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class Mailer {
  SmtpServer smtpServer = SmtpServer('smtp.gmail.com',
      name: 'Contact from FruiTag',
      username: 'email',
      password: 'password');

  Future<void> sendReceipt(
      String email, String name, String message, String subject) async {
    try {
      final equivalentMessage = Message()
        ..from = Address(email, name)
        ..recipients.add(Address(email))
        ..subject = subject
        ..text = message;
      await send(equivalentMessage, smtpServer);
    } catch (e) {
      print('Not sent to: $email');
    }
  }
}
