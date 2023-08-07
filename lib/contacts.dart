// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';

var secreteNum;

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact> contacts = [];
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
    contacts = await FlutterContacts.getContacts();
    setState(() {
      isLoading = false;
    });
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
                      secreteNum = contact.phones.first;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                      child: ListTile(
                        leading: Text(
                          contact.displayName[0],
                          style: TextStyle(fontSize: 30),
                        ),
                        title: Text(contact.displayName ?? ''),
                        subtitle: Text('Company : ${contact.phones ?? ''}'),
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
