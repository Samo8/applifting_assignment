// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyInfoDTO _$CompanyInfoDTOFromJson(Map<String, dynamic> json) =>
    CompanyInfoDTO(
      headquarters: HeadquartersDTO.fromJson(
          json['headquarters'] as Map<String, dynamic>),
      links: LinksDTO.fromJson(json['links'] as Map<String, dynamic>),
      name: json['name'] as String,
      founder: json['founder'] as String,
      founded: json['founded'] as int,
      employees: json['employees'] as int,
      vehicles: json['vehicles'] as int,
      launchSites: json['launchSites'] as int,
      testSites: json['testSites'] as int,
      ceo: json['ceo'] as String,
      cto: json['cto'] as String,
      coo: json['coo'] as String,
      valuation: json['valuation'] as int,
      summary: json['summary'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$CompanyInfoDTOToJson(CompanyInfoDTO instance) =>
    <String, dynamic>{
      'headquarters': instance.headquarters,
      'links': instance.links,
      'name': instance.name,
      'founder': instance.founder,
      'founded': instance.founded,
      'employees': instance.employees,
      'vehicles': instance.vehicles,
      'launchSites': instance.launchSites,
      'testSites': instance.testSites,
      'ceo': instance.ceo,
      'cto': instance.cto,
      'coo': instance.coo,
      'valuation': instance.valuation,
      'summary': instance.summary,
      'id': instance.id,
    };
