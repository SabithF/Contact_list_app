// ignore_for_file: prefer_const_constructors

import 'package:contact_bud/Services/services.dart';
import 'package:contact_bud/models/AddUser.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewUser extends StatefulWidget {
  const AddNewUser({Key? key}) : super(key: key);

  @override
  State<AddNewUser> createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  // Creating controllers
  var _userFNameCont = TextEditingController();
  var _userSNameCont = TextEditingController();
  var _userCnumberCont = TextEditingController();
  // var _userImg;


  // validation
  // bool _validateFName = false;
  bool _validateFN = false;
  bool _validateLN = false;
  bool _validateCN = false;

  var _userServices = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create contact"),
      ),
      body: SingleChildScrollView(
        // creating the form
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,


              // ignore: duplicate_ignore
              children: [
                const Text(
                  'Add a new contact',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.orange,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10.0,
                ),

                Container(
                  alignment: Alignment.center,

                  margin:  EdgeInsets.only(top: 5),
                  height:120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(20),
                    color: Colors.deepOrange,),
                  child:Center(
                    child: Icon(Icons.person,
                    color: Colors.white,
                    size: 80),
                  ),

                //   child:CircleAvatar(
                //     backgroundImage: AssetImage('images/proimg.png'),
                //
                //   radius: 50,
                //
                // ),
                //   Padding(
                //     padding: const EdgeInets.all(8.0),
                //      child: RaisedButton(
                //        onPressed: (){
                //          PickImage()
                //        },
                //
                //      ),
                //   ),

                ),
                //     // headerSave Button


                // to add padding btwn

                // ignore: prefer_const_constructors
                const SizedBox(
                  height: 20.0,
                ),
                // Input fields
                SizedBox(
                  // width: 100.0,
                  child: TextField(
                    style: TextStyle(
                        fontSize: 18.0,
                        height: 1.0,
                        color: Color.fromARGB(255, 3, 21, 75)),
                    controller: _userFNameCont,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Name',
                        labelText: 'Name',
                        errorText: _validateFN ? 'Please input details' : null),
                  ),
                ),
                // Second name

                SizedBox(
                  height: 10.0,
                ),
                // Input fields
                SizedBox(
                  // width: 100.0,
                  child: TextField(
                    style: TextStyle(
                        fontSize: 18.0,
                        height: 1.0,
                        color: Color.fromARGB(255, 3, 21, 75)),
                    controller: _userSNameCont,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'E-Mail',
                        labelText: 'E-Mail',
                        errorText: _validateLN ? 'Please input details' : null),
                  ),
                ),
                // Contact Number
                SizedBox(
                  height: 10.0,
                ),
                // Input fields
                SizedBox(
                  // width: 100.0,
                  child: TextField(
                    style: TextStyle(
                        fontSize: 18.0,
                        height: 1.0,
                        color: Color.fromARGB(255, 243, 8, 8)),
                    controller: _userCnumberCont,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Contact Number',
                        labelText: 'Contact Number',
                        errorText: _validateCN ? 'Please input details' : null),
                  ),
                ),
                // Creating action button
                const SizedBox(
                  height: 20.0,
                ),
                //
                //profile pic

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
                            backgroundColor: Colors.green[900],
                            textStyle: const TextStyle(fontSize: 18)),
                        onPressed: () async {
                          // validatin if the text feilds are empty
                          setState(() {
                            _userFNameCont.text.isEmpty
                                ? _validateFN = true
                                : _validateFN = false;
                            _userSNameCont.text.isEmpty
                                ? _validateLN = true
                                : _validateLN = false;
                            _userCnumberCont.text.isEmpty
                                ? _validateCN = true
                                : _validateCN = false;
                          });
                          // storing the data into DB when the user has filled all the data
                          if (_validateFN == false &&
                              _validateLN == false &&
                              _validateCN == false) {
                            // storing the data
                            //creating a object to access the model
                            var _user = User();
                            _user.fname = _userFNameCont.text;
                            _user.lname = _userSNameCont.text;
                            _user.contact = _userCnumberCont.text;
                            // _user.img= _userImg.text;
                            var result = await _userServices.SaveUser(_user);
                            Navigator.pop(context, result);
                            // print(result);
                          }
                        },
                        child: const Text('Save'))
                ),
                SizedBox(
                  height: 5.0,
                ),
                // Clear Button
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
                            backgroundColor: Color.fromARGB(255, 228, 70, 8),
                            textStyle: const TextStyle(fontSize: 18)),
                        onPressed: () {
                          // to clear data in the field on click of clear button
                          _userFNameCont.text = '';
                          _userSNameCont.text = '';
                          _userCnumberCont.text = '';
                        },
                        child: const Text('Clear'))
                  // ],
                )
              ],
            ),
          )),
    );
  }
}
