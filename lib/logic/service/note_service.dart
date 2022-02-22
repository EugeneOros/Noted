import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:utopia_recruitment_task/logic/model/note/note.dart';

class NoteService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Note>> notes() {
    if (_auth.currentUser == null) return Stream.empty();
    User user = _auth.currentUser!;
    var notesCollection = FirebaseFirestore.instance.collection("users").doc(user.uid).collection("notes");
    return notesCollection.orderBy('created', descending: true).snapshots().map((snapshot) {
      List<Note> notes = snapshot.docs.map((doc) => Note.fromJson(doc.data()).copyWith(id: doc.id)).toList();
      return notes;
    });
  }

  Future<DocumentReference> addNewNote(Note note) async {
    User user = _auth.currentUser!;
    var json = note.copyWith(created: DateTime.now()).toJson();
    json.remove('id');
    CollectionReference notesCollection = FirebaseFirestore.instance.collection("users").doc(user.uid).collection("notes");
    return notesCollection.add(json);
  }

  Future<void> updateNote(Note note) {
    User user = _auth.currentUser!;
    var json = note.toJson();
    json.remove('id');
    CollectionReference notessCollection = FirebaseFirestore.instance.collection("users").doc(user.uid).collection("notes");
    return notessCollection.doc(note.id).update(json);
  }

  Future<void> deleteNote(Note note) async {
    User user = _auth.currentUser!;
    CollectionReference notesCollection = FirebaseFirestore.instance.collection("users").doc(user.uid).collection("notes");
    return notesCollection.doc(note.id).delete();
  }
}
