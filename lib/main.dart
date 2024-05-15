// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Math_Dictionary',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Math_Dictionary'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   final FirebaseFirestore instance = FirebaseFirestore.instance;
//
//   Future<bool> insert(String key, String value) async {
//     final map = {'key': key, 'value': value};
//     var result = true;
//     await instance
//         .collection("dic")
//         .doc('a')
//         .set(map)
//         .then((value) {})
//         .onError((e, _) {
//       print(e);
//       result = false;
//     });
//     return result;
//   }
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   class MyForm extends StatefulWidget {
//   @override
//   _MyFormState createState() => _MyFormState();
//   }
//
//   class _MyFormState extends State<MyForm> {
//   final TextEditingController _eng = TextEditingController();
//   final TextEditingController _uz = TextEditingController();
//
//   void _addData(String key, String value) {
//   FirebaseFirestore.instance.collection('dic').add({
//   'en': key,
//   'uz': value,
//   }).then((value) {
//   print('Data added successfully');
//   }).catchError((error) {
//   print('Failed to add data: $error');
//   });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme
//             .of(context)
//             .colorScheme
//             .inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TextFormField(
//               controller: key,
//               decoration: InputDecoration(labelText: 'Enter your word',
//               ),
//             ),
//             TextFormField(
//               controller: value,
//               decoration: InputDecoration(labelText: 'Enter your word',
//               ),
//             )
//           ],
//         ),
//       )
//       Center(
//
//     // Center is a layout widget. It takes a single child and positions it
//     // in the middle of the parent.
//     child: Column(
//     //const MyCustomForm(),
//     // Column is also a layout widget. It takes a list of children and
//     // arranges them vertically. By default, it sizes itself to fit its
//     // children horizontally, and tries to be as tall as its parent.
//     //
//     // Column has various properties to control how it sizes itself and
//     // how it positions its children. Here we use mainAxisAlignment to
//     // center the children vertically; the main axis here is the vertical
//     // axis because Columns are vertical (the cross axis would be
//     // horizontal).
//     //
//     // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//     // action in the IDE, or press "p" in the console), to see the
//     // wireframe for each widget.
//     mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         const MyCustomForm(),
//         // Row(
//         //   crossAxisAlignment: CrossAxisAlignment.center,
//         //   children: [
//         //     Expanded(
//         //       child: const MyCustomForm(),
//         //     ),
//         //     Expanded(
//         //       child: child: const MyCustomForm(),
//         //     ),
//         //   ],
//         //
//         // ),
//
//         const Text(
//           'You have pushed the button this many times:',
//         ),
//         Text(
//           '$_counter',
//           style: Theme
//               .of(context)
//               .textTheme
//               .headlineMedium,
//         ),
//       ],
//     ),
//     ),
//     floatingActionButton: FloatingActionButton(
//     onPressed: () async {
//     instance.collection('dic').doc('a').get().then((value) {
//     print(value);
//     }).onError((error, stackTrace) {
//     print(error);
//     });
//     print(await insert('one', 'bir'));
//     },
//     tooltip: 'Increment',
//     child: const Icon(Icons.add),
//     ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
//
//
//
//
//
// class MyCustomForm extends StatelessWidget {
//   const MyCustomForm({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//     // const Padding(
//     //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//     //   child: TextField(
//     //     decoration: InputDecoration(
//     //       border: OutlineInputBorder(),
//     //       hintText: 'Enter a search word',
//     //     ),
//     //   ),
//     // ),
//     // Padding(
//     // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//     // child: TextFormField(
//     // controller: _eng,
//     // decoration: InputDecoration(
//     // labelText: 'Enter your word',
//     // ),
//     // child: TextFormField(
//     // controller: _uz,
//     // decoration: InputDecoration(
//     // labelText: 'Enter your word',
//     // ),
//     // child: TextFormField(
//     // decoration: const InputDecoration(
//     // border: UnderlineInputBorder(),
//     // labelText: 'Add your word in eng',
//     // ),
//     // ),
//     // ),
//     // Padding(
//     // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//     // child: TextFormField(
//     // decoration: const InputDecoration(
//     // border: UnderlineInputBorder(),
//     // labelText: 'Add your word in uzb',
//     // ),
//     // ),
//     // ),
//     SizedBox(height: 20),
//     ElevatedButton(
//     onPressed: () {
//     String eng = _eng.text.trim();
//
//     },
//     child: Text('Submit'),
//     )
//     ,
//     ]
//     ,
//     );
//   }
// }
//
// class MyForm extends StatefulWidget {
//   @override
//   _MyFormState createState() => _MyFormState();
// }
//
// class _MyFormState extends State<MyForm> {
//   final TextEditingController _textFieldController = TextEditingController();
//
//   void _addData(String text) {
//     FirebaseFirestore.instance.collection('dic').doc('a').
//     add({
//       'field_name': text,
//     }).then((value) {
//       print('Data added successfully');
//     }).catchError((error) {
//       print('Failed to add data: $error');
//     });
//   }
import 'package:dictionary/bloc/search_bloc.dart';
import 'package:dictionary/pages/search_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'add_word_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc()..add(GetDataSearchEvent())
        ),
      ],
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Math_Dictionary',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        // useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: SearchPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'birnarsa!',
        ),
      ),
    );
  }
}




// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//         return Scaffold(
//           appBar: AppBar(
//             title:  Text('Math_Dictionary'),
//           ),
//         );
//     // return MaterialApp(
//     //   home: MyForm(),
//     // );
//   }
// }

// class MyForm extends StatefulWidget {
//   @override
//   _MyFormState createState() => _MyFormState();
// }
//
// class _MyFormState extends State<MyForm> {
//   final TextEditingController _eng = TextEditingController();
//   final TextEditingController _uz = TextEditingController();
//
//   void _addData(String key, String value) {
//     FirebaseFirestore.instance.collection('dic').add({
//       'eng': key,
//       'uz': value,
//     }).then((value) {
//       print('Data added successfully');
//     }).catchError((error) {
//       print('Failed to add data: $error');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Data to Firebase'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TextFormField(
//               controller: _eng,
//               decoration: InputDecoration(
//                 labelText: 'Enter your word',
//               ),
//             ),
//             TextFormField(
//               controller: _uz,
//               decoration: InputDecoration(
//                 labelText: 'sozni kiriting',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 String key = _eng.text.trim();
//                 String value = _uz.text.trim();
//                 if (key.isNotEmpty && value.isNotEmpty) {
//                   _addData(key, value);
//                   _eng.clear();
//                   _uz.clear();
//                 } else {
//                   // Show a snackbar or any other error handling mechanism
//                 }
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
