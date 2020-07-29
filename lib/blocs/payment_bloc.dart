import 'dart:async';
import 'package:online_store/data/repositories/payment_repository.dart';
import 'package:online_store/models/order_info.dart';

class PaymentBloc {
  static PaymentBloc paymentBloc;
  static PaymentBloc getInstance() {
    return paymentBloc ?? (paymentBloc = PaymentBloc());
  }

  PaymentBloc() {
    paymentController.stream.listen(_handlePayment);
  }

  String _paymentUrl = "";
  String get paymentUrl => _paymentUrl;

  Sink<OrderInfo> get paymentSink => paymentController.sink;
  var paymentController = StreamController<OrderInfo>();

  Stream<String> get vnPayStream => vnPayController.stream;
  var vnPayController = StreamController<String>();

  PaymentRepository paymentRepository = PaymentRepository();

  void getPaymentUrl(OrderInfo orderInfo) {
    paymentRepository
        .vnpay(orderInfo)
        .then((value) => {
              _paymentUrl = value.body,
            })
        .catchError((e) {
      print('getPaymentUrl error');
    });
  }

  void _handlePayment(OrderInfo orderInfo) {
    getPaymentUrl(orderInfo);
    vnPayController.sink.add(_paymentUrl);
  }

  void dispose() {
    paymentController.close();
    vnPayController.close();
  }
}
