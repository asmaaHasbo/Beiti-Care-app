// نموذج الـ response الرئيسي
class UserResponseModel {
  final String message;
  final UserModel user;

  UserResponseModel({
    required this.message,
    required this.user,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      message: json['message'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}

// نموذج المستخدم
class UserModel {
  final String id;
  final String userName;
  final String email;
  final String password;
  final String? gender; // جعل nullable
  final int? age; // جعل nullable
  final int? years; // جعل nullable
  final int? phone; // جعل nullable
  final int v;
  final String role;
  final String updatedAt;
  final String? bloodType; // جعل nullable
  final List<String> comments;
  final String? familyHealthHistory; // جعل nullable
  final String? healthNumber; // جعل nullable
  final String? idCard; // جعل nullable
  final List<MedicalFileModel> medicalFiles;
  final String? fingerprint; // جعل nullable
  final GeneralHealthStatusModel generalHealthStatus;
  final StateOfEmergencyModel stateOfEmergency;
  final MedicalHistoryModel medicalHistory;
  final PreviousMedicationsModel previousMedications;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
    this.gender,
    this.age,
    this.years,
    this.phone,
    required this.v,
    required this.role,
    required this.updatedAt,
    this.bloodType,
    required this.comments,
    this.familyHealthHistory,
    this.healthNumber,
    this.idCard,
    required this.medicalFiles,
    this.fingerprint,
    required this.generalHealthStatus,
    required this.stateOfEmergency,
    required this.medicalHistory,
    required this.previousMedications,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      gender: json['gender'] as String?,
      age: json['age'] != null
          ? (json['age'] is String ? int.tryParse(json['age']) : json['age'] as int?)
          : null,
      years: json['years'] != null
          ? (json['years'] is String ? int.tryParse(json['years']) : json['years'] as int?)
          : null,
      phone: json['phone'] != null
          ? (json['phone'] is String ? int.tryParse(json['phone']) : json['phone'] as int?)
          : null,
      v: json['__v'] != null
          ? (json['__v'] is String ? int.parse(json['__v']) : json['__v'] as int? ?? 0)
          : 0,
      role: json['role'] as String,
      updatedAt: json['updatedAt'] as String,
      bloodType: json['bloodType'] as String?,
      comments: (json['comments'] as List<dynamic>? ?? []).cast<String>(),
      familyHealthHistory: json['familyHealthHistory'] as String?,
      healthNumber: json['healthNumber'] as String?,
      idCard: json['idCard'] as String?,
      medicalFiles: (json['medicalFiles'] as List<dynamic>? ?? [])
          .map((item) => MedicalFileModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      fingerprint: json['fingerprint'] as String?,
      generalHealthStatus: GeneralHealthStatusModel.fromJson(
          json['generalHealthStatus'] as Map<String, dynamic>),
      stateOfEmergency: StateOfEmergencyModel.fromJson(
          json['stateOfEmergency'] as Map<String, dynamic>),
      medicalHistory: MedicalHistoryModel.fromJson(
          json['medicalHistory'] as Map<String, dynamic>),
      previousMedications: PreviousMedicationsModel.fromJson(
          json['previousMedications'] as Map<String, dynamic>),
    );
  }

}
// نموذج الملف الطبي
class MedicalFileModel {
  final String testName;
  final String fileUrl;
  final String id;
  final String uploadedAt;

  MedicalFileModel({
    required this.testName,
    required this.fileUrl,
    required this.id,
    required this.uploadedAt,
  });

  factory MedicalFileModel.fromJson(Map<String, dynamic> json) {
    return MedicalFileModel(
      testName: json['testName'] as String? ?? 'unknown',
      fileUrl: json['fileUrl'] as String? ?? 'unknown_url',
      id: json['_id'] as String? ?? 'unknown_id',
      uploadedAt: json['uploadedAt'] as String? ?? 'unknown_date',
    );
  }
}


// نموذج الحالة الصحية العامة
class GeneralHealthStatusModel {
  final String chronicDiseases;
  final String allergies;
  final String currentMedications;
  final String lastExaminationDate;

  GeneralHealthStatusModel({
    required this.chronicDiseases,
    required this.allergies,
    required this.currentMedications,
    required this.lastExaminationDate,
  });

  factory GeneralHealthStatusModel.fromJson(Map<String, dynamic> json) {
    return GeneralHealthStatusModel(
      chronicDiseases: json['chronicDiseases'] as String,
      allergies: json['allergies'] as String,
      currentMedications: json['currentMedications'] as String,
      lastExaminationDate: json['lastExaminationDate'] as String,
    );
  }
}

// نموذج حالة الطوارئ
class StateOfEmergencyModel {
  final String emergencyContact;
  final String lastHospitalAdmissionDate;
  final String previousSurgeries;

  StateOfEmergencyModel({
    required this.emergencyContact,
    required this.lastHospitalAdmissionDate,
    required this.previousSurgeries,
  });

  factory StateOfEmergencyModel.fromJson(Map<String, dynamic> json) {
    return StateOfEmergencyModel(
      emergencyContact: json['emergencyContact'] as String,
      lastHospitalAdmissionDate: json['lastHospitalAdmissionDate'] as String,
      previousSurgeries: json['previousSurgeries'] as String,
    );
  }
}

// نموذج التاريخ الطبي
class MedicalHistoryModel {
  final List<LaboratoryTestModel> laboratoryTests;
  final String medicalReports;
  final String medicalDiagnoses;
  final List<VaccinationModel> vaccinations;

  MedicalHistoryModel({
    required this.laboratoryTests,
    required this.medicalReports,
    required this.medicalDiagnoses,
    required this.vaccinations,
  });

  factory MedicalHistoryModel.fromJson(Map<String, dynamic> json) {
    return MedicalHistoryModel(
      laboratoryTests: (json['laboratoryTests'] as List<dynamic>? ?? [])
          .map((item) => LaboratoryTestModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      medicalReports: json['medicalReports'] as String,
      medicalDiagnoses: json['medicalDiagnoses'] as String,
      vaccinations: (json['vaccinations'] as List<dynamic>? ?? [])
          .map((item) => VaccinationModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

// نموذج اختبار المختبر
class LaboratoryTestModel {
  final String testName;
  final String ? date;
  final String id;
  final String fileUrl;
  

  LaboratoryTestModel({
    required this.testName,
    required this.date,
    required this.id,
    required this.fileUrl
  });

  factory LaboratoryTestModel.fromJson(Map<String, dynamic> json) {
    return LaboratoryTestModel(
      testName: json['testName'] as String? ?? 'unknown_Name',
      date: json['date'] as String?,
    fileUrl: json['fileUrl'] as String? ?? 'unknown_url', // قيمة افتراضية
      id: json['_id'] as String,
    );
  }
}

// نموذج التطعيم
class VaccinationModel {
  final String vaccineName;
  final String? date; // جعل الحقل nullable
  final String id;

  VaccinationModel({
    required this.vaccineName,
    required this.date,
    required this.id,
  });

  factory VaccinationModel.fromJson(Map<String, dynamic> json) {
    return VaccinationModel(
      vaccineName: json['vaccineName'] as String? ?? 'unknown_vaccine',
      date: json['date'] as String?, // التعامل مع null
      id: json['_id'] as String? ?? 'unknown_id',
    );
  }
}
// نموذج الأدوية السابقة
class PreviousMedicationsModel {
  final List<PreviousTestComparisonModel> previousTestComparisons;
  final List<PastMedicationModel> pastMedications;

  PreviousMedicationsModel({
    required this.previousTestComparisons,
    required this.pastMedications,
  });

  factory PreviousMedicationsModel.fromJson(Map<String, dynamic> json) {
    return PreviousMedicationsModel(
      previousTestComparisons: (json['previousTestComparisons'] as List<dynamic>? ?? [])
          .map((item) =>
              PreviousTestComparisonModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      pastMedications: (json['pastMedications'] as List<dynamic>? ?? [])
          .map((item) => PastMedicationModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

// نموذج مقارنة الاختبارات السابقة
class PreviousTestComparisonModel {
  final String testName;
  final List<int> results;
  final String id;

  PreviousTestComparisonModel({
    required this.testName,
    required this.results,
    required this.id,
  });

  factory PreviousTestComparisonModel.fromJson(Map<String, dynamic> json) {
    return PreviousTestComparisonModel(
      testName: json['testName'] as String,
      results: (json['results'] as List<dynamic>? ?? []).cast<int>(),
      id: json['_id'] as String,
    );
  }
}

// نموذج الأدوية السابقة
class PastMedicationModel {
  final String medicationName;
  final String? duration; // جعل الحقل nullable
  final String id;

  PastMedicationModel({
    required this.medicationName,
    required this.duration,
    required this.id,
  });

  factory PastMedicationModel.fromJson(Map<String, dynamic> json) {
    return PastMedicationModel(
      medicationName: json['medicationName'] as String? ?? 'unknown_medication',
      duration: json['duration'] as String?, // التعامل مع null
      id: json['_id'] as String? ?? 'unknown_id',
    );
  }
}