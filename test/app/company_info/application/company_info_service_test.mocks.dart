// Mocks generated by Mockito 5.3.2 from annotations
// in applifting_assignment/test/app/company_info/application/company_info_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:applifting_assignment/app/company_info/data/dto/company_info_dto.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

import 'company_info_service_test.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCompanyInfoDTO_0 extends _i1.SmartFake
    implements _i2.CompanyInfoDTO {
  _FakeCompanyInfoDTO_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MockCompanyInfoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockCompanyInfoRepository extends _i1.Mock
    implements _i3.MockCompanyInfoRepository {
  MockMockCompanyInfoRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.CompanyInfoDTO> fetchCompanyInfo() => (super.noSuchMethod(
        Invocation.method(
          #fetchCompanyInfo,
          [],
        ),
        returnValue: _i4.Future<_i2.CompanyInfoDTO>.value(_FakeCompanyInfoDTO_0(
          this,
          Invocation.method(
            #fetchCompanyInfo,
            [],
          ),
        )),
      ) as _i4.Future<_i2.CompanyInfoDTO>);
}