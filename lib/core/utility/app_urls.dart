class AppUrls {
  static const String _baseUrl =
      'https://spectre0110-backend.vercel.app/api/v1';

  //create
  static const String registerUrl = '$_baseUrl/users/create';

  //auth
  static const String loginUrl = '$_baseUrl/auth/login';
  static const String send_otp = '$_baseUrl/auth/send-otp';
  static const String verify_otp = '$_baseUrl/auth/verify-otp';
  static const String reset_pass = '$_baseUrl/auth/reset-password';
  static const String updateUser = '$_baseUrl/auth/profile';
  static const String updateUserImage = '$_baseUrl/auth/profile/image-update';
  static const String user = '$_baseUrl/auth/profile';

  //resource
  static const String createResource = '$_baseUrl/resource/create';
  static const String allResource = '$_baseUrl/resource/all';
  static const String resource = '$_baseUrl/resource';

  //hospital
  static const String createHospital = '$_baseUrl/hospital/create';
  static const String allHospital = '$_baseUrl/hospital/all';
  static const String hospital = '$_baseUrl/hospital/';

  //appointment
  static const String createAppointment = '$_baseUrl/appointment/create';
  static const String myAppointment = '$_baseUrl/appointment/my-appointments';
  static const String allAppointment = '$_baseUrl/appointment/all-appointments';
  static const String appointment = '$_baseUrl/appointment';

  //medication
  static const String createMedication = '$_baseUrl/medication/create';
  static const String allMedication = '$_baseUrl/medication/all';
  static const String myMedication = '$_baseUrl/medication/my/medications';
  static const String medication = '$_baseUrl/medication';

  //symptoms
  static const String createSymptoms = '$_baseUrl/symptoms/create';
  static const String allSymptoms = '$_baseUrl/symptoms/all';
  static const String mySymptoms = '$_baseUrl/symptoms/my/symptoms';
  static const String symptoms = '$_baseUrl/symptoms';

  //pain
  static const String createPain = '$_baseUrl/pain/create';
  static const String allPain = '$_baseUrl/pain/all';
  static const String myPain = '$_baseUrl/pain/my/pains';
  static const String pain = '$_baseUrl/pain';

  //goal
  static const String createWeightGoal = '$_baseUrl/goal/weight/create';
  static const String myWeightGoal = '$_baseUrl/goal/weight/goals';
  static const String weightGoal = '$_baseUrl/goal/weight';

  //water intake
  static const String createWaterIntake = '$_baseUrl/goal/water-intake';
  static const String waterIntake = '$_baseUrl/goal/water-intake/goal';

  //medicine reminder
  static const String createMedicineReminder = '$_baseUrl/medication/reminder/create';
  static const String myMedicineReminder = '$_baseUrl/medication/reminders/my-reminders';
  static const String singleReminder = '$_baseUrl/medication/reminders/my-reminder';

  //report
  static const String createReport = '$_baseUrl/medication/report/upload';
  static const String myReport = '$_baseUrl/medication/reports/my-reports';
  static const String singleReport = '$_baseUrl/report';

  //emergency contact
  static const String createEmergencyContact = '$_baseUrl/hospital/emergency-contact/create';
  static const String emergencyContact = '$_baseUrl/hospital/emergency/contacts';

}
