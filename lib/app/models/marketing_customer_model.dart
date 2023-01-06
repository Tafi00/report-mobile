import 'dart:convert';

class MarketingCustomerModel {
  final String customerId, customerName, avatar, title;
  final num totalRevenuePlan,
      totalRevenue,
      inactive,
      pending,
      active,
      complete,
      unknown;

  MarketingCustomerModel({
    required this.customerId,
    required this.customerName,
    required this.avatar,
    required this.totalRevenuePlan,
    required this.totalRevenue,
    required this.title,
    required this.inactive,
    required this.pending,
    required this.active,
    required this.complete,
    required this.unknown,
  });

  factory MarketingCustomerModel.fromJson(Map<String, dynamic> json) {
    return MarketingCustomerModel(
      avatar: json['avatar'],
      customerId: json['customerId'],
      customerName: json['customerName'],
      totalRevenuePlan: json['totalRevenuePlan'] ?? 0,
      totalRevenue: json['totalRevenue'] ?? 0,
      title: json['title'],
      inactive: json['inactive'] ?? 0,
      pending: json['pending'] ?? 0,
      active: json['active'] ?? 0,
      complete: json['complete'] ?? 0,
      unknown: json['unknown'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "customerId": customerId,
        "customerName": customerName,
        "totalRevenuePlan": totalRevenuePlan,
        "totalRevenue": totalRevenue,
        "title": title,
      };
}
