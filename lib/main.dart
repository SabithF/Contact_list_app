import 'package:contact_bud/Pages/addNewUser.dart';
import 'package:motion_toast/motion_toast.dart';
import 'DB/db_connec.dart';
import 'Pages/EditUser.dart';
import 'Pages/ViewContact.dart';
import 'package:contact_bud/Services/services.dart';
import 'package:flutter/material.dart';

import 'models/AddUser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      //remove debug lable
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        // scaffoldBackgroundColor:  Colors.black87,
      ),
      home: const MyHomePage(),
    );
  }
}

// creating a Stateful widget
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // creating a List variable in user model
  late List<User> _contactList = <User>[];

  // accessing user service
  final _userService = UserService();

  // get user detials
  getAllUserDetails() async {
    var users = await _userService.readAllUsers();
    _contactList = <User>[];

    // Inserting the details into the model
    users.forEach((user) {
      setState(() {
        var userModel = User();
        userModel.id = user['id'];
        userModel.fname = user['fname'];
        userModel.lname = user['lname'];
        userModel.contact = user['contact'];

        _contactList.add(userModel);
      });
    });
  }

  // init state used ot load the function when the foam is gets loaded
  @override
  void initState() {
    getAllUserDetails();
    super.initState();
  }

  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _deleteFormDialog(BuildContext context, userId) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Delete Contact?',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // foreground
                      backgroundColor: Colors.red),
                  onPressed: () async {
                    var result = await _userService.deleteUser(userId);
                    if (result != null) {
                      Navigator.pop(context);
                      getAllUserDetails();
                      _showSuccessSnackBar('Contact Deleted');
                    }
                  },
                  child: const Text('Delete')),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // foreground
                      backgroundColor: Colors.teal),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Buddy"),
      ),



      body:

      ListView.builder(
          itemCount: _contactList.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0,0.0),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.10)),
              color: Color.fromARGB(255, 3, 21, 75),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewContact(
                            user: _contactList[index],
                          )));
                },
                leading: const Icon(Icons.person,
                    color: Colors.white, ),

                title: Row(

                  children:<Widget>[
                  Text(_contactList[index].fname ?? '',textAlign: TextAlign.left,style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
                    // Spacer(),
                    // const SizedBox(width: 5,),
                    // Text(_contactList[index].lname ?? '',style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500, ),)
                  ],),

                subtitle: Text(_contactList[index].contact ?? '', style: TextStyle(color: Colors.white)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditUser(
                                    user: _contactList[index],
                                  ))).then((data) {
                            if (data != null) {
                              getAllUserDetails();
                              _showSuccessSnackBar('Contact Updated');
                            }
                          });
                          ;
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.green,
                        )),
                    IconButton(
                        onPressed: () {
                          _deleteFormDialog(context, _contactList[index].id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                ),
              ),
            );
          }),

      // creating a floating action button
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () {

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNewUser()))
              .then((data) {
            if (data != null)
            {
              getAllUserDetails();

              _showSuccessSnackBar('Contact created');
            }
          });
        },
        icon: const Icon(Icons.add),
        label: Text('Create Contact'),
      ),
    );
  }
}
