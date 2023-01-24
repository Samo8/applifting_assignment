import 'package:applifting_assignment/models/links.dart';
import 'package:equatable/equatable.dart';

import 'package:applifting_assignment/models/headquarters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_info.g.dart';

@JsonSerializable()
class CompanyInfo extends Equatable {
  final Headquarters headquarters;
  final Links links;
  final String name;
  final String founder;
  final int founded;
  final int employees;
  final int vehicles;
  final int launchSites;
  final int testSites;
  final String ceo;
  final String cto;
  final String coo;
  final int valuation;
  final String summary;
  final String id;

  const CompanyInfo({
    required this.headquarters,
    required this.links,
    required this.name,
    required this.founder,
    required this.founded,
    required this.employees,
    required this.vehicles,
    required this.launchSites,
    required this.testSites,
    required this.ceo,
    required this.cto,
    required this.coo,
    required this.valuation,
    required this.summary,
    required this.id,
  });

  CompanyInfo copyWith({
    Headquarters? headquarters,
    Links? links,
    String? name,
    String? founder,
    int? founded,
    int? employees,
    int? vehicles,
    int? launchSites,
    int? testSites,
    String? ceo,
    String? cto,
    String? coo,
    int? valuation,
    String? summary,
    String? id,
  }) {
    return CompanyInfo(
      headquarters: headquarters ?? this.headquarters,
      links: links ?? this.links,
      name: name ?? this.name,
      founder: founder ?? this.founder,
      founded: founded ?? this.founded,
      employees: employees ?? this.employees,
      vehicles: vehicles ?? this.vehicles,
      launchSites: launchSites ?? this.launchSites,
      testSites: testSites ?? this.testSites,
      ceo: ceo ?? this.ceo,
      cto: cto ?? this.cto,
      coo: coo ?? this.coo,
      valuation: valuation ?? this.valuation,
      summary: summary ?? this.summary,
      id: id ?? this.id,
    );
  }

  factory CompanyInfo.fromJson(Map<String, dynamic> json) => _$CompanyInfoFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyInfoToJson(this);

  @override
  List<Object?> get props => [
        headquarters,
        links,
        name,
        founder,
        founded,
        employees,
        vehicles,
        launchSites,
        testSites,
        ceo,
        cto,
        coo,
        valuation,
        summary,
        id,
      ];
}
