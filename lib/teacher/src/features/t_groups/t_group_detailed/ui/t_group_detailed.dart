import 'package:diploma_web/constants/app_styles.dart';
import 'package:diploma_web/student/src/features/navigation/app_router/app_router.dart';
import 'package:diploma_web/student/src/widgets/app_back_button.dart';
import 'package:diploma_web/student/src/widgets/course_container.dart';
import 'package:diploma_web/teacher/src/features/t_groups/ui/t_groups.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../constants/app_assets.dart';
import '../../../../../../constants/app_colors.dart';
import '../../../../../../student/src/features/profile/ui/profile_screen.dart';
import '../../../../../../student/src/features/profile/ui/widget/left_side_bar.dart';
import '../../../../../../student/src/widgets/app_text_field.dart';
import '../../../../../../student/src/widgets/app_text_form_field.dart';
import '../../../t_gradebook/t_gradebook_detailed_group/ui/t_gradebook_detailed_course.dart';

class TGroupDetailed extends StatelessWidget {
  const TGroupDetailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 200),
          child: HeaderWidget(
            withDisabilities: false,
            title: 'Groups',
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 33),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // AppBackButton(onTap: () {
                    //   context.router.popAndPush(const TGroupsRoute());
                    // }),
                    const SizedBox(width: 34),
                    const CourseContainer(),
                    const SizedBox(width: 25),
                    const Text('ITIS - 1914', style: AppStyles.s18w500)
                  ],
                ),
                AppElevatedIconButton(
                    text: 'Add students',
                    onTap: () {
                      showAlertDialogAddStudent(context);
                    })
              ],
            ),
            const SizedBox(height: 50),
            const GroupTableWidget(),
          ],
        ),
      ),
    );
  }
}

class GroupTableWidget extends StatelessWidget {
  const GroupTableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          showAlertDialogOnTapStudent(context);
        },
        child: TableBody(
          data: [
            TableInfo(
                surname: 'Robert ',
                firstName: 'Perry',
                email: 'robert.perry@gmail.com',
                fullNameLetters: 'RP'),
            TableInfo(
                surname: 'Robert ',
                firstName: 'Perry',
                email: 'robert.perry@gmail.com',
                fullNameLetters: 'RP'),
            TableInfo(
                surname: 'Robert ',
                firstName: 'Perry',
                email: 'robert.perry@gmail.com',
                fullNameLetters: 'RP'),
            TableInfo(
                surname: 'Robert ',
                firstName: 'Perry',
                email: 'robert.perry@gmail.com',
                fullNameLetters: 'RP'),
            TableInfo(
                surname: 'Robert ',
                firstName: 'Perry',
                email: 'robert.perry@gmail.com',
                fullNameLetters: 'RP'),
          ],
        ),
      ),
    );
  }
}

