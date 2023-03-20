import 'package:diploma_web/src/features/navigation/app_router/app_router.dart';
import 'package:diploma_web/src/features/profile/ui/widget/body.dart';
import 'package:diploma_web/src/widgets/app_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../../widgets/app_drop_down_button.dart';
import '../../../widgets/disabilities_button.dart';

class CreateResume extends StatelessWidget {
  const CreateResume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 48, top: 35, right: 140),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppAssets.images.logo,
                      height: 38,
                    ),
                    const DisabilitiesButton(),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBackButton(onTap: () {
                      context.router.popAndPush(const MyResumesRoute());
                    }),
                    const SizedBox(width: 120),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.only(left: 79, top: 57, right: 78, bottom: 35),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            ContactDetails(),
                            MoreInformation(),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class MoreInformation extends StatelessWidget {
  const MoreInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 76),
        const Text('Main information' , style: AppStyles.s15w500,),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: Row(
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
            ),
            const SizedBox(width: 22),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Gender', style: AppStyles.s15w500),
                  AppDropDownButton(
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
                    ],
                    initial: 'Almaty',
                  ),
                ],
              ),
            ),



          ],
        ),
        const SizedBox(height: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Citizenship', style: AppStyles.s15w500),
            AppDropDownButton(
              items: [
                DropdownMenuItem(
                  value: 'Kazakhstan, Russia, USA',
                  child: Text(
                    'Kazakhstan, Russia, USA',
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
              ],
              initial: 'Almaty',
            ),
          ],
        ),
      ],
    );
  }
}



class ContactDetails extends StatelessWidget {
  const ContactDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Contact details', style: AppStyles.s15w500),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: const [
                  ProfileTile(label: 'First name', hintText: 'first name'),
                  SizedBox(height: 14),
                  ProfileTile(label: 'Second name', hintText: 'second name'),
                  SizedBox(height: 14),
                  ProfileTile(label: 'Patronymic name', hintText: 'patronymic name'),
                ],
              ),
            ),
            const SizedBox(width: 80),
            const Expanded(flex: 1, child: PhotoCreateResume()),
          ],
        ),
        Row(
          children: [
            const Expanded(child: ProfileTile(label: 'Patronymic name', hintText: 'patronymic name')),
            const SizedBox(width: 22),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Gender', style: AppStyles.s15w500),
                  AppDropDownButton(
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
                    ],
                    initial: 'Almaty',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}



class PhotoCreateResume extends StatelessWidget {
  const PhotoCreateResume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const CircleAvatar(
              radius: 70.0,
              backgroundImage: NetworkImage(
                'https://thumbs.dreamstime.com/b/businessman-icon-image-male-'
                'avatar-profile-vector-glasses-beard-hairstyle-179728610.jpg',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Mary Jane',
              style: AppStyles.s18w500,
            ),
            const SizedBox(height: 6),
            Text(
              'Student',
              style: AppStyles.s15w400.copyWith(color: AppColors.gray600),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
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
                        'Upload photo',
                        style: AppStyles.s15w500.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ],
    );
  }
}
