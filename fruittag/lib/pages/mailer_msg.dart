import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class Mailer {
  SmtpServer smtpServer = SmtpServer('smtp.gmail.com',
      name: 'Contacr from FruiTag',
      username: 'gr02442918@student.ku.edu.np',
      password: 'enter email and pswd');

  Future<void> sendReceipt(
      String email, String name, String message, String subject) async {
    try {
      final equivalentMessage = Message()
        ..from = Address(email, name)
        ..recipients.add(const Address('gauravrijal03@gmail.com'))
        ..subject = subject
        ..text = message;
      await send(equivalentMessage, smtpServer);
    } catch (e) {
      print('Not sent to: $email');
    }
  }
}
