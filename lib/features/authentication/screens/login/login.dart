import 'package:fix_it_solutions/common/styles/spacing_styles.dart';
import 'package:fix_it_solutions/common/widgets/login_signup/form_divider.dart';
import 'package:fix_it_solutions/common/widgets/login_signup/social_buttons.dart';
import 'package:fix_it_solutions/features/authentication/screens/login/widgets/login_form.dart';
import 'package:fix_it_solutions/features/authentication/screens/login/widgets/login_header.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title, Sub-Title
              const AppLoginHeader(),

              // Form
              const AppLoginForm(),

              // Divider
              AppFormDivider(dividerText: AppTexts.orSignInWith.capitalize!),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Footer
              const AppSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
