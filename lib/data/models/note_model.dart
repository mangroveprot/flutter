import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/note_entity.dart';

class NoteModel extends NoteEntity {
  const NoteModel(
      {required super.id,
      required super.title,
      required super.content,
      required super.createdAt,
      required super.updatedAt});

  // this convert the document from firestore to NoteModel
  factory NoteModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return NoteModel(
        id: snapshot.id,
        title: data['title'],
        content: data['content'],
        createdAt: data['createdAt'],
        updatedAt: data['updatedAt']);
  }

  //value dynamic means flexible it can be any type of data types
  // String the key must be string
  // this function Object serializer for Firestore.
  // convert the NoteModel to Document
  Map<String, dynamic> toDocument() {
    return {
      'title': title,
      'content': content,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
