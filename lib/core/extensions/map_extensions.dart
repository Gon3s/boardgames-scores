extension MapExtensions on Map<String, dynamic> {
  String get(String key, {String defaultValue = ''}) {
    return containsKey(key) ? this[key] : defaultValue;
  }
}
