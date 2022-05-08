// ignore_for_file: prefer_const_constructors, unnecessary_const, unused_import

import 'package:flutter/material.dart';
import 'package:fruittag/pages/mailer_msg.dart';
import 'dart:convert';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

final nameController = TextEditingController();
final subjectController = TextEditingController();
final emailController = TextEditingController();
final messageController = TextEditingController();

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
                  controller: nameController,
                  decoration: const InputDecoration(
                      icon: const Icon(Icons.account_circle),
                      border: OutlineInputBorder(),
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
                      border: OutlineInputBorder(),
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
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                      labelText: 'Email'),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: messageController,
                  maxLines: 6,
                  decoration: const InputDecoration(
                      icon: const Icon(Icons.message),
                      border: OutlineInputBorder(),
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
                        nameController.text,
                        messageController.text,
                        subjectController.text);
                    emailController.text = "";
                    nameController.text = "";
                    messageController.text = "";
                    subjectController.text = "";
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      primary: Color.fromRGBO(14, 167, 129, 1),
                      fixedSize: Size(200, 50)),
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
