// Mocks generated by Mockito 5.4.4 from annotations
// in boardgames_scores/test/features/config/data/repositories/config_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:boardgames_scores/features/config/data/data_sources/local_data_source.dart'
    as _i3;
import 'package:boardgames_scores/features/config/data/models/config_model.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeConfigModel_0 extends _i1.SmartFake implements _i2.ConfigModel {
  _FakeConfigModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [LocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalDataSource extends _i1.Mock implements _i3.LocalDataSource {
  MockLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.ConfigModel> getConfig() => (super.noSuchMethod(
        Invocation.method(
          #getConfig,
          [],
        ),
        returnValue: _i4.Future<_i2.ConfigModel>.value(_FakeConfigModel_0(
          this,
          Invocation.method(
            #getConfig,
            [],
          ),
        )),
      ) as _i4.Future<_i2.ConfigModel>);
}
