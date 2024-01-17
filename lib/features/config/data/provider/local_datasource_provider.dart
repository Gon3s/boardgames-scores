import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_generic_app/features/config/data/data_sources/local_data_source.dart';

final localDataSourceProvider = Provider<LocalDataSource>((ref) {
  return LocalDataSourceImpl();
});