void showAlertDialogAddStudent(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      titleTextStyle: AppStyles.s20w600,
      titlePadding: const EdgeInsets.symmetric(vertical: 29, horizontal: 44),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: AppBorderButton(
                title: 'Cancel',
                onTap: () {
                  context.router.pop();
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: AppElevatedButton(
                title: 'Save',
                onTap: () {
                  context.router.pop();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
      ],
      title: const Text('Add student by email'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width / 3.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Text('Email'),
                SizedBox(width: 54),
                Expanded(
                  child: AppTextField(hintText: 'Enter the email'),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

void showAlertDialogOnTapStudent(BuildContext context) {
  List<String> list = [
    'General English',
    'UI/UX Design',
    'Web Development',
    'Animation',
    'General English',
    'UI/UX Design'
  ];
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Robert Perry'),
      content: Column(
        children: [
          SizedBox(
            width: 350,
            child: AppTextFormField(
              hintText: 'search',
              hintStyle: AppStyles.s14w500.copyWith(color: AppColors.gray400),
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SvgPicture.asset(
                  AppAssets.svg.search,
                  color: AppColors.gray200,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Container(
              height: 2,
              color: AppColors.gray200,
            ),
          ),
          ExpansionPanelList.radio(
            expandedHeaderPadding: EdgeInsets.zero,
            elevation: 2,
            animationDuration: const Duration(milliseconds: 600),
            children: [
              ...List.generate(
                2,
                (index) {
                  return ExpansionPanelRadio(
                    value: '$index category',
                    backgroundColor: AppColors.background,
                    headerBuilder: (_, isExpanded) => Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          const SizedBox(width: 12),
                          Text('${index + 1} category')
                        ],
                      ),
                    ),
                    body: Container(
                      color: AppColors.white,
                      child: Column(
                        children: [
                          ...List.generate(
                            list.length,
                            (index) => Row(
                              children: [
                                Checkbox(value: false, onChanged: (value) {}),
                                const SizedBox(width: 12),
                                Text(
                                  list[index],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
      actions: [
        AppElevatedButton(
          title: 'Submit',
          onTap: () {
            context.router.pop();
          },
        )
      ],
    ),
  );
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   List<String> fruits = ['Apple', 'Banana', 'Graps', 'Orange', 'Mango'];
//   List<String> selectedFruits = [];
//
//   final List<String> selectedItems = [];
//
//   void itemChange(String itemValue, bool isSelected) {
//     setState(() {
//       if (isSelected) {
//         selectedItems.add(itemValue);
//       } else {
//         selectedItems.remove(itemValue);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Multiselect Dropdown'),
//       ),
//       body: Center(
//         child: DropDownMultiSelect(
//           options: fruits,
//           selectedValues: selectedFruits,
//           onChanged: (value) {
//             print('selected fruit $value');
//             setState(() {
//               selectedFruits = value;
//             });
//             print('you have selected $selectedFruits fruits.');
//           },
//           whenEmpty: 'Select your favorite fruits',
//         ),
//       ),
//     );
//   }
// }

class HeaderTableText extends StatelessWidget {
  const HeaderTableText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(42, 13, 0, 13),
      child: Text(
        text,
        style: AppStyles.s15w500.copyWith(color: AppColors.gray600),
      ),
    );
  }
}

class BodyTableText extends StatelessWidget {
  const BodyTableText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(42, 13, 22, 13),
      child: Text(
        text,
        style: AppStyles.s15w500,
      ),
    );
  }
}

class TableBody extends StatelessWidget {
  const TableBody({Key? key, required this.data}) : super(key: key);
  final List<TableInfo> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          width: 1,
          color: AppColors.gray200,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Table(
            border: const TableBorder(
              horizontalInside: BorderSide(
                width: 1,
                color: AppColors.gray200,
                style: BorderStyle.solid,
              ),
            ),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(2),
              3: FlexColumnWidth(2),
              4: FlexColumnWidth(3),
              5: FlexColumnWidth(2),
            },
            children: [
              TableRow(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  const HeaderTableText(text: ''),
                  const HeaderTableText(text: 'Surname'),
                  const HeaderTableText(text: 'First name'),
                  const HeaderTableText(text: 'Email'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Delete selected',
                        style:
                            AppStyles.s15w500.copyWith(color: AppColors.white),
                      ),
                    ),
                  )
                ],
              ),
              ...data.map(
                (e) {
                  return TableRow(
                    children: [
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Checkbox(value: false, onChanged: (value) {})),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Avatar(name: e.fullNameLetters),
                      ),
                      TableCell(
                        child: BodyTableText(text: e.surname),
                      ),
                      TableCell(
                        child: BodyTableText(text: e.firstName),
                      ),
                      TableCell(
                        child: BodyTableText(text: e.email),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 13,
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor: Colors.white,
                                elevation: 5),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Change',
                                style: AppStyles.s15w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TableInfo {
  TableInfo({
    required this.surname,
    required this.firstName,
    required this.email,
    required this.fullNameLetters,
  });

  final String surname;
  final String firstName;
  final String email;
  final String fullNameLetters;
}
