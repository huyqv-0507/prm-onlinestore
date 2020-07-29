import 'package:online_store/models/order_info.dart';

class PaymentApi {
  static String vnpayUrl(OrderInfo orderInfo) {
    return 'api/v1/payment?OrderId=${orderInfo.orderId}&Amount=${orderInfo.amount}&vnp_TransactionNo=${orderInfo.vpn_transactionNo}&vnp_TxnResponseCode=${orderInfo.vpn_txnResponseCode}';
  }
}
