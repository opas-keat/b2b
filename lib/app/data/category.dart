List<Category> sampleCategory = [
  Category(
    id: "1",
    title: "ยาง",
  ),
  Category(
    id: "2",
    title: "ล้อ",
  ),
  Category(
    id: "3",
    title: "อื่นๆ",
  ),
];

class Category {
  String id;
  String title;
  Category({
    required this.id,
    required this.title,
  });
}
