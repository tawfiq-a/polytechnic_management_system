class PaymentModel {
  String id, userId, amount, method, txnId, time;
  PaymentModel({
    required this.id,
    required this.userId,
    required this.amount,
    required this.method,
    required this.txnId,
    required this.time,
  });
}
