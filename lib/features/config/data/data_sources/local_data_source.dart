import 'dart:convert';
import 'package:flutter/services.dart';

import '../../../../core/app_env.dart';
import '../../../../core/error/exception.dart';
import '../models/config_model.dart';

abstract class LocalDataSource {
  Future<ConfigModel> getConfig();
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<ConfigModel> getConfig() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/config/config.${EnvInfo.environment.name}.json');
      final data = await json.decode(jsonString);
      return ConfigModel.fromJson(data);
    } catch (e) {
      throw ServerExeption();
    }
  }
}
