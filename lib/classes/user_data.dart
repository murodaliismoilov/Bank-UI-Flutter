class UserData {
  final String? name;
  final String? cardNumber;
  final int? cardBalanse;
  final String? image;
  late int result;
  final DateTime transFeringDate = DateTime.now();
  UserData({
    this.name,
    this.cardNumber,
    this.cardBalanse,
    this.image,
    required this.result,
  });
}
