import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../auth/data/model/user_model.dart';
import '../../domain/entities/contact_entity.dart';
import 'contact_obx.dart';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

@freezed
sealed class ContactModel with _$ContactModel {
  const factory ContactModel({
    required String contactName,
    required String phoneNumber,
    required bool isAppUser,
    UserModel? user,
  }) = _ContactModel;

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  // Create model from entity
  factory ContactModel.fromEntity(ContactEntity entity) {
    return ContactModel(
      contactName: entity.contactName,
      phoneNumber: entity.phoneNumber,
      isAppUser: entity.isAppUser,
      user: entity.user?.toModel(),
    );
  }
}

extension ContactModelX on ContactModel {
  // Convert to entity
  ContactEntity toEntity() {
    return ContactEntity(
      contactName: contactName,
      phoneNumber: phoneNumber,
      isAppUser: isAppUser,
      user: user?.toEntity(),
    );
  }
}

extension ContactModelMapper on ContactModel {
  ContactObx toObx() {
    final obx = ContactObx(
      contactName: contactName,
      phoneNumber: phoneNumber,
      isAppUser: isAppUser,
      lastCheckedAt: DateTime.now(),
    );

    if (user != null) {
      obx.user.target = user!.toObx();
    }

    return obx;
  }
}
