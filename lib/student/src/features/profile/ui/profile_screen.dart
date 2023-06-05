import 'package:diploma_web/constants/app_assets.dart';
import 'package:diploma_web/constants/app_colors.dart';
import 'package:diploma_web/constants/app_styles.dart';
import 'package:diploma_web/student/src/features/profile/data/bloc/profile_bloc.dart';
import 'package:diploma_web/student/src/features/profile/ui/widget/body.dart';
import 'package:diploma_web/student/src/features/profile/ui/widget/left_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/disabilities_button.dart';
import '../../localization/generated/l10n.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void didChangeDependencies() {
    context.read<ProfileBloc>().add(FetchInfoProfile());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 200),
          child: HeaderWidget(
            title: S.of(context).profile,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProfileError) {
              return Center(
                child: Text(S.of(context).somethingError),
              );
            }
            if (state is ProfileData) {
              return Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: SingleChildScrollView(
                      child: ProfileBodyWidget(
                        profile: state.data,
                      ),
                    ),
                  ),
                  const SizedBox(width: 100),
                   Expanded(
                    child: LeftSideBar(userName: '${state.data.name ?? 'Username'} ${state.data.surname ?? ''}',),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key, required this.title, this.withDisabilities})
      : super(key: key);
  final String title;
  final bool? withDisabilities;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title.toUpperCase(),
            style: AppStyles.s20w600,
          ),
        ),
        CircleAvatar(
          radius: 27,
          backgroundColor: AppColors.gray200.withOpacity(0.2),
          child: SvgPicture.asset(
            AppAssets.svg.notification,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 27),
        if (withDisabilities == null || withDisabilities == true)
          const DisabilitiesButton(),
      ],
    );
  }
}
