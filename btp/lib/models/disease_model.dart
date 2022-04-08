class DiseaseModel {
  String? disease;
  String? symptom1;
  String? symptom2;
  String? symptom3;
  String? symptom4;
  String? symptom5;
  String? symptom6;
  String? symptom7;
  String? symptom8;
  String? symptom9;
  String? symptom10;
  String? symptom11;
  String? symptom12;
  String? symptom13;
  String? symptom14;
  String? symptom15;
  String? symptom16;
  String? symptom17;

  DiseaseModel(
      {this.disease,
      this.symptom1,
      this.symptom2,
      this.symptom3,
      this.symptom4,
      this.symptom5,
      this.symptom6,
      this.symptom7,
      this.symptom8,
      this.symptom9,
      this.symptom10,
      this.symptom11,
      this.symptom12,
      this.symptom13,
      this.symptom14,
      this.symptom15,
      this.symptom16,
      this.symptom17});

  DiseaseModel.fromJson(Map<String, dynamic> json) {
    disease = json['Disease'];
    symptom1 = json['Symptom_1'];
    symptom2 = json['Symptom_2'];
    symptom3 = json['Symptom_3'];
    symptom4 = json['Symptom_4'];
    symptom5 = json['Symptom_5'];
    symptom6 = json['Symptom_6'];
    symptom7 = json['Symptom_7'];
    symptom8 = json['Symptom_8'];
    symptom9 = json['Symptom_9'];
    symptom10 = json['Symptom_10'];
    symptom11 = json['Symptom_11'];
    symptom12 = json['Symptom_12'];
    symptom13 = json['Symptom_13'];
    symptom14 = json['Symptom_14'];
    symptom15 = json['Symptom_15'];
    symptom16 = json['Symptom_16'];
    symptom17 = json['Symptom_17'];
  }
}