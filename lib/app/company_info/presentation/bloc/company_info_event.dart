part of 'company_info_bloc.dart';

abstract class CompanyInfoEvent extends Equatable {
  const CompanyInfoEvent();

  @override
  List<Object> get props => [];
}

class CompanyInfoFetchDataEvent extends CompanyInfoEvent {
  const CompanyInfoFetchDataEvent();
}

class CompanyInfoOpenWebPageEvent extends CompanyInfoEvent {
  final String url;

  const CompanyInfoOpenWebPageEvent(this.url);

  @override
  List<Object> get props => [url];
}
