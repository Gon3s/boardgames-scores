import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data_sources/local_data_source.dart';

final localDataSourceProvider = Provider<LocalDataSource>((ref) {
  return LocalDataSourceImpl();
});
