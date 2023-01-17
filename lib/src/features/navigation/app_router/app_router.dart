//
// part 'app_router.gr.dart';
//
// @AdaptiveAutoRouter(
//   routes: <AutoRoute>[
//     AutoRoute(page: SplashScreen, initial: true),
//     AutoRoute(page: OnboardingScreen),
//     CustomRoute(
//       page: SignInScreen,
//       transitionsBuilder: TransitionsBuilders.slideBottom,
//       durationInMilliseconds: 200,
//     ),
//     CustomRoute(
//       page: InputIinScreen,
//       transitionsBuilder: TransitionsBuilders.slideBottom,
//       durationInMilliseconds: 200,
//     ),
//     AutoRoute(page: SignUpScreen),
//     AutoRoute(page: AboutAppScreen),
//     AutoRoute(page: SecurityPolicyScreen),
//     AutoRoute(page: UserAgreementScreen),
//     AutoRoute(page: SettingsScreen),
//     AutoRoute(page: AuthRecoveryScreen),
//     AutoRoute(page: PasswordScreen),
//     AutoRoute(page: ChangePasswordScreen),
//     AutoRoute(page: ChangePhoneScreen),
//     AutoRoute(page: ChangeEmailScreen),
//     AutoRoute(page: FeedBackScreen),
//     AutoRoute(page: HelpScreen),
//     AutoRoute(page: EmploymentCenterScreen),
//     AutoRoute(page: CitizenshipScreen),
//     AutoRoute(page: RegionScreen),
//     AutoRoute(page: DetailedHelpScreen),
//     AutoRoute(page: SignInAsScreen),
//     AutoRoute(page: WorkPlaceScreen),
//     AutoRoute(page: QualitiesScreen),
//     AutoRoute(page: EducationScreen),
//     AutoRoute(page: GosuslugiScreen),
//     AutoRoute(page: CompanyPage),
//     AutoRoute(page: ApplyForPaymentScreen),
//     AutoRoute(page: VacancyDetailedScreen),
//     AutoRoute(page: ComplaintScreen),
//     AutoRoute(page: FiltersScreen),
//     AutoRoute(page: DetailedResumeScreen),
//     AutoRoute(page: VacanciesScreen),
//     AutoRoute(page: LanguagesScreen),
//     AutoRoute(page: CoursesScreen),
//     AutoRoute(page: ServiceForCitizensScreen),
//     AutoRoute(page: NotificationScreen),
//     AutoRoute(page: JoblessnessScreen),
//     AutoRoute(page: ResumeViewsScreen),
//     AutoRoute(page: DetailedPaymentScreen),
//     AutoRoute(page: ResumeMessageScreen),
//     AutoRoute(page: ResumeInvitesScreen),
//     AutoRoute(page: ResumeResponsesScreen),
//     AutoRoute(page: ResumeResponseMessageScreen),
//     AutoRoute(page: SearchBySkillScreenStep1),
//     AutoRoute(page: SearchBySkillScreenStep2),
//     AutoRoute(page: CatoScreen),
//     AutoRoute(page: CityByDistrictScreen),
//     AutoRoute(page: CreateResumeStep1),
//     AutoRoute(page: CreateResumeStep2),
//     AutoRoute(page: CreateResumeStep3),
//     AutoRoute(page: CreateResumeStep4),
//     AutoRoute(page: CreateResumeStep5),
//     AutoRoute(page: CreateResumeStep6),
//     AutoRoute(page: ScreenEditHobby),
//     AutoRoute(page: ScreenEditPersonalInfo),
//     AutoRoute(page: ScreenEditProfAndSalary),
//     AutoRoute(page: ProfSkillsEditScreen),
//     AutoRoute(page: PersSkillsEditScreen),
//     AutoRoute(page: ViewLirScreen),
//     AutoRoute(page: CreateLirScreen),
//     AutoRoute(page: SendLirScreen),
//     AutoRoute(page: EditJoblessnessScreen),
//     AutoRoute(page: ResumeViewsFromNotify),
//     CustomRoute(
//       page: PrimaryScreen,
//       initial: true,
//       transitionsBuilder: NavigatorTransitions.fade,
//       durationInMilliseconds: 500,
//       children: [
//         AutoRoute(
//           page: EmptyRouterPage,
//           name: 'MainRouter',
//           children: [
//             AutoRoute(page: MainScreen, initial: true),
//           ],
//         ),
//         AutoRoute(
//           page: EmptyRouterPage,
//           name: 'ResumeRouter',
//           guards: [AuthGuard],
//           children: [
//             AutoRoute(page: ScreenListAllResumes, initial: true),
//           ],
//         ),
//         AutoRoute(
//           page: EmptyRouterPage,
//           name: 'FavoriteRouter',
//           children: [
//             AutoRoute(page: FavoriteScreen, initial: true),
//           ],
//         ),
//         AutoRoute(
//           page: EmptyRouterPage,
//           name: 'CabinetRouter',
//           children: [
//             AutoRoute(page: CabinetScreen, initial: true),
//           ],
//         ),
//       ],
//     ),
//   ],
// )
// class AppRouter extends _$AppRouter {
//   AppRouter({
//     required super.navigatorKey,
//     required super.authGuard,
//   }) {
//     rootKey = super.navigatorKey;
//   }
//
//   static late final GlobalKey<NavigatorState> rootKey;
// }
