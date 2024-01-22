import 'dart:convert';
import 'package:flutter/services.dart';

import '../../../../core/app_env.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/utils/colored_debug_printer.dart';
import '../models/config_model.dart';

abstract class LocalDataSource {
  Future<ConfigModel> getConfig();
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<ConfigModel> getConfig() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/config/config.${EnvInfo.environment.name}.json');
      final Map<String, dynamic> data = await json.decode(jsonString) as Map<String, dynamic>;
      return ConfigModel.fromJson(data);
    } catch (e) {
      Print.red('DLOG', e.toString());
      throw ServerExeption();
    }
  }
}
