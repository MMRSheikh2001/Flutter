import 'dart:convert';
import 'package:work_bridge_flutter/auth/request/user_request.dart';
import 'package:work_bridge_flutter/enums/transaction_type.dart';

class TransactionFilterDTO {
  final TransactionType? transactionType;
  final UserRole? userRole;
  final String? keyword;
  final DateTime? fromDate;
  final DateTime? toDate;
  final int? userId;

  const TransactionFilterDTO({
    this.transactionType,
    this.userRole,
    this.keyword,
    this.fromDate,
    this.toDate,
    this.userId,
  });

  /// Factory constructor for parsing JSON
  factory TransactionFilterDTO.fromJson(Map<String, dynamic> json) {
    return TransactionFilterDTO(
      transactionType: json['transactionType'] != null
          ? TransactionType.values.byName(json['transactionType'] as String)
          : null,
      userRole: json['userRole'] != null
          ? UserRole.values.byName(json['userRole'] as String)
          : null,
      keyword: json['keyword'] as String?,
      fromDate: json['fromDate'] != null
          ? DateTime.tryParse(json['fromDate'].toString())
          : null,
      toDate: json['toDate'] != null
          ? DateTime.tryParse(json['toDate'].toString())
          : null,
      userId: json['userId'] as int?,
    );
  }

  /// Formats date to 'YYYY-MM-DD' for Java LocalDate backend expectations
  String? _formatDate(DateTime? date) {
    if (date == null) return null;
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  /// Converts the DTO into a Map for HTTP request body payload
  Map<String, dynamic> toJson() {
    return {
      'transactionType': transactionType?.name,
      'userRole': userRole?.name,
      'keyword': keyword,
      'fromDate': _formatDate(fromDate),
      'toDate': _formatDate(toDate),
      'userId': userId,
    };
  }

  /// Utility method for deep copies/updates
  TransactionFilterDTO copyWith({
    TransactionType? transactionType,
    UserRole? userRole,
    String? keyword,
    DateTime? fromDate,
    DateTime? toDate,
    int? userId,
  }) {
    return TransactionFilterDTO(
      transactionType: transactionType ?? this.transactionType,
      userRole: userRole ?? this.userRole,
      keyword: keyword ?? this.keyword,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      userId: userId ?? this.userId,
    );
  }

  String toRawJson() => json.encode(toJson());
}