import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:higepiyoskii/screens/post_screen.dart';
import 'package:higepiyoskii/screens/test_screen.dart';
import 'package:uuid/uuid.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;


// String name = 'ひげピヨスキー';
// Payload _payLoad;
final uuidee = Uuid();
final result = uuidee.v4();
// final List<Permissionss> list = {
//   "write:notes",
//   "write:following",
//   "read:drive",
// } as List<Permissionss>;


// class Payload{
//     final String session;
//     final String name;
//     final String icon;

//     Payload({this.session, this.name, this.icon});

//     factory Payload.fromJson(Map<String, dynamic> json)  {
//     return Payload(
//   session: json["sessionid"],
//   name: json["name"],
//   icon: json[""],

//     );
//   }
//   }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: true,
      title: 'ひげピヨスキー',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      home: MyHomePage(title: ''),
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

class _MyHomePageState extends State<MyHomePage> {


// static Uuid uuid;



@override
  void initState() {
    super.initState();
   
  }
  

  // final callbackUrlScheme = '';
  // var a = uuid.v4();

  // String get result => '';

  

  

  // final url = Uri.https("misskey.io", "/api/miauth", );

  


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: NeumorphicAppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                height: 140,
                width: double.maxFinite,
                child: Neumorphic(
                  // color: Colors.transparent,
                  // elevation: 5,
                  child: NeumorphicText('＾ｑ＾',
                  style: NeumorphicStyle(
                    depth: 4,
                    color: Colors.black38,
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 60,
                  ),
                  ),
                ),
                
              )
            ),
          ],
          
        ),
      ),
      floatingActionButton: NeumorphicButton(
        onPressed: () async {
          
          // print(result.toString());
          //  final Map<String, dynamic> _permission = Map<String, dynamic>();

          //   _permission["write:notes"] = "writeNotes";
          //   _permission["write:following"] = "writeFollowing";
          //   _permission["read:drive"] = "readDrive";

          //   var hage = jsonDecode(_permission.toString());


          // final Map<String, dynamic>_payload = Map<String, dynamic>();
          // _payload["sessionid"] = result;
          // _payload["name"] = name;
          // _payload["permission"] = hage;

          // var hoge = jsonDecode(_payload.toString());

          // // final result2 = Uri.encodeFull(_payload.toString());
          // final Map<String, String> _payload2 = Map<String, String>();
  //         Future<Access> _getUrl() async {
  //           var url = "https://misskey.io/miauth";
  //           var request = new Access(sessionId: result, name: "name", permission: test);
  //           final response = await http.post(url,
  //           body: json.encode(request.toJson()),
  //           headers: {"Content-Type": "application/json"}
  //           );

  //           if (response.statusCode == 200) {
  //             print(response.body);
  //   // If server returns an OK response, parse the JSON
  //   return Access.fromJson(json.decode(response.body));
  // } else {
  //   // If that response was not OK, throw an error.
  //   throw Exception('Failed to load post');
  // }
  //         }


          


            

          
          
          
          String urll = "https://misskey.io/miauth/$result?name=higePiyoSkii&permission=write%3Anotes,write%3Afollowing,read%3Adrive";
          var r = Uri.decodeFull(urll);
          print(r);
          
          String name = "ひげピヨスキー";
          String writeNotes = "write:notes";
          String writeFollowing = "write:following";
          String readDrive = "read:drive";
          List<String> permissions = [writeNotes, writeFollowing, readDrive];
          print(permissions);

          String encodeMap(Map data) {
  return data.keys.map((key) => "${Uri.encodeComponent(key)}=${Uri.encodeComponent(data[key])}").join(",");
}
          // String callbackUrl = "https://misskey.io/callback";

        

          Map<String, dynamic> map = Map<String, dynamic>();
          map["name"] = name;
          map["permission"] = "$writeNotes, $writeFollowing, $readDrive";
          
          
          Uri uri = Uri(
            scheme: "https",
            host: "misskey.io",
            path: "miauth/$result",
            queryParameters: map

          );
          print(uri);
          // final u = encodeMap(uri);
          // print(uri);
          // var e = Uri.encodeFull(map.toString());
          // print(e);
          // print(response.data.toString());
          // final Map<String, String> map2 = new Map<String, String>.from(u);
          // final url = Uri.https("misskey.io", "/miauth", u
          //  );
          
          
          final callbackUrlScheme = "";
          final result2 = await FlutterWebAuth.authenticate(url: uri.toString(), callbackUrlScheme: callbackUrlScheme);
          // if (result2.isNotEmpty)
          
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => AuthDone()));
          final response = await http.post("https://misskey.io/api/miauth/$result/check").then((context) => print(context));
          
          
          // final accessToken = jsonDecode(response.body)["accessToken"] as String; 
          // print(accessToken.toString());
          // print(accessToken);
          // Future<Access> getUrl() async {
          //   final response = await http.get(
          //     result2,
          //     headers: {'content-type': 'application/json'},

          //   );
          //   final responseJson = json.decode(response.body);
          //   return Access.fromJson(responseJson);
          //   // if (response.statusCode != 200) {
          //   //   return print(responseJson.toString());
          //   // }
          //   // print(responseJson);
          // }
          },
          
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // This trailing comma makes auto-formatting nicer for build methods.
    );


  }}

//   class Access {
//   final String sessionId;
//   final String name;
//   // final String icon;
//   // final String callback;
//   final List<Permissionss> permission;
  
//     Access({this.sessionId, this.name, this.permission});
  
//     Access.fromJson(Map<String, dynamic> json)
  
//       : sessionId = json['sessionid'],
//         name = json['higePiyoSkii'],
//         // callback = json['callback'],
//         permission = json['permission'];
  
  
//     Map<String, dynamic> toJson() => {
//       'sessionid': sessionId,
//       'name': name,
//       // 'callback': callback
//       'permission': permission,
  
//     };
    
//   }
  
//   class Permissionss {
    

//     final String writeNotes;
//     final String writeFollowing;
//     final String readDrive;

//   Permissionss({this.writeNotes, this.writeFollowing, this.readDrive});

//   Permissionss.fromJson(Map<String, dynamic> json)

//   : writeNotes = json['write:notes'],
//   writeFollowing = json['write:following'],
//   readDrive = json['read:drive'];

//   Map<String, dynamic> toJson() => {
//     'write:notes': writeNotes,
//     'write:following': writeFollowing,
//     'read:drive': readDrive,
//   };

     
// }

  
  