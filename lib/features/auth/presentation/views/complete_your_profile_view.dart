import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sawa/core/router/app_route_name.dart';
import '../../../../core/widgets/show_custom_snack_bar.dart';
import '../riverpod/auth_providers.dart';
import '../riverpod/notifiers/complete_profile/complete_profile_state.dart';
import '../widgets/complete_profile_widgets/complete_your_profile_view_body.dart';

class CompleteYourProfileView extends ConsumerWidget {
  const CompleteYourProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cPNotifier = ref.read(completeProfileNotifierProvider.notifier);
    final cPState = ref.watch(completeProfileNotifierProvider);

    ref.listen<CompleteProfileState>(completeProfileNotifierProvider, (
      previous,
      next,
    ) {
      // Only show error when it changes
      if (next.error != null && next.error != previous?.error) {
        CustomSnackBar.show(
          context,
          message: next.error!,
          type: SnackBarType.error,
        );
      }

      // Only show success when it changes
      if (next.success == true && previous?.success != true) {
        context.goNamed(AppRouteNames.home);
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: CompleteYourProfileViewBody(
        cPNotifier: cPNotifier,
        cPState: cPState,
      ),
    );
  }
}
