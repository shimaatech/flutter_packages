import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:repository/repository.dart';
import 'package:serializer/serializer.dart';

class FirestoreRepository<E extends Entity<String>>
    implements RemoteRepository<E, String> {
  FirestoreRepository(this.firestore, String collectionName, this.serializer)
      : collection = firestore.collection(collectionName);

  final CollectionReference collection;
  final Firestore firestore;
  final Serializer<E> serializer;

  @override
  Future<int> count() {
    // There is no efficient way of getting number of documents (we need to
    // fetch all documents from the collection)... The better way is to have
    // some other document that contains the lengths of all documents in
    // firestore... but this cannot be generalized here... So simply it's
    // not supported
    throw UnsupportedError('count is not supported');
  }

  @override
  Future<void> delete(String id) {
    return collection.document(id).delete();
  }

  @override
  Future<void> deleteAll() async {
    // again, no efficient way of doing that in firestore
    throw UnsupportedError('deleteAll is not supported');
  }

  @override
  Future<bool> exists(String id) async {
    DocumentSnapshot snapshot = await getSnapshotById(id);
    return snapshot.exists;
  }

  @protected
  Future<DocumentSnapshot> getSnapshotById(String id) async {
    DocumentSnapshot snapshot = await collection.document(id).get();
    return snapshot;
  }

  @override
  Future<List<E>> findAll(List<String> ids) {
    throw UnsupportedError(
        'Currently findAll is not supported... Support it if you want');
  }

  @override
  Future<E> findById(String id) async {
    DocumentSnapshot snapshot = await getSnapshotById(id);
    return snapshot.exists ? serializer.deserialize(snapshot.data) : null;
  }

  // TODO maybe list should take a query instead of filter...
  // But we need to implement it in Java for other repositories implementations
  @override
  Future<List<E>> list({Map<String, dynamic> filter}) async {
    // TODO maybe limit shouldn't be part of the filter
    Future<QuerySnapshot> snapshotsFuture;
    if (filter == null || filter.isEmpty) {
      snapshotsFuture = collection.getDocuments();
    } else {
      Query query;
      if (filter.containsKey('limit')) {
        query = collection.limit(filter['limit']);
      } else {
        query = collection.where(filter.keys.first,
            isEqualTo: filter[filter.keys.first]);
      }
      for (String key in filter.keys) {
        // we may override the same key again (in case first key is not 'limit')
        // but it's OK
        if (key == 'limit') {
          continue;
        }
        query = query.where(key, isEqualTo: filter[key]);
      }
      snapshotsFuture = query.getDocuments();
    }
    return (await snapshotsFuture)
        .documents
        .map((doc) => serializer.deserialize(doc.data))
        .toList();
  }

  @override
  Future<void> save(E entity) {
    return collection.document(entity.id).setData(serializer.serialize(entity));
  }

  @override
  Future<void> saveAll(Iterable<E> entities) {
    // Currently I didn't find efficient way to do that.. So won't support it
    throw UnsupportedError('saveAll not supported... Support if you like..');
  }
}
