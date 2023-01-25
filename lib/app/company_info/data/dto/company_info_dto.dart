import 'package:applifting_assignment/app/company_info/data/dto/headquarters_dto.dart';
import 'package:applifting_assignment/app/company_info/data/dto/links_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_info_dto.g.dart';

@JsonSerializable()
class CompanyInfoDTO extends Equatable {
  final HeadquartersDTO headquarters;
  final LinksDTO links;
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

  const CompanyInfoDTO({
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

  factory CompanyInfoDTO.fromJson(Map<String, dynamic> json) => _$CompanyInfoDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyInfoDTOToJson(this);

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
