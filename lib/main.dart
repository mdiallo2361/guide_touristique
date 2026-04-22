import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  // 🔥 Fonction pour ajouter des lieux
  void addPlaces() async {
    await db.collection("places").add({
      "name": "Mosquée Hassan II",
      "city": "Casablanca",
      "description": "Grande mosquée au bord de l'océan",
      "rating": 4.8,
    });

    await db.collection("places").add({
      "name": "Jardin Majorelle",
      "city": "Marrakech",
      "description": "Jardin botanique célèbre",
      "rating": 4.7,
    });

    print("Places ajoutées 🔥");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guide Touristique"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: addPlaces,
          child: Text("Ajouter des lieux"),
        ),
      ),
    );
  }
}