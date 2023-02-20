import 'package:agraja/screens/1.User%20Login/utilis/utilis.dart';
import 'package:agraja/screens/3.%20Emergency%20Dial/EmergencyContact/contact-page.dart';
import 'package:agraja/screens/3.%20Emergency%20Dial/EmergencyContact/contactsm.dart';
import 'package:agraja/screens/3.%20Emergency%20Dial/EmergencyContact/db_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';

class AddContactsPage extends StatefulWidget {
  const AddContactsPage({super.key});

  @override
  State<AddContactsPage> createState() => _AddContactsPageState();
}

class _AddContactsPageState extends State<AddContactsPage> {
  Size screenSize = utilis().getscreenSize();
  DatabaseHelper databasehelper = DatabaseHelper();
  List<TContact>? contactList;
  int count = 0;

  void showList() {
    Future<Database> dbFuture = databasehelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<TContact>> contactListFuture =
          databasehelper.getContactList();
      contactListFuture.then((value) {
        setState(() {
          this.contactList = value;
          this.count = value.length;
        });
      });
    });
  }

  void deleteContact(TContact contact) async {
    int result = await databasehelper.deleteContact(contact.id);
    if (result != 0) {
      Fluttertoast.showToast(msg: "contact removed succesfully");
      showList();
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (contactList == null) {
      contactList = [];
    }
    return OutlinedButton(
              onPressed: () async {
                bool result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactsPage(),
                    ));
                if (result == true) {
                  showList();
                }
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1.0, color: Colors.pink),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.001,
                          ),
                          Text(
                            'Add Emergency Contact',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                          ListView.builder(
                            // shrinkWrap: true,
                            itemCount: count,
                            itemBuilder: (BuildContext context, int index) {
                                  child: ListTile(
                                    title: Text(contactList![index].name),
                                    trailing: Container(
                                      width: screenSize.width * 0.3,
                                      child: Column(
                                        children: [
                                          IconButton(
                                              onPressed: () async {
                                                await FlutterPhoneDirectCaller
                                                    .callNumber(
                                                        contactList![index]
                                                            .number);
                                              },
                                              icon: Icon(
                                                Icons.call,
                                                color: Colors.red,
                                              )),
                                          IconButton(
                                              onPressed: () {
                                                deleteContact(
                                                    contactList![index]);
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              )),
                                        ],
                                      ),
                                    ),
                                );
                            },
                          ),
                        ],
                      ),
                    ),
                ),
              );

  }
}
