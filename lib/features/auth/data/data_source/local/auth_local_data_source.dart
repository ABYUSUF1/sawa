import 'package:sawa/core/objectbox/object_box.dart';
import '../../model/user_obx.dart';

class AuthLocalDataSource {
  AuthLocalDataSource(this.objectBox);

  final ObjectBox objectBox;

  /// ثابت لتخزين المستخدم المحلي
  static const int fixedId = 1;

  /// حفظ / تحديث المستخدم المحلي
  void saveUser(UserObx user) {
    final existing = objectBox.getById<UserObx>(fixedId);

    if (existing == null) {
      // أول مرة → إدخال طبيعي بدون ID
      user.obxId = 0;
      final newId = objectBox.put(user);

      // لو ObjectBox أعطى ID مختلف عن 1 (أحياناً يكون 1 مباشرة)
      if (newId != fixedId) {
        user.obxId = fixedId;
        objectBox.put(user);
      }
    } else {
      // موجود بالفعل → تحديث فقط
      user.obxId = fixedId;
      objectBox.put(user);
    }
  }

  /// جلب المستخدم
  UserObx? getUser() {
    return objectBox.getById<UserObx>(fixedId);
  }

  /// حذف المستخدم
  void clearUser() {
    objectBox.remove<UserObx>(fixedId);
  }
}
