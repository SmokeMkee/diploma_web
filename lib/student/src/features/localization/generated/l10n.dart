// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Авторизоваться`
  String get logIn {
    return Intl.message(
      'Авторизоваться',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Адрес электронной почты`
  String get emailAddress {
    return Intl.message(
      'Адрес электронной почты',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get password {
    return Intl.message(
      'Пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Вы забыли свой пароль`
  String get forgotPassword {
    return Intl.message(
      'Вы забыли свой пароль',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Сброс пароля`
  String get resetPassword {
    return Intl.message(
      'Сброс пароля',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Войти в аккаунт`
  String get logInAcc {
    return Intl.message(
      'Войти в аккаунт',
      name: 'logInAcc',
      desc: '',
      args: [],
    );
  }

  /// `Помните свой пароль`
  String get rememberPassword {
    return Intl.message(
      'Помните свой пароль',
      name: 'rememberPassword',
      desc: '',
      args: [],
    );
  }

  /// `Восстановление пароля`
  String get passwordRecovery {
    return Intl.message(
      'Восстановление пароля',
      name: 'passwordRecovery',
      desc: '',
      args: [],
    );
  }

  /// `Введите адрес электронной почты, который вы используете для своей учетной записи`
  String get enterEmailForAccount {
    return Intl.message(
      'Введите адрес электронной почты, который вы используете для своей учетной записи',
      name: 'enterEmailForAccount',
      desc: '',
      args: [],
    );
  }

  /// `Следующий`
  String get next {
    return Intl.message(
      'Следующий',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Проверочный код`
  String get verificationCode {
    return Intl.message(
      'Проверочный код',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Мы отправили вам код подтверждения по электронной почте`
  String get verificationCodeByEmail {
    return Intl.message(
      'Мы отправили вам код подтверждения по электронной почте',
      name: 'verificationCodeByEmail',
      desc: '',
      args: [],
    );
  }

  /// `Отправь снова`
  String get sendAgain {
    return Intl.message(
      'Отправь снова',
      name: 'sendAgain',
      desc: '',
      args: [],
    );
  }

  /// `Введите новый пароль`
  String get enterNewPassword {
    return Intl.message(
      'Введите новый пароль',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Изменить пароль`
  String get changePassword {
    return Intl.message(
      'Изменить пароль',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Задания`
  String get assignments {
    return Intl.message(
      'Задания',
      name: 'assignments',
      desc: '',
      args: [],
    );
  }

  /// `Журнал оценок`
  String get gradeBook {
    return Intl.message(
      'Журнал оценок',
      name: 'gradeBook',
      desc: '',
      args: [],
    );
  }

  /// `Расписание`
  String get schedule {
    return Intl.message(
      'Расписание',
      name: 'schedule',
      desc: '',
      args: [],
    );
  }

  /// `Сохранено`
  String get saved {
    return Intl.message(
      'Сохранено',
      name: 'saved',
      desc: '',
      args: [],
    );
  }

  /// `Настройки`
  String get settings {
    return Intl.message(
      'Настройки',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Курсы`
  String get courses {
    return Intl.message(
      'Курсы',
      name: 'courses',
      desc: '',
      args: [],
    );
  }

  /// `Выйти`
  String get logOut {
    return Intl.message(
      'Выйти',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Группы`
  String get groups {
    return Intl.message(
      'Группы',
      name: 'groups',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get profile {
    return Intl.message(
      'Профиль',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Произошла ошибка`
  String get somethingError {
    return Intl.message(
      'Произошла ошибка',
      name: 'somethingError',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка`
  String get errorText {
    return Intl.message(
      'Ошибка',
      name: 'errorText',
      desc: '',
      args: [],
    );
  }

  /// `Информация о пользователе`
  String get userInformation {
    return Intl.message(
      'Информация о пользователе',
      name: 'userInformation',
      desc: '',
      args: [],
    );
  }

  /// `Здесь вы можете управлять своим аккаунтом`
  String get hereYouCanManageYourAccount {
    return Intl.message(
      'Здесь вы можете управлять своим аккаунтом',
      name: 'hereYouCanManageYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Имя`
  String get firstName {
    return Intl.message(
      'Имя',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Фамилия`
  String get secondName {
    return Intl.message(
      'Фамилия',
      name: 'secondName',
      desc: '',
      args: [],
    );
  }

  /// `Отчество`
  String get patronymicName {
    return Intl.message(
      'Отчество',
      name: 'patronymicName',
      desc: '',
      args: [],
    );
  }

  /// `Введите Ваше имя`
  String get enterYourFirstName {
    return Intl.message(
      'Введите Ваше имя',
      name: 'enterYourFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Введите Вашу фамилию`
  String get enterYourSecondName {
    return Intl.message(
      'Введите Вашу фамилию',
      name: 'enterYourSecondName',
      desc: '',
      args: [],
    );
  }

  /// `Введите Ваше отчество`
  String get enterYourPatronymicName {
    return Intl.message(
      'Введите Ваше отчество',
      name: 'enterYourPatronymicName',
      desc: '',
      args: [],
    );
  }

  /// `Введите адрес электронной почты`
  String get enterYourEmailAddress {
    return Intl.message(
      'Введите адрес электронной почты',
      name: 'enterYourEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Введите свой номер телефона`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Введите свой номер телефона',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Дата рождения`
  String get dateOfBirth {
    return Intl.message(
      'Дата рождения',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Номер телефона`
  String get phoneNumber {
    return Intl.message(
      'Номер телефона',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Алматы`
  String get almaty {
    return Intl.message(
      'Алматы',
      name: 'almaty',
      desc: '',
      args: [],
    );
  }

  /// `Астана`
  String get astana {
    return Intl.message(
      'Астана',
      name: 'astana',
      desc: '',
      args: [],
    );
  }

  /// `Страна`
  String get country {
    return Intl.message(
      'Страна',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Город`
  String get city {
    return Intl.message(
      'Город',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Улица`
  String get street {
    return Intl.message(
      'Улица',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить изменения`
  String get saveChanges {
    return Intl.message(
      'Сохранить изменения',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Удалить`
  String get delete {
    return Intl.message(
      'Удалить',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Резюме`
  String get resume {
    return Intl.message(
      'Резюме',
      name: 'resume',
      desc: '',
      args: [],
    );
  }

  /// `Здесь вы можете создать свое резюме`
  String get hereYouCanCreateYourResume {
    return Intl.message(
      'Здесь вы можете создать свое резюме',
      name: 'hereYouCanCreateYourResume',
      desc: '',
      args: [],
    );
  }

  /// `Мои резюме`
  String get myResumes {
    return Intl.message(
      'Мои резюме',
      name: 'myResumes',
      desc: '',
      args: [],
    );
  }

  /// `Создать резюме`
  String get createResume {
    return Intl.message(
      'Создать резюме',
      name: 'createResume',
      desc: '',
      args: [],
    );
  }

  /// `Учитель английского языка`
  String get englishTeacher {
    return Intl.message(
      'Учитель английского языка',
      name: 'englishTeacher',
      desc: '',
      args: [],
    );
  }

  /// `Последнее обновление было 15 января 2023 в 00:38`
  String get lastUpdateWas15January2023At0038 {
    return Intl.message(
      'Последнее обновление было 15 января 2023 в 00:38',
      name: 'lastUpdateWas15January2023At0038',
      desc: '',
      args: [],
    );
  }

  /// `Мэри Джейн`
  String get maryJane {
    return Intl.message(
      'Мэри Джейн',
      name: 'maryJane',
      desc: '',
      args: [],
    );
  }

  /// `Студент`
  String get student {
    return Intl.message(
      'Студент',
      name: 'student',
      desc: '',
      args: [],
    );
  }

  /// `Загрузить фото`
  String get uploadPhoto {
    return Intl.message(
      'Загрузить фото',
      name: 'uploadPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Основная информация`
  String get mainInformation {
    return Intl.message(
      'Основная информация',
      name: 'mainInformation',
      desc: '',
      args: [],
    );
  }

  /// `Пол`
  String get gender {
    return Intl.message(
      'Пол',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Гражданство`
  String get citizenship {
    return Intl.message(
      'Гражданство',
      name: 'citizenship',
      desc: '',
      args: [],
    );
  }

  /// `Казахстан, Россия, США`
  String get kazakhstanRussiaUSA {
    return Intl.message(
      'Казахстан, Россия, США',
      name: 'kazakhstanRussiaUSA',
      desc: '',
      args: [],
    );
  }

  /// `Контактная информация`
  String get contactDetails {
    return Intl.message(
      'Контактная информация',
      name: 'contactDetails',
      desc: '',
      args: [],
    );
  }

  /// `Все курсы`
  String get allCourses {
    return Intl.message(
      'Все курсы',
      name: 'allCourses',
      desc: '',
      args: [],
    );
  }

  /// `Поиск`
  String get search {
    return Intl.message(
      'Поиск',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Общий английский`
  String get generalEnglish {
    return Intl.message(
      'Общий английский',
      name: 'generalEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Учитель: Алан Александр`
  String get teacherAlanAlexander {
    return Intl.message(
      'Учитель: Алан Александр',
      name: 'teacherAlanAlexander',
      desc: '',
      args: [],
    );
  }

  /// `Курсы > Общий английский`
  String get coursesGeneralEnglish {
    return Intl.message(
      'Курсы > Общий английский',
      name: 'coursesGeneralEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Курсы > Общий английский  > Неделя 1`
  String get coursesGeneralEnglishWeek1 {
    return Intl.message(
      'Курсы > Общий английский  > Неделя 1',
      name: 'coursesGeneralEnglishWeek1',
      desc: '',
      args: [],
    );
  }

  /// `Скачать .pdf`
  String get downloadPdf {
    return Intl.message(
      'Скачать .pdf',
      name: 'downloadPdf',
      desc: '',
      args: [],
    );
  }

  /// `Неделя 1`
  String get week1 {
    return Intl.message(
      'Неделя 1',
      name: 'week1',
      desc: '',
      args: [],
    );
  }

  /// `из 10`
  String get outOf10 {
    return Intl.message(
      'из 10',
      name: 'outOf10',
      desc: '',
      args: [],
    );
  }

  /// `Лекция`
  String get lecture {
    return Intl.message(
      'Лекция',
      name: 'lecture',
      desc: '',
      args: [],
    );
  }

  /// `Классная работа`
  String get classWork {
    return Intl.message(
      'Классная работа',
      name: 'classWork',
      desc: '',
      args: [],
    );
  }

  /// `Домашнее задание`
  String get homeWork {
    return Intl.message(
      'Домашнее задание',
      name: 'homeWork',
      desc: '',
      args: [],
    );
  }

  /// `Тест 1`
  String get quiz1 {
    return Intl.message(
      'Тест 1',
      name: 'quiz1',
      desc: '',
      args: [],
    );
  }

  /// `Другие курсы`
  String get secondCourses {
    return Intl.message(
      'Другие курсы',
      name: 'secondCourses',
      desc: '',
      args: [],
    );
  }

  /// `Фильтр`
  String get filter {
    return Intl.message(
      'Фильтр',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Курс: Общий английский`
  String get courseGeneralEnglish {
    return Intl.message(
      'Курс: Общий английский',
      name: 'courseGeneralEnglish',
      desc: '',
      args: [],
    );
  }

  /// `До 24 апреля 2023 г., 23:59`
  String get dueApril2420232359 {
    return Intl.message(
      'До 24 апреля 2023 г., 23:59',
      name: 'dueApril2420232359',
      desc: '',
      args: [],
    );
  }

  /// `12 апреля 2023 г.`
  String get april122023 {
    return Intl.message(
      '12 апреля 2023 г.',
      name: 'april122023',
      desc: '',
      args: [],
    );
  }

  /// `Журнал оценок > Общий английский`
  String get gradeBookGeneralEnglish {
    return Intl.message(
      'Журнал оценок > Общий английский',
      name: 'gradeBookGeneralEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Общая оценка`
  String get totalScore {
    return Intl.message(
      'Общая оценка',
      name: 'totalScore',
      desc: '',
      args: [],
    );
  }

  /// `Посещаемость`
  String get attendance {
    return Intl.message(
      'Посещаемость',
      name: 'attendance',
      desc: '',
      args: [],
    );
  }

  /// `Загружено`
  String get submitted {
    return Intl.message(
      'Загружено',
      name: 'submitted',
      desc: '',
      args: [],
    );
  }

  /// `Не просмотрено`
  String get unOpened {
    return Intl.message(
      'Не просмотрено',
      name: 'unOpened',
      desc: '',
      args: [],
    );
  }

  /// `Оценено`
  String get graded {
    return Intl.message(
      'Оценено',
      name: 'graded',
      desc: '',
      args: [],
    );
  }

  /// `Просрочено`
  String get pastDue {
    return Intl.message(
      'Просрочено',
      name: 'pastDue',
      desc: '',
      args: [],
    );
  }

  /// `Статус`
  String get status {
    return Intl.message(
      'Статус',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Оценка`
  String get mark {
    return Intl.message(
      'Оценка',
      name: 'mark',
      desc: '',
      args: [],
    );
  }

  /// `Комментарий`
  String get feedback {
    return Intl.message(
      'Комментарий',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `Понедельник`
  String get monday {
    return Intl.message(
      'Понедельник',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `Вторник`
  String get tuesday {
    return Intl.message(
      'Вторник',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Среда`
  String get wednesday {
    return Intl.message(
      'Среда',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Четверг`
  String get thursday {
    return Intl.message(
      'Четверг',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `Пятница`
  String get friday {
    return Intl.message(
      'Пятница',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `Суббота`
  String get saturday {
    return Intl.message(
      'Суббота',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `Воскресенье`
  String get sunday {
    return Intl.message(
      'Воскресенье',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  /// `Отсутствие`
  String get absent {
    return Intl.message(
      'Отсутствие',
      name: 'absent',
      desc: '',
      args: [],
    );
  }

  /// `Присутствие`
  String get present {
    return Intl.message(
      'Присутствие',
      name: 'present',
      desc: '',
      args: [],
    );
  }

  /// `Материал`
  String get material {
    return Intl.message(
      'Материал',
      name: 'material',
      desc: '',
      args: [],
    );
  }

  /// `Название курса`
  String get courseName {
    return Intl.message(
      'Название курса',
      name: 'courseName',
      desc: '',
      args: [],
    );
  }

  /// `Подкурс`
  String get subCourse {
    return Intl.message(
      'Подкурс',
      name: 'subCourse',
      desc: '',
      args: [],
    );
  }

  /// `Очистить все`
  String get clearAll {
    return Intl.message(
      'Очистить все',
      name: 'clearAll',
      desc: '',
      args: [],
    );
  }

  /// `Язык`
  String get language {
    return Intl.message(
      'Язык',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, выберите язык`
  String get pleaseSelectALanguage {
    return Intl.message(
      'Пожалуйста, выберите язык',
      name: 'pleaseSelectALanguage',
      desc: '',
      args: [],
    );
  }

  /// `Инклюзивные технологий`
  String get inclusiveTechnology {
    return Intl.message(
      'Инклюзивные технологий',
      name: 'inclusiveTechnology',
      desc: '',
      args: [],
    );
  }

  /// `Выберите функции системы для людей с ограниченными возможностями`
  String get selectSystemFeaturesForPeopleWithDisabilities {
    return Intl.message(
      'Выберите функции системы для людей с ограниченными возможностями',
      name: 'selectSystemFeaturesForPeopleWithDisabilities',
      desc: '',
      args: [],
    );
  }

  /// `Дополнительные возможности`
  String get additionalFeatures {
    return Intl.message(
      'Дополнительные возможности',
      name: 'additionalFeatures',
      desc: '',
      args: [],
    );
  }

  /// `Дополнительные настройки`
  String get additionalSettings {
    return Intl.message(
      'Дополнительные настройки',
      name: 'additionalSettings',
      desc: '',
      args: [],
    );
  }

  /// `Версия для людей с ограниченными возможностями`
  String get versionForPeopleWithDisabilities {
    return Intl.message(
      'Версия для людей с ограниченными возможностями',
      name: 'versionForPeopleWithDisabilities',
      desc: '',
      args: [],
    );
  }

  /// `Дополнительные функции, которые помогут вам лучше воспринимать информацию`
  String get additionalFeaturesToHelpYouPerceiveInformationBetter {
    return Intl.message(
      'Дополнительные функции, которые помогут вам лучше воспринимать информацию',
      name: 'additionalFeaturesToHelpYouPerceiveInformationBetter',
      desc: '',
      args: [],
    );
  }

  /// `Изменить`
  String get change {
    return Intl.message(
      'Изменить',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Уведомления`
  String get notifications {
    return Intl.message(
      'Уведомления',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'kk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
