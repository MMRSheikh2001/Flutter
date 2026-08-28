import 'package:homeflutterproject/enums/employment_type.dart';
import 'package:homeflutterproject/enums/workplace_type.dart';

class JobResponse {
  final int? id;
  final String? title;
  final String? jobDescription;
  final String? jobResponsibilities;
  final String? educationalRequirements;
  final String? experienceRequirements;
  final int? minExperience;
  final int? maxExperience;
  final String? additionalRequirements;
  final String? benefits;
  final double? salaryMin;
  final double? salaryMax;
  final bool? isNegotiable;
  final DateTime? applicationDeadline;
  final bool? isActive;
  final int? vacancy;
  final EmploymentType? employmentType;
  final WorkPlaceType? workPlaceType;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  // Company details
  final int? companyProfileId;
  final int? userId;
  final String? userEmail;
  final String? companyName;
  final String? companyEmail;
  final String? companyPhone;
  final String? companyDescription;
  final String? companyWebsite;
  final String? companyLogo;

  // Location details
  final int? locationCountryId;
  final String? locationCountryName;
  final String? locationCountryCode;
  final int? locationDivisionId;
  final String? locationDivisionName;
  final int? locationDistrictId;
  final String? locationDistrictName;
  final int? locationPoliceStationId;
  final String? locationPoliceStationName;

  // Category
  final int? categoryId;
  final String? categoryName;

  // AI Integration
  final bool? aiScreeningEnabled;
  final bool? aiCvScreeningEnabled;
  final bool? aiInterviewEnabled;
  final int? aiMatchThreshold;
  final int? aiQuestionCount;
  final int? aiShortlistCount;
  final int? aiDeadlineDays;

  JobResponse({
    this.id,
    this.title,
    this.jobDescription,
    this.jobResponsibilities,
    this.educationalRequirements,
    this.experienceRequirements,
    this.minExperience,
    this.maxExperience,
    this.additionalRequirements,
    this.benefits,
    this.salaryMin,
    this.salaryMax,
    this.isNegotiable,
    this.applicationDeadline,
    this.isActive,
    this.vacancy,
    this.employmentType,
    this.workPlaceType,
    this.createdAt,
    this.updatedAt,
    this.companyProfileId,
    this.userId,
    this.userEmail,
    this.companyName,
    this.companyEmail,
    this.companyPhone,
    this.companyDescription,
    this.companyWebsite,
    this.companyLogo,
    this.locationCountryId,
    this.locationCountryName,
    this.locationCountryCode,
    this.locationDivisionId,
    this.locationDivisionName,
    this.locationDistrictId,
    this.locationDistrictName,
    this.locationPoliceStationId,
    this.locationPoliceStationName,
    this.categoryId,
    this.categoryName,
    this.aiScreeningEnabled,
    this.aiCvScreeningEnabled,
    this.aiInterviewEnabled,
    this.aiMatchThreshold,
    this.aiQuestionCount,
    this.aiShortlistCount,
    this.aiDeadlineDays,
  });

  // Factory constructor to create a [JobResponseDTO] instance from a JSON map.
  factory JobResponse.fromJson(Map<String, dynamic> json) {
    return JobResponse(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      jobDescription: json['jobDescription'] as String?,
      jobResponsibilities: json['jobResponsibilities'] as String?,
      educationalRequirements: json['educationalRequirements'] as String?,
      experienceRequirements: json['experienceRequirements'] as String?,
      minExperience: (json['minExperience'] as num?)?.toInt(),
      maxExperience: (json['maxExperience'] as num?)?.toInt(),
      additionalRequirements: json['additionalRequirements'] as String?,
      benefits: json['benefits'] as String?,
      salaryMin: (json['salaryMin'] as num?)?.toDouble(),
      salaryMax: (json['salaryMax'] as num?)?.toDouble(),
      isNegotiable: json['isNegotiable'] as bool?,
      applicationDeadline: json['applicationDeadline'] != null
          ? DateTime.tryParse(json['applicationDeadline'] as String)
          : null,
      isActive: json['isActive'] as bool?,
      vacancy: (json['vacancy'] as num?)?.toInt(),
      employmentType: json['employmentType'] != null
          ? EmploymentType.fromJson(json['employmentType'] as String)
          : null,
      workPlaceType: json['workPlaceType'] != null
          ? WorkPlaceType.fromJson(json['workPlaceType'] as String)
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'] as String)
          : null,
      companyProfileId: (json['companyProfileId'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      userEmail: json['userEmail'] as String?,
      companyName: json['companyName'] as String?,
      companyEmail: json['companyEmail'] as String?,
      companyPhone: json['companyPhone'] as String?,
      companyDescription: json['companyDescription'] as String?,
      companyWebsite: json['companyWebsite'] as String?,
      companyLogo: json['companyLogo'] as String?,
      locationCountryId: (json['locationCountryId'] as num?)?.toInt(),
      locationCountryName: json['locationCountryName'] as String?,
      locationCountryCode: json['locationCountryCode'] as String?,
      locationDivisionId: (json['locationDivisionId'] as num?)?.toInt(),
      locationDivisionName: json['locationDivisionName'] as String?,
      locationDistrictId: (json['locationDistrictId'] as num?)?.toInt(),
      locationDistrictName: json['locationDistrictName'] as String?,
      locationPoliceStationId: (json['locationPoliceStationId'] as num?)?.toInt(),
      locationPoliceStationName: json['locationPoliceStationName'] as String?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      categoryName: json['categoryName'] as String?,
      aiScreeningEnabled: json['aiScreeningEnabled'] as bool?,
      aiCvScreeningEnabled: json['aiCvScreeningEnabled'] as bool?,
      aiInterviewEnabled: json['aiInterviewEnabled'] as bool?,
      aiMatchThreshold: (json['aiMatchThreshold'] as num?)?.toInt(),
      aiQuestionCount: (json['aiQuestionCount'] as num?)?.toInt(),
      aiShortlistCount: (json['aiShortlistCount'] as num?)?.toInt(),
      aiDeadlineDays: (json['aiDeadlineDays'] as num?)?.toInt(),
    );
  }



}
