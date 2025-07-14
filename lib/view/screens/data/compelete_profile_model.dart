class CompleteProfileModel {
  String? bloodType;
  List<String>? medicalDiagnoses;
  List<String>? medicalReports;
  List<LabTest>? laboratoryTests;
  List<Vaccination>? vaccinations;
  List<PreviousTestComparison>? previousTestComparisons;
  List<Comment>? comments;
  String? familyHealthHistory;
  String? idCard;
  String? healthNumber;
  String? chronicDiseases;
  String? allergies;
  String? currentMedications;
  String? lastExaminationDate;
  EmergencyContact? emergencyContact;
  String? lastHospitalAdmissionDate;
  String? previousSurgeries;
  List<PreviousMedication>? pastMedications;
  String? userName;
  String? email;
  String? gender;
  int? age;
  String? role;
  String? phone;
  String? address;

  CompleteProfileModel({
    this.bloodType,
    this.medicalDiagnoses,
    this.medicalReports,
    this.laboratoryTests,
    this.vaccinations,
    this.previousTestComparisons,
    this.comments,
    this.familyHealthHistory,
    this.idCard,
    this.healthNumber,
    this.chronicDiseases,
    this.allergies,
    this.currentMedications,
    this.lastExaminationDate,
    this.emergencyContact,
    this.lastHospitalAdmissionDate,
    this.previousSurgeries,
    this.pastMedications,
    this.userName,
    this.email,
    this.gender,
    this.age,
    this.role,
    this.phone,
    this.address,
  });

  factory CompleteProfileModel.fromJson(Map<String, dynamic> json) {
    return CompleteProfileModel(
      bloodType: json['bloodType'],
      medicalDiagnoses: List<String>.from(json['medicalHistory']['medicalDiagnoses'] ?? []),
      medicalReports: List<String>.from(json['medicalHistory']['medicalReports'] ?? []),
      laboratoryTests: (json['medicalHistory']['laboratoryTests'] as List?)
          ?.map((e) => LabTest.fromJson(e))
          .toList(),
      vaccinations: (json['medicalHistory']['vaccinations'] as List?)
          ?.map((e) => Vaccination.fromJson(e))
          .toList(),
      previousTestComparisons: (json['previousMedications']['previousTestComparisons'] as List?)
          ?.map((e) => PreviousTestComparison.fromJson(e))
          .toList(),
      comments: (json['comments'] as List?)?.map((e) => Comment.fromJson(e)).toList(),
      familyHealthHistory: json['familyHealthHistory'],
      idCard: json['idCard'],
      healthNumber: json['healthNumber'],
      chronicDiseases: json['generalHealthStatus']['chronicDiseases'],
      allergies: json['generalHealthStatus']['allergies'],
      currentMedications: json['generalHealthStatus']['currentMedications'],
      lastExaminationDate: json['generalHealthStatus']['lastExaminationDate'],
      emergencyContact: EmergencyContact.fromString(json['stateOfEmergency']['emergencyContact']),
      lastHospitalAdmissionDate: json['stateOfEmergency']['lastHospitalAdmissionDate'],
      previousSurgeries: json['stateOfEmergency']['previousSurgeries'],
      pastMedications: (json['previousMedications']['pastMedications'] as List?)
          ?.map((e) => PreviousMedication.fromJson(e))
          .toList(),
      userName: json['userName'],
      email: json['email'],
      gender: json['gender'],
      age: json['age'],
      role: json['role'],
      phone: json['phone'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bloodType': bloodType,
      'medicalHistory': {
        'medicalDiagnoses': medicalDiagnoses != null && medicalDiagnoses!.isNotEmpty
          ? medicalDiagnoses!.first
          : null,
         'medicalReports': medicalReports != null && medicalReports!.isNotEmpty
          ? medicalReports!.first
          : null,
        'laboratoryTests': laboratoryTests?.map((e) => e.toJson()).toList(),
        'vaccinations': vaccinations?.map((e) => e.toJson()).toList(),
      },
      'previousMedications': {
        'previousTestComparisons': previousTestComparisons?.map((e) => e.toJson()).toList(),
        'pastMedications': pastMedications?.map((e) => e.toJson()).toList(),
      },
      'comments': comments?.map((e) => e.toJson()).toList(),
      'familyHealthHistory': familyHealthHistory,
      'idCard': idCard,
      'healthNumber': healthNumber,
      'generalHealthStatus': {
        'chronicDiseases': chronicDiseases,
        'allergies': allergies,
        'currentMedications': currentMedications,
        'lastExaminationDate': lastExaminationDate,
      },
      'stateOfEmergency': {
        'emergencyContact': emergencyContact?.toString(),
        'lastHospitalAdmissionDate': lastHospitalAdmissionDate,
        'previousSurgeries': previousSurgeries,
      },
      'userName': userName,
      'email': email,
      'gender': gender,
      'age': age,
      'role': role,
      'phone': phone,
      'address': address,
    };
  }
}

class LabTest {
  String? testName;
  String? date;

  LabTest({this.testName, this.date});

  factory LabTest.fromJson(Map<String, dynamic> json) => LabTest(
        testName: json['testName'],
        date: json['date'],
      );

  Map<String, dynamic> toJson() => {
        'testName': testName,
        'date': date,
      };
}

class Vaccination {
  String? vaccineName;
  String? date;

  Vaccination({this.vaccineName, this.date});

  factory Vaccination.fromJson(Map<String, dynamic> json) => Vaccination(
        vaccineName: json['vaccineName'],
        date: json['date'],
      );

  Map<String, dynamic> toJson() => {
        'vaccineName': vaccineName,
        'date': date,
      };
}

class PreviousTestComparison {
  String? testName;
  String? result;

  PreviousTestComparison({this.testName, this.result});

  factory PreviousTestComparison.fromJson(Map<String, dynamic> json) => PreviousTestComparison(
        testName: json['testName'],
        result: json['result'],
      );

  Map<String, dynamic> toJson() => {
        'testName': testName,
        'result': result,
      };
}

class Comment {
  String? text;
  String? date;

  Comment({this.text, this.date});

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        text: json['text'],
        date: json['date'],
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'date': date,
      };
}

class EmergencyContact {
  String? name;
  String? phone;

  EmergencyContact({this.name, this.phone});

  // Format: "Name - PhoneNumber"
  factory EmergencyContact.fromString(String? raw) {
    if (raw == null || !raw.contains('-')) return EmergencyContact();
    final parts = raw.split('-');
    return EmergencyContact(
      name: parts[0].trim(),
      phone: parts[1].trim(),
    );
  }

  @override
  String toString() {
    return "$name - $phone";
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
      };
}

class PreviousMedication {
  String? medicationName;
  String? duration;

  PreviousMedication({this.medicationName, this.duration});

  factory PreviousMedication.fromJson(Map<String, dynamic> json) => PreviousMedication(
        medicationName: json['medicationName'],
        duration: json['duration'],
      );

  Map<String, dynamic> toJson() => {
        'medicationName': medicationName,
        'duration': duration,
      };
}
