import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_login_state.freezed.dart';

@freezed
sealed class PhoneLoginState with _$PhoneLoginState {
  const factory PhoneLoginState.initial() = _Initial;
  const factory PhoneLoginState.loading() = _Loading;
  const factory PhoneLoginState.success() = _Success;
  const factory PhoneLoginState.error(String errMessage) = _Error;
}

extension PhoneLoginStateX on PhoneLoginState {
  bool get isLoading => this is _Loading;
}
