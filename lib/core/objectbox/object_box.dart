import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sawa/core/objectbox/objectbox.g.dart'; // generated

/// General-purpose ObjectBox service that lazily provides Box<T>
/// and common helpers so you don't have to declare typed boxes manually.
class ObjectBox {
  static ObjectBox? _instance;
  late final Store store;

  /// Cache for boxes so we don't repeatedly call store.box<T>()
  final Map<Type, Box> _boxes = {};

  ObjectBox._(this.store);

  /// Returns the singleton instance, initializing it if needed.
  /// Optionally pass a directory (useful for tests).
  static Future<ObjectBox> getInstance({String? directory}) async {
    if (_instance != null) return _instance!;
    final dir = directory != null
        ? Directory(directory)
        : await getApplicationDocumentsDirectory();
    final store = await openStore(directory: dir.path);
    _instance = ObjectBox._(store);
    return _instance!;
  }

  /// Generic Box getter with simple caching
  Box<T> box<T>() {
    final t = T;
    final cached = _boxes[t];
    if (cached != null) return cached as Box<T>;
    final b = store.box<T>();
    _boxes[t] = b;
    return b;
  }

  /// Put a single object (synchronous as ObjectBox is sync)
  int put<T>(T entity) => box<T>().put(entity);

  /// Put many objects
  List<int> putMany<T>(List<T> entities) => box<T>().putMany(entities);

  /// Get by id
  T? getById<T>(int id) => box<T>().get(id);

  /// Get all
  List<T> getAll<T>() => box<T>().getAll();

  /// Remove by id
  bool remove<T>(int id) => box<T>().remove(id);

  /// Remove many by ids
  int removeMany<T>(List<int> ids) => box<T>().removeMany(ids);

  /// Run a synchronous transaction. Use TxMode.read for read-only.
  R runInTransaction<R>(R Function() action, {TxMode mode = TxMode.write}) {
    return store.runInTransaction<R>(mode, action);
  }

  /// Close store and clear caches. After close you can call getInstance again.
  void close() {
    try {
      store.close();
    } finally {
      _boxes.clear();
      _instance = null;
    }
  }

  /// Deletes the ObjectBox folder from the app documents directory.
  /// Use with caution (removes all local data).
  Future<void> deleteAllData() async {
    // Close store first
    try {
      store.close();
    } catch (_) {}
    _boxes.clear();
    _instance = null;

    final dir = await getApplicationDocumentsDirectory();
    final dbDir = Directory('${dir.path}/objectbox');
    if (await dbDir.exists()) {
      await dbDir.delete(recursive: true);
    }
  }
}
