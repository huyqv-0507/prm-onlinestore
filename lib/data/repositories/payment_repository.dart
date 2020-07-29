import 'package:http/http.dart' as http;
import 'package:online_store/data/apis/payment_api.dart';
import 'package:online_store/helpers/env/env_helper.dart';
import 'package:online_store/models/order_info.dart';

class PaymentRepository {
  Future<http.Response> vnpay(OrderInfo orderInfo) async {
    final response = await http.post(
        EnvHelper.getApiURL(
            EnvHelper.host, EnvHelper.port, PaymentApi.vnpayUrl(orderInfo)),
        headers: {
          'accept': 'aplication/json',
        });
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to fetch payment');
    }
  }
}
