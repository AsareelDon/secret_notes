import 'package:path_provider/path_provider.dart';
import 'package:secret_notes/objectbox.g.dart';

class ObjectBox {
  late final Store store;

  ObjectBox._create({required this.store});

  static Future<ObjectBox> create() async {
    final dir = await getApplicationCacheDirectory();
    final store = await openStore(directory: '${dir.path}/objectbox');

    return ObjectBox._create(store: store);
  }
}