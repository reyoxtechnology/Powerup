
import 'dart:ffi';

class WalletBalance {
  int? id;
  int? userId;
  String? totalFunding;
  String? amountSpend;
  String? balance;
  bool isCreated = false;

  WalletBalance({this.id, this.userId, this.totalFunding, this.amountSpend, this.balance, required this.isCreated});

  factory WalletBalance.fromJson(Map<String, dynamic> responseData) {
    return WalletBalance(
        id: responseData['id'],
        userId: responseData['user_id'],
        totalFunding: responseData['total_funding'],
        amountSpend: responseData['amount_spend'],
        balance: responseData['balance'],
        isCreated: responseData['is_created'],
    );
  }
}


class WalletTransactionHistory {
  int id;
  int userId;
  String paymentId;
  String reference;
  Double amountPaid;
  String currencyType;
  bool isConfirmed;
  String paymentDate;

  WalletTransactionHistory({required this.id, required this.userId, required this.paymentId, required this.reference, required this.amountPaid, required this.currencyType, required this.isConfirmed, required this.paymentDate});

  factory WalletTransactionHistory.fromJson(Map<String, dynamic> responseData) {
    return WalletTransactionHistory(
        id: responseData['id'],
        userId: responseData['user_id'],
        paymentId: responseData['payment_id'],
        reference: responseData['reference'],
        amountPaid: responseData['amount_paid'],
        currencyType: responseData['currency_type'],
        isConfirmed: responseData['is_confirmed'],
        paymentDate: responseData['payment_date'],
    );
  }

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "payment_id": paymentId,
        "reference": reference,
        "amount_paid": amountPaid,
        "currency_type": currencyType,
        "is_confirmed": isConfirmed,
        "payment_date": paymentDate,
      };

  List<Object?> get props =>
      [id, userId, paymentId, reference, amountPaid, currencyType, isConfirmed, paymentDate];
}