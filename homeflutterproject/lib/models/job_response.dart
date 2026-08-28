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

  JobResponse(
  {
    
}
      );


}