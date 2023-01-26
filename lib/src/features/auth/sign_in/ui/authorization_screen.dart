import 'package:diploma_web/constants/app_assets.dart';
import 'package:diploma_web/constants/app_colors.dart';
import 'package:diploma_web/constants/app_styles.dart';
import 'package:diploma_web/src/features/auth/reset_password/ui/reset_password_screen.dart';
import 'package:diploma_web/src/features/navigation/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../widgets/app_text_form_field.dart';
import '../../../localization/generated/l10n.dart';
import '../../../navigation/navigation.dart';
import '../../widgets/auth_widget.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({Key? key}) : super(key: key);

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AuthScreenWidget(
        headerTitle: S.of(context).logIn,
        fields: Form(
          key: formKey,
          child: Column(
            children: [
              AppTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Error text';
                  } else {
                    return null;
                  }
                },
                hintText: S.of(context).emailAddress,
                hintStyle: AppStyles.s15w400.copyWith(color: AppColors.gray400),
                prefixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: SvgPicture.asset(
                    AppAssets.svg.email,
                    color: AppColors.gray200,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              AppTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Error text';
                  } else {
                    return null;
                  }
                },
                hintText: S.of(context).password,
                hintStyle: AppStyles.s15w400.copyWith(color: AppColors.gray400),
                obscureText: _obscureText,
                textEditingController: controller,
                suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: IconButton(
                    onPressed: () {
                      _obscureText = !_obscureText;
                      setState(() {});
                    },
                    icon: SvgPicture.asset(
                      _obscureText == true ? AppAssets.svg.slashEye : AppAssets.svg.eye,
                      color: AppColors.gray200,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        elevatedButtonText: S.of(context).logIn,
        textForPassword: S.of(context).forgotPassword,
        navigationButtonText: S.of(context).resetPassword,
        elevatedButtonOnTap: () {
          if (formKey.currentState?.validate() ?? false == true) {
            context.router.navigate(ProfileScreenRoute());
          }
        },
        navigationButtonOnTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
          );
        },
      ),
    );
  }
}
