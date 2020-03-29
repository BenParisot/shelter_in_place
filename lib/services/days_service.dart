import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shelter_in_place/models/day_model.dart';

class DaysService {
//  final Firestore _db = Firestore.instance;
//  final String path;
//  CollectionReference ref;
//
//  AnswerService( this.path ) {
//    ref = _db.collection(path);
//  }

  Future</*DocumentSnapshot*/Day> getDocumentById(String id) {
    return null;
//    return ref.document(id).get();
  }

  Future</*DocumentSnapshot*/String> addDocument(Map data) async {
    print(data);
    return null;
//    return ref.add(data);
  }
}