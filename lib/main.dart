import 'package:felixrzayev/app/pages/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/constants.dart';
import 'data/rep/data_repo.dart';
import 'data/rep/inherited_data.dart';
import 'data/strings.dart';
import 'firebase_options.dart';
import 'model/data_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  return runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: webTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //TODO: Dark theme
        fontFamily: GoogleFonts.openSans().fontFamily,
        scaffoldBackgroundColor: mainColor,
      ),
      home: FutureBuilder<DataSnapshot>(
        future: getDataSnapshot(),
        builder: (
          BuildContext context,
          AsyncSnapshot<DataSnapshot> snapshot,
        ) {
          if (snapshot.hasData) {
            return InheritedData(
              data: DataModel.fromSnapshot(
                  snapshot.requireData.child('information')),
              child: MainPage(),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
