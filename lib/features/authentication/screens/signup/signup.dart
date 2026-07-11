import 'package:mindmapify/common/widgets/login_signup/form_divider.dart';
import 'package:mindmapify/common/widgets/login_signup/social_buttons.dart';
import 'package:mindmapify/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:mindmapify/utils/constants/sizes.dart';
import 'package:mindmapify/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(AppTexts.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Form
              const AppSignupForm(),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Divider
              AppFormDivider(dividerText: AppTexts.orSignUpWith.capitalize!),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Social Buttons
              const AppSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
