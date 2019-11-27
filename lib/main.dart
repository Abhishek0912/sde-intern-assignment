import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());
class Data{
  String id;
  Data({this.id});
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Entry Management System'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}
class SecondScreen extends StatefulWidget {
  final Data data;

  SecondScreen({Key key, this.data}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _SecondScreen createState() => _SecondScreen(data);

}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _minimumpadding=5.0;
  final databaseReference = Firestore.instance;
  TextEditingController name = new TextEditingController();
  TextEditingController phoneno = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController hostname = new TextEditingController();
  TextEditingController hostemail = new TextEditingController();
  TextEditingController hostphone = new TextEditingController();
  ScrollController scroll=ScrollController();

  DateTime time;
  String id;
  Data data;
  String messagesend;
  String emailsend;


  Timer updateTimer;
  _MyHomePageState() : time = DateTime.now();

  void timerFunction(Timer timer) {
    setState(() {
      this.time = DateTime.now();
    });
  }

  @override
  void initState() {
    super.initState();
    this.updateTimer = Timer.periodic(Duration(seconds: 1), this.timerFunction);
  }

  @override
  void dispose() {
    this.updateTimer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      body: Container(
      margin: EdgeInsets.all(_minimumpadding*5),
       // margin: EdgeInsets.all(_minimumpadding*5),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Padding(
        padding: EdgeInsets.only(top: _minimumpadding,bottom: _minimumpadding),
            child:Text("Visiter Details",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold))
        ),
            Padding(
                padding: EdgeInsets.only(top: _minimumpadding,bottom: _minimumpadding),
                child:TextField(
                  controller: name,
              decoration: InputDecoration(
                labelText: 'Name',
                  hintText: 'Enter Name',
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            )),
            Padding(
                padding: EdgeInsets.only(top: _minimumpadding,bottom: _minimumpadding),
                child:TextField(
                  controller: phoneno,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Phone',
                  hintText: 'Enter Phone No.',
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            )),
            Padding(
                padding: EdgeInsets.only(top: _minimumpadding,bottom: _minimumpadding),
                child: TextField(
                  controller: email,
              decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter Email',
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            )),
            Padding(
                padding: EdgeInsets.only(top: _minimumpadding,bottom: _minimumpadding),
                child:TextField(
                  controller: address,
              decoration: InputDecoration(
                  labelText: 'Address',
                  hintText: 'Enter Address',
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            )),
            Padding(
                padding: EdgeInsets.only(top: _minimumpadding,bottom: _minimumpadding),
                child:Text("Host Details",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold))
            ),
            Padding(
              padding: EdgeInsets.only(top: _minimumpadding,bottom: _minimumpadding),
              child:TextField(
                controller: hostname,
              decoration: InputDecoration(
                  labelText: 'Hostname',
                  hintText: 'Enter Hostname',
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0)
                  )
              ),
            )),

