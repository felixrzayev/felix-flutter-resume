import 'package:firebase_database/firebase_database.dart';

Future<DataSnapshot> getDataSnapshot() async {
  DatabaseReference database = FirebaseDatabase.instance.ref();

  final DataSnapshot snapshot = await database.get();
  return snapshot;
}
