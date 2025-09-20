
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../feature/auth/screens/home.dart';
import '../../feature/auth/screens/signup.dart';
import '../../feature/splash/screens/splash_screen.dart';

class AppRoute {
  static const String splash = '/Spalsh';
  static const String loginOrSignup = '/loginOrSignUP';
  static const String signin = '/SigninScreen';
  static const String signup = '/SignupScreen';
  static const String resetPassword = '/ResetPassword';
  static const String pincode = '/PinCodeScreen';
  static const String setNewPassword = '/SetNewPasswordScreen';
  static const String changedDone = '/ChangedDoneScreen';
  static const String slider = '/SliderScreen';
  static const String one = '/SetUpOne';
  static const String two = '/SetUpTwo';
  static const String three = '/SetUpThree';
  static const String navbar = '/NavBarPage';
  static const String notifications = '/Notifications';
  static const String hospital = '/Hospital';
  static const String addHospital = '/AddHospital';
  static const String hospitalDetails = '/HospitalDetails';
  static const String appointment = '/Appointment';
  static const String addAppointment = '/AddAppointment';
  static const String resourceDetails = '/ResourceDetails';
  static const String addResource = '/AddResource';
  static const String resource = '/Resource';
  static const String reminder = '/Reminder';
  static const String medication = '/Medication';
  static const String addReminder = '/AddReminder';
  static const String addReport = '/AddReport';
  static const String painManager = '/PainManager';
  static const String createRecord = '/CreateNewRecord';
  static const String painRecord = '/PainRecord';
  static const String editPainRecord = '/EditPainRecord';
  static const String profile = '/Profile';
  static const String editProfile = '/EditProfile';
  static const String aboutUs = '/AboutUs';
  static const String addEmergencyContacts = '/AddEmergencyContacts';
  static const String weight = '/Weight';
  static const String addGoals = '/AddGoals';
  static const String editGoals = '/EditGoals';
  static const String waterIntake = '/WaterIntake';
  static const String setWaterIntakeGoal = '/SetWaterIntakeGoal';
  static const String waterIntakeResult = '/WaterIntakeResult';

  static final route = [
    GetPage(
        name: splash,
        page: () => const SplashScreen(),
        transition: Transition.rightToLeft),
    // GetPage(
    //     name: slider,
    //     page: () => SliderScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: reminder,
    //     page: () => Reminder(),
    //     transition: Transition.rightToLeft),
    GetPage(
        name: signin,
        page: () => HomeScreen(),
        transition: Transition.rightToLeft,

    ),


    // GetPage(
    //     name: signup,
    //     page: () => SignupScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: addHospital,
    //     page: () => AddHospitalScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: resetPassword,
    //     page: () => ResetPassword(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: changedDone,
    //     page: () => ChangedDoneScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: pincode,
    //     page: () => PinCodeScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: setNewPassword,
    //     page: () => SetNewPasswordScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: one, page: () => SetUpOne(), transition: Transition.rightToLeft),
    // GetPage(
    //     name: two, page: () => SetUpTwo(), transition: Transition.rightToLeft),
    // GetPage(
    //     name: navbar,
    //     page: () => NavBarPage(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: notifications,
    //     page: () => NotificationsScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: appointment,
    //     page: () => AppointmentScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: addAppointment,
    //     page: () => AddAppointmentScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: resource,
    //     page: () => EducationResources(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: addAppointment,
    //     page: () => AddAppointmentScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: resourceDetails,
    //     page: () => ResourceDetails(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: medication,
    //     page: () => MedicationScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: addReminder,
    //     page: () => AddReminderScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: painManager,
    //     page: () => PainManagerScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: createRecord,
    //     page: () => CreateNewRecordScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: painRecord,
    //     page: () => PainRecordScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: editPainRecord,
    //     page: () => EditPainRecordScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: profile,
    //     page: () => ProfileScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: aboutUs,
    //     page: () => AboutUsScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: editProfile,
    //     page: () => EditProfileScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: addEmergencyContacts,
    //     page: () => AddEmergencyContacts(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: weight,
    //     page: () => WeightScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: addGoals,
    //     page: () => SetUpGoals(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: editGoals,
    //     page: () => EditGoals(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: waterIntake,
    //     page: () => WaterIntakeScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: setWaterIntakeGoal,
    //     page: () => SetWaterIntakeGoalScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: waterIntakeResult,
    //     page: () => WaterIntakeStatusScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: addReport,
    //     page: () => AddReportScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: addResource,
    //     page: () => AddResourceScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: hospitalDetails,
    //     page: () => HospitalsDetailsScreen(),
    //     transition: Transition.rightToLeft),
    // GetPage(
    //     name: hospital,
    //     page: () => HospitalScreen(),
    //     transition: Transition.rightToLeft),
  ];
}
