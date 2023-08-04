import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'main.dart';

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
    // TODO: implement initState
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
    contacts = await ContactsService.getContacts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < narrowScreenWidthThreshold) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Select your contact!'),
          ),
          body: isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onLongPress: () {
                        setState(() {
                          secreteNum = contacts[index].phones![0].value!;
                        });
                      },
                      child: ListTile(
                        leading: Container(
                          // ignore: sort_child_properties_last
                          child: Text(
                            contacts[index].givenName![0],
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          height: 30,
                          width: 30,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        title: Text(contacts[index].displayName.toString()),
                        subtitle: Text('Company :  ${contacts[index].company.toString()}'),
                      ),
                    );
                  },
                  itemCount: contacts.length,
                ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text('Select the contact!'),
          ),
          body: SafeArea(
            bottom: false,
            top: false,
            child: Row(
              children: <Widget>[
                ListView(),
              ],
            ),
          ),
        );
      }
    });
  }
}
