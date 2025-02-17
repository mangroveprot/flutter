import 'package:cloud_firestore/cloud_firestore.dart';

class NoteEntity {
  final String id;
  final String title;
  final String content;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  const NoteEntity(
      {required this.id,
      required this.title,
      required this.content,
      required this.createdAt,
      required this.updatedAt});
}
