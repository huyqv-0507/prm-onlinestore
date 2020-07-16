class EnvHelper {
  static const String host = '10.0.2.2';
  static const String port = '55257';

  static String getApiURL(String host, String port, String dataUrl) {
    return 'http://' + host + ':' + port + '/' + dataUrl;
  }
}
