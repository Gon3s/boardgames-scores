import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/default_repository_impl.dart';
import '../repositories/default_repository.dart';

final defaultRepositoryProvider = Provider<DefaultRepository>((ref) {
  return DefaultRepositoryImpl();
});
