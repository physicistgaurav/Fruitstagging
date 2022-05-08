// ignore_for_file: prefer_const_constructors, unnecessary_const, unused_import

import 'package:flutter/material.dart';
import 'package:fruittag/pages/mailer_msg.dart';
import 'dart:convert';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

final nameContoller = TextEditingController();
final subjectController = TextEditingController();
final emailController = TextEditingController();
final messageController = TextEditingController();

// Future sendEmail() async {
//   final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
//   const serviceId = "service_q081tc3";
//   const templateId = "template_8fovfxp";
//   const userId = "o0-kQ2z897tgFKWr9";
//   final response = await http.post(url,
//       headers: {
//         'origin': 'http://localhost',
//         'Content-Type': 'application/json'
//       },
//       body: json.encode({
//         "service-id": serviceId,
//         "template_id": templateId,
//         "user_id": userId,
//         "template_params": {
//           "name": nameContoller.text,
//           "subject": subjectController.text,
//           "message": messageController.text,
//           "user_email": emailController.text
//         }
//       }));
//   return response.statusCode;
// }

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Contact-form"),
          centerTitle: true,
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color.fromRGBO(14, 167, 129, 1),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(25, 40, 25, 0),
          child: SingleChildScrollView(
            child: Form(
                child: Column(
              children: [
                TextFormField(
                  controller: nameContoller,
                  decoration: const InputDecoration(
                      icon: const Icon(Icons.account_circle),
                      hintText: 'Name',
                      labelText: 'Name'),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: subjectController,
                  decoration: const InputDecoration(
                      icon: const Icon(Icons.subject_rounded),
                      hintText: 'Subject',
                      labelText: 'Subject'),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      icon: const Icon(Icons.email),
                      hintText: 'Email',
                      labelText: 'Email'),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: messageController,
                  decoration: const InputDecoration(
                      icon: const Icon(Icons.message),
                      hintText: 'Message',
                      labelText: 'Message'),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton.icon(

                  onPressed: () {
                    Mailer().sendReceipt(
                        emailController.text,
                        nameContoller.text,
                        messageController.text,
                        subjectController.text);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      primary: Color.fromRGBO(14, 167, 129, 1),
                      fixedSize: Size(200, 50)
                  ),
                  icon: Icon(Icons.send),
                  label: Text(
                    'Send Message',
                    style: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
