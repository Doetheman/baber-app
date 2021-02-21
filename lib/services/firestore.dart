import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  Future<void> setData({
    @required String collectionPath,
    @required String documentPath,
    @required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    final reference =
        FirebaseFirestore.instance.collection(collectionPath).doc(documentPath);
    print('$documentPath: $data');
    await reference.set(data, SetOptions(merge: merge));
  }

  Future<void> deleteData({
    @required String collectionPath,
    @required String documentPath,
  }) async {
    final reference =
        FirebaseFirestore.instance.collection(collectionPath).doc(documentPath);
    print('delete: $documentPath');
    await reference.delete();
  }

  Future<void> updateData({
    @required String collectionPath,
    @required String documentPath,
    @required Map<String, dynamic> data,
  }) async {
    await FirebaseFirestore.instance
        .collection(collectionPath)
        .doc(documentPath)
        .update(data);
  }

  Stream<QuerySnapshot> fetchCollectionStream<T>({
    @required String collectionPath,
  }) {
    var query = FirebaseFirestore.instance.collection(collectionPath);
    return query.snapshots();
  }

  Future<List<DocumentSnapshot>> fetchCollection<T>({
    @required String collectionPath,
  }) async {
    var query =
        await FirebaseFirestore.instance.collection(collectionPath).get();
    return query.docs;
  }

  Future<Map<String, dynamic>> fetchDocument<T>({
    @required String collectionPath,
    @required String documentPath,
  }) async {
    final DocumentReference reference =
        FirebaseFirestore.instance.collection(collectionPath).doc(documentPath);
    final DocumentSnapshot snapshot = await reference.get();
    return snapshot.data();
  }

  Future<List<DocumentSnapshot>> fetchArrayContainsCollection<T>({
    @required String collectionPath,
    @required dynamic condition,
    @required dynamic fieldWhere,
  }) async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection(collectionPath)
        .where(fieldWhere, arrayContains: condition.toLowerCase())
        .get();

    return query.docs;
  }

  Future<List<DocumentSnapshot>> fetchEqualToCollection<T>({
    @required String collectionPath,
    @required dynamic fieldWhere,
    @required dynamic condition,
  }) async {
    var query = await FirebaseFirestore.instance
        .collection(collectionPath)
        .where(fieldWhere, isEqualTo: condition)
        .get();

    return query.docs;
  }

  Stream<DocumentSnapshot> fetchDocumentStream<T>({
    @required String collectionPath,
    @required String documentPath,
  }) {
    final DocumentReference reference =
        FirebaseFirestore.instance.collection(collectionPath).doc(documentPath);
    var snapshotStream = reference.snapshots();
    return snapshotStream;
  }
}
