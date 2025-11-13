import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../auth/data/model/user_model.dart';
import '../../domain/entities/contact_entity.dart';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

@freezed
abstract class ContactModel with _$ContactModel {
  const factory ContactModel({
    required String contactName,
    required String phoneNumber,
    required bool isAppUser,
    UserModel? user,
  }) = _ContactModel;

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  ContactEntity toEntity() {
    return ContactEntity(
      contactName: contactName,
      phoneNumber: phoneNumber,
      isAppUser: isAppUser,
      user: user?.toEntity(),
    );
  }

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
