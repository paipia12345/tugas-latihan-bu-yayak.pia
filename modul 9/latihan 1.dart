class CategoryManager {
  final List<String> _categories = ['Makanan', 'Transportasi', 'Tagihan'];

  void addCategory(String category) {
    if (category.isEmpty) {
      print("Kategori tidak boleh kosong.");
      return;
    }
    if (_categories.contains(category)) {
      print("Kategori '$category' sudah ada.");
    } else {
      _categories.add(category);
      print("Kategori '$category' berhasil ditambahkan.");
    }
  }

  void removeCategory(String category) {
    if (_categories.contains(category)) {
      _categories.remove(category);
      print("Kategori '$category' berhasil dihapus.");
    } else {
      print("Kategori '$category' tidak ditemukan.");
    }
  }

  List<String> get allCategories => List.unmodifiable(_categories);
}

void main() {
  CategoryManager manager = CategoryManager();

  print("Kategori awal: ${manager.allCategories}\n");

  manager.addCategory("Hiburan");
  manager.addCategory("Makanan");

  print("\nKategori setelah penambahan: ${manager.allCategories}\n");

  manager.removeCategory("Tagihan");
  manager.removeCategory("Olahraga"); 

  print("\nKategori akhir: ${manager.allCategories}");
}
