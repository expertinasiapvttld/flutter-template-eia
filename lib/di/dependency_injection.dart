import 'package:get_it/get_it.dart';
import 'package:happy_grocers/utils/network/dio_api_client.dart';

final getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  getIt.registerLazySingleton<DioApiClient>(() => DioApiClient());

  /// Blocs here
  // hjSl.registerFactory(
  //   () => ParentBloc(
  //     profileUseCase: hjSl(),
  //     guardianNoticeBoardUseCase: hjSl(),
  //     holidayUseCase: hjSl(),
  //     feedbackUseCase: hjSl(),
  //     homeworkUseCase: hjSl(),
  //     feedbackListUseCase: hjSl(),
  //   ),
  // );

  // hjSl.registerFactory(
  //   () => CommonBloc(
  //     loginUseCase: hjSl(),
  //     logoutUseCase: hjSl(),
  //     changePasswordUseCase: hjSl(),
  //     attendanceUseCase: hjSl(),
  //     updateNotificationStatusUseCase: hjSl(),
  //   ),
  // );

  // hjSl.registerFactory(
  //   () => TeacherBloc(
  //     teacherProfileUseCase: hjSl(),
  //     teacherClassesUseCase: hjSl(),
  //     classeAttendanceSummaryUseCase: hjSl(),
  //     studentListUseCase: hjSl(),
  //     feedbackUseCase: hjSl(),
  //     letterListUseCase: hjSl(),
  //     addHomeworkUseCase: hjSl(),
  //     homeworkListUseCase: hjSl(),
  //     manualAttendanceUseCase: hjSl(),
  //   ),
  // );

  // /// usecases here
  // hjSl.registerLazySingleton(
  //   () => FeedbackListUseCase(parentRepository: hjSl()),
  // );
  // hjSl.registerLazySingleton(
  //   () => ProfileUseCase(parentRepository: hjSl()),
  // );
  // hjSl.registerLazySingleton(
  //   () => UpdateNotificationStatusUseCase(commonRepository: hjSl()),
  // );
  // hjSl.registerLazySingleton(
  //   () => GuardianNoticeBoardUseCase(parentRepository: hjSl()),
  // );
  // hjSl.registerLazySingleton(
  //   () => HolidayUseCase(parentRepository: hjSl()),
  // );
  // hjSl.registerLazySingleton(
  //   () => HomeworkUseCase(parentRepository: hjSl()),
  // );
  // hjSl.registerLazySingleton(
  //   () => FeedbackUseCase(parentRepository: hjSl()),
  // );
  // hjSl.registerLazySingleton(
  //   () => LoginUseCase(commonRepository: hjSl()),
  // );
  // hjSl.registerLazySingleton(
  //   () => LogoutUseCase(commonRepository: hjSl()),
  // );
  // hjSl.registerLazySingleton(
  //   () => AttendanceUseCase(commonRepository: hjSl()),
  // );
  // hjSl.registerLazySingleton(
  //     () => ChangePasswordUseCase(commonRepository: hjSl()));
  // hjSl.registerLazySingleton(
  //   () => TeacehrProfileUseCase(teacherRepository: hjSl()),
  // );
  // hjSl.registerLazySingleton(
  //     () => TeacherClassesUseCase(teacherRepository: hjSl()));
  // hjSl.registerLazySingleton(
  //   () => LetterListUseCase(teacherRepository: hjSl()),
  // );
  // hjSl.registerLazySingleton(
  //   () => ClasseAttendanceSummaryUseCase(teacherRepository: hjSl()),
  // );

  // hjSl.registerLazySingleton(
  //   () => StudentListUseCase(teacherRepository: hjSl()),
  // );
  // hjSl.registerLazySingleton(
  //   () => PostFeedbackUseCase(teacherRepository: hjSl()),
  // );

  // hjSl.registerLazySingleton(
  //   () => AddHomeworkUseCase(teacherRepository: hjSl()),
  // );

  // hjSl.registerLazySingleton(
  //   () => HomeworkListUseCase(teacherRepository: hjSl()),
  // );

  // hjSl.registerLazySingleton(
  //   () => ManualAttendanceUseCase(teacherRepository: hjSl()),
  // );

  // /// Data sources here
  // hjSl.registerLazySingleton<ParentDataSource>(() => ParentDataSourceImpl());
  // hjSl.registerLazySingleton<TeacherDataSource>(() => TeacherDataSourceImpl());
  // hjSl.registerLazySingleton<CommonDataSource>(() => CommonDataSourceImpl());

  // /// Repositories here
  // hjSl.registerLazySingleton<ParentRepository>(
  //     () => ParentRepositoryImpl(parentDataSource: hjSl()));
  // hjSl.registerLazySingleton<TeacherRepository>(
  //     () => TeacherRepositoryImpl(teacherDataSource: hjSl()));
  // hjSl.registerLazySingleton<CommonRepository>(
  //     () => CommonRepositoryImpl(commonDataSource: hjSl()));
}
