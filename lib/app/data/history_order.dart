List<HistoryOrder> sampleHistoryOrder = [
  HistoryOrder(
    detail: 'สั่งสินค้า : ใบสั่งซื้อ XXXXXXXXX',
    dateTime: DateTime.now().toString(),
  ),
  HistoryOrder(
    detail: 'สั่งสินค้า : ใบสั่งซื้อ XXXXXXXXX',
    dateTime: DateTime.now().toString(),
  ),
  HistoryOrder(
    detail: 'สั่งสินค้า : ใบสั่งซื้อ XXXXXXXXX',
    dateTime: DateTime.now().toString(),
  ),
  HistoryOrder(
    detail: 'สั่งสินค้า : ใบสั่งซื้อ XXXXXXXXX',
    dateTime: DateTime.now().toString(),
  ),
  HistoryOrder(
    detail: 'สั่งสินค้า : ใบสั่งซื้อ XXXXXXXXX',
    dateTime: DateTime.now().toString(),
  ),
];

class HistoryOrder {
  String detail;
  String dateTime;
  HistoryOrder({
    required this.detail,
    required this.dateTime,
  });
}
