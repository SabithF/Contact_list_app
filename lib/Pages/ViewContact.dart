import 'package:contact_bud/models/AddUser.dart';
import 'package:flutter/material.dart';
import 'package:contact_bud/Pages/EditUser.dart';

class ViewContact extends StatefulWidget {
  final User user;

  const ViewContact({Key? key, required this.user}) : super(key: key);

  @override
  State<ViewContact> createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewContact> {
  late List<User> _contactList = <User>[];  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contact Buddy"),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Contact Details",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.indigo,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Name:',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(widget.user.fname ?? '',
                        style: TextStyle(fontSize: 20)),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 5),
                  //   child: Text(widget.user.lname ?? '',
                  //       style: TextStyle(fontSize: 20)),
                  // ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Contact',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(widget.user.contact ?? '',
                        style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 40,
                  child:

                  // Row(
                  //   children: [
                  TextButton(


                      style: TextButton.styleFrom(

                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.10)),

                        // use foregroundColor insted of primary
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black87,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {Navigator.pop(context);
                        // to clear data in the field on click of clear button

                      },
                      child: const Text('Back')),),
                    SizedBox(
                      height: 10.0,
                    ),
          // SizedBox(
          //   width: double.infinity,
          //   height: 40,
          //   child:
          //     TextButton(
          //
          //
          //         style: TextButton.styleFrom(
          //
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(10.10)),
          //
          //             // use foregroundColor insted of primary
          //             foregroundColor: Colors.white,
          //             backgroundColor: Colors.deepOrange,
          //             textStyle: const TextStyle(fontSize: 15)),
          //         onPressed: () {
          //                         Navigator.push(
          //                         context,
          //                         MaterialPageRoute(
          //                         builder: (context) => EditUser(
          //                         user: _contactList[index],
          //                         ))).then((data) {
          //                         if (data != null) {
          //                         getAllUserDetails();
          //                         _showSuccessSnackBar('Contact Updated');
          //                         }
          //                         });
          //                         ;
          //                         },
          //           // to clear data in the field on click of clear button
          //
          //
          //         child: const Text('Edit')),),


              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     const Text('Description',
              //         style: TextStyle(
              //             color: Colors.teal,
              //             fontSize: 16,
              //             fontWeight: FontWeight.w600)),
              //     const SizedBox(
              //       height: 20,
              //     ),
              //     Text(widget.user.contact ?? '',
              //         style: const TextStyle(fontSize: 16)),
              //   ],
              // )
            ],
          ),
        ));
  }
}
