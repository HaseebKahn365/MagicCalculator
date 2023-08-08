// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:permission_handler/permission_handler.dart';

var secreteNum;

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<PhoneContact> contacts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getContactPermission();
  }

  void getContactPermission() async {
    if (await Permission.contacts.isGranted) {
      fetchContacts();
    } else {
      await Permission.contacts.request();
    }
  }

  void fetchContacts() async {
    final result = await FlutterContactPicker.pickPhoneContact();
    if (result != null) {
      contacts = [result];
    }
    setState(() {
      isLoading = false;
    });
  }

  String _getPhoneNumber(PhoneContact contact) {
    if (contact.phoneNumber != null) {
      return contact.phoneNumber!.number.toString();
    } else {
      return '(none)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select your contact!'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return GestureDetector(
                  onLongPress: () {
                    setState(() {
                      secreteNum = contact.phoneNumber!.number;
                      //show success snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text('Contact selected!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                      child: ListTile(
                        leading: Text(
                          contact.fullName![0],
                          style: TextStyle(fontSize: 30),
                        ),
                        title: Text(contact.fullName![index]),
                        subtitle: Text('Phone number: ${_getPhoneNumber(contact)}'),
                        onTap: () {},
                        splashColor: Colors.purple[50],
                        hoverColor: Colors.purple[100],
                        enabled: true,
                        selected: true,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      elevation: 20,
                      shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                );
              },
              itemCount: contacts.length,
            ),
    );
  }
}