            Padding(
                padding: EdgeInsets.only(top: _minimumpadding,bottom: _minimumpadding),
                child:TextField(
                  controller: hostemail,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Hostemail',
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: _minimumpadding,bottom: _minimumpadding),
                child:TextField(
                  controller: hostphone,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Phone',
                      hintText: 'Enter HostPhoneno.',
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                )),
          Padding(
            padding: EdgeInsets.only(top: _minimumpadding,bottom: _minimumpadding),
            child:RaisedButton(
              child: Text('Submit',
              style:TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontStyle:FontStyle.italic,
              ),),
              onPressed: (){
                if(name.text.toString().isNotEmpty&&address.text.toString().isNotEmpty&&phoneno.text.toString().isNotEmpty&&email.text.toString().isNotEmpty&&hostname.text.toString().isNotEmpty&&hostemail.text.toString().isNotEmpty&&hostphone.text.toString().isNotEmpty) {

                  createRecord();

                }
                else{
                  Fluttertoast.showToast(
                      msg: "Please Enter Details",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos:2,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }

              },
            ),
          )
          ],
        ),
      ),

    );

  }
  void createRecord() async {
    DocumentReference ref =await databaseReference.collection("visiter")
        .add({
      'Name': name.text.toString(),
      'Address': address.text.toString(),
      'Phoneno.': phoneno.text.toString(),
      'Email': email.text.toString(),
      'Hostname': hostname.text.toString(),
      'CheckInTime':this.time.toString(),
      'Hostemail':hostemail.text.toString(),
      'Hostphone':hostphone.text.toString()

    });
    
    id=ref.documentID;
    data=Data(id: id);

    Fluttertoast.showToast(
        msg: "Data added Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    messagesend=name.text.toString()+"\n"+phoneno.text.toString()+"\n"+email.text.toString()+"\n"+address.text.toString()+"\n"+this.time.toString();
    emailsend=name.text.toString()+"\n"+phoneno.text.toString()+"\n"+email.text.toString()+"\n"+address.text.toString()+"\n"+this.time.toString();
    sendsms(messagesend);
    sendemail(emailsend);
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
    return new SecondScreen(data: data);
    }));
    name.clear();
    address.clear();
    phoneno.clear();
    email.clear();
    hostname.clear();
    hostemail.clear();
    hostphone.clear();

  }
  void sendsms(String message){
    // To Send messages, access to premium API like Twillo is needed.
    // It can be implemented and used here.
  }
  void sendemail(String email){
    // To Send messages, access to premium features of Firebase is needed.
    // It can be implemented and used here.
  }

}
class _SecondScreen extends State<SecondScreen> {
  final _minimumpadding=5.0;
 final Data data;
  DateTime time;
  Timer updateTimer;
  String emailsend;
  Text name,email,address,hostname,checkout,phoneno,checkin;
  final databaseReference = Firestore.instance;
  _SecondScreen(this.data):time =DateTime.now();
  TextEditingController nname = new TextEditingController();


  void timerFunction(Timer timer) {
    setState(() {
      this.time = DateTime.now();
    });
  }

  @override
  void initState() {
    super.initState();
    this.updateTimer = Timer.periodic(Duration(seconds: 1), this.timerFunction);
  }

  @override
  void dispose() {
    this.updateTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(



      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Entry Management System'),
      ),


      body: Container(

        margin: EdgeInsets.all(_minimumpadding*5),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: _minimumpadding,bottom: _minimumpadding),

             child: StreamBuilder(
                  stream: databaseReference.collection("visiter").document(data.id).snapshots(),
                  builder:(context,snapshot) {
                    if(!snapshot.hasData) return const Text('Loading...');
                   return Column(
                     children: <Widget>[
                     name=  Text("Name:"+snapshot.data["Name"].toString(),style: new TextStyle(fontSize: 20.0)),
                      phoneno= Text("Phone No.:"+snapshot.data["Phoneno."].toString(),style: new TextStyle(fontSize: 20.0)),
                      email= Text("Email:"+snapshot.data["Email"].toString(),style: new TextStyle(fontSize: 20.0)),
                      address= Text("Address:"+snapshot.data["Address"].toString(),style: new TextStyle(fontSize: 20.0)),
                      hostname= Text("Hostname:"+snapshot.data["Hostname"].toString(),style: new TextStyle(fontSize: 20.0)),
                       checkin=Text("CheckInTime:"+snapshot.data["CheckInTime"].toString(),style: new TextStyle(fontSize: 20.0)),
                     ],
                   );
                  }),

                ),

            Padding(
              padding: EdgeInsets.only(top: _minimumpadding,bottom: _minimumpadding),
              child:RaisedButton(
                child: Text("CheckOut",
                  style:TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontStyle:FontStyle.italic,
                  ),),
                onPressed: (){
                  databaseReference.collection("visiter").document(data.id)
                      .updateData({'CheckOutTime':this.time.toString()});
                  Fluttertoast.showToast(
                      msg: "CheckOut Time added Successfully",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 2,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );

                  Navigator.pop(context);
                  emailsend=name.data+"\n"+phoneno.data+"\n"+email.data+"\n"+address.data+"\n"+hostname.data+"\n"+checkin.data+"\n"+this.time.toString();
                  sendemail(emailsend);
                },
              ),
            )

          ],
        ),
      ),

    );
  }


  void sendemail(String email){
    // To Send messages, access to premium features of Firebase is needed.
    // It can be implemented and used here.
  }


}

