class HistoryModel {
  final String beachName;
  final String price;
  final String userID;

  HistoryModel(
      {required this.beachName, required this.price, required this.userID});

  // data from server
  Map<String, dynamic> toJson() => {
        'beachName': beachName,
        'price': price,
        'userID': userID,
      };

  // sending data to server
  static HistoryModel fromJson(Map<String, dynamic> json) => HistoryModel(
        beachName: json['beachName'],
        price: json['price'],
        userID: json['userID'],
      );
}
