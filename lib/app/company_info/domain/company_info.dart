import 'package:applifting_assignment/app/company_info/domain/headquarters.dart';
import 'package:applifting_assignment/app/company_info/domain/links.dart';
import 'package:equatable/equatable.dart';

class CompanyInfo extends Equatable {
  final Headquarters headquarters;
  final Links links;
  final String name;
  final int founded;
  final int employees;
  final int vehicles;
  final int launchSites;
  final int testSites;
  final String ceo;
  final String cto;
  final int valuation;
  final String summary;

  const CompanyInfo({
    required this.headquarters,
    required this.links,
    required this.name,
    required this.founded,
    required this.employees,
    required this.vehicles,
    required this.launchSites,
    required this.testSites,
    required this.ceo,
    required this.cto,
    required this.valuation,
    required this.summary,
  });

  CompanyInfo copyWith({
    Headquarters? headquarters,
    Links? links,
    String? name,
    int? founded,
    int? employees,
    int? vehicles,
    int? launchSites,
    int? testSites,
    String? ceo,
    String? cto,
    int? valuation,
    String? summary,
  }) {
    return CompanyInfo(
      headquarters: headquarters ?? this.headquarters,
      links: links ?? this.links,
      name: name ?? this.name,
      founded: founded ?? this.founded,
      employees: employees ?? this.employees,
      vehicles: vehicles ?? this.vehicles,
      launchSites: launchSites ?? this.launchSites,
      testSites: testSites ?? this.testSites,
      ceo: ceo ?? this.ceo,
      cto: cto ?? this.cto,
      valuation: valuation ?? this.valuation,
      summary: summary ?? this.summary,
    );
  }

  @override
  List<Object?> get props => [
        headquarters,
        links,
        name,
        founded,
        employees,
        vehicles,
        launchSites,
        testSites,
        ceo,
        cto,
        valuation,
        summary,
      ];
}
