// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactModel _$ContactModelFromJson(Map<String, dynamic> json) =>
    _ContactModel(
      contactName: json['contact_name'] as String,
      phoneNumber: json['phone_number'] as String,
      isAppUser: json['is_app_user'] as bool,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactModelToJson(_ContactModel instance) =>
    <String, dynamic>{
      'contact_name': instance.contactName,
      'phone_number': instance.phoneNumber,
      'is_app_user': instance.isAppUser,
      'user': instance.user?.toJson(),
    };
