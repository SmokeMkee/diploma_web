import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../../../../widgets/app_drop_down_button.dart';
import '../../../../widgets/app_text_form_field.dart';

class ProfileBodyWidget extends StatelessWidget {
  const ProfileBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 54),
        const Text(
          'User information',
          style: AppStyles.s15w500,
        ),
        Text(
          'Here you can manage your account',
          style: AppStyles.s15w500.copyWith(
            color: AppColors.gray600,
          ),
        ),
        const SizedBox(height: 38),
        Row(
          children: const [
            Expanded(
              child: ProfileTile(
                label: 'First name',
                hintText: 'Enter your first name',
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
                child: ProfileTile(
              label: 'Second name',
              hintText: 'Enter your Second name',
            )),
          ],
        ),
        const SizedBox(height: 24),
        const ProfileTile(
          label: 'Patronymic name',
          hintText: 'Enter your patronymic name',
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Expanded(
              child: ProfileTile(
                label: 'Date of Birth',
                hintText: 'XX / XX / XXXX',
              ),
            ),
            const SizedBox(width: 20),
            Container(
              padding: const EdgeInsets.all(15.5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.accent),
              child: SvgPicture.asset(
                AppAssets.svg.scheduleBold,
                color: AppColors.white,
              ),
            )
          ],
        ),
        const SizedBox(height: 24),
        ProfileTile(
          label: 'Email address',
          hintText: 'Enter your email address',
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: SvgPicture.asset(
              AppAssets.svg.email,
              color: AppColors.gray200,
            ),
          ),
        ),
        const SizedBox(height: 24),
        ProfileTile(
          label: 'Phone number',
          hintText: 'Enter your phone number',
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: SvgPicture.asset(
              AppAssets.svg.email,
              color: AppColors.gray200,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: const [
            Flexible(
                child: AppDropDownButton(
              items: [
                DropdownMenuItem(
                  value: 'Almaty',
                  child: Text(
                    'Almaty',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'almaty',
                  child: Text(
                    'Almaty',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ], initial: 'Almaty',
            )),
            SizedBox(width: 23),
            Flexible(
                child: AppDropDownButton(
              items: [
                DropdownMenuItem(
                  value: 'Almaty',
                  child: Text(
                    'Almaty',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'almaty',
                  child: Text(
                    'Almaty',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ], initial: 'Almaty',
            )),
          ],
        ),
        const SizedBox(height: 28),
        AppTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Error text';
            } else {
              return null;
            }
          },
          hintText: 'Street',
          hintStyle: AppStyles.s15w400.copyWith(color: AppColors.gray400),
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  'Save changes',
                  style: AppStyles.s15w500.copyWith(color: AppColors.white),
                ),
              ),
            ),
            const SizedBox(width: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: AppColors.gray200, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text('Delete', style: AppStyles.s15w500),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({Key? key, required this.label, required this.hintText, this.suffixIcon}) : super(key: key);
  final String label;
  final String hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.s15w400,
        ),
        AppTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Error text';
            } else {
              return null;
            }
          },
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: AppStyles.s15w400.copyWith(color: AppColors.gray400),
        ),
      ],
    );
  }
}

class FullNameWidget extends StatelessWidget {
  const FullNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'First name',
                    style: AppStyles.s15w400,
                  ),
                  AppTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Error text';
                      } else {
                        return null;
                      }
                    },
                    hintText: 'Enter your first name',
                    hintStyle: AppStyles.s15w400.copyWith(color: AppColors.gray400),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 23),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Second name',
                    style: AppStyles.s15w400,
                  ),
                  AppTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Error text';
                      } else {
                        return null;
                      }
                    },
                    hintText: 'Enter your second name',
                    hintStyle: AppStyles.s15w400.copyWith(color: AppColors.gray400),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Patronymic name',
          style: AppStyles.s15w400,
        ),
        AppTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Error text';
            } else {
              return null;
            }
          },
          hintText: 'Enter your patronymic name',
          hintStyle: AppStyles.s15w400.copyWith(color: AppColors.gray400),
        ),
      ],
    );
  }
}
