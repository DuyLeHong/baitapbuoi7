class ProductModel {
  String title;
  double price;
  String description;
  String imageURL;

  ProductModel(this.title, this.price, this.description, this.imageURL);
}

List<ProductModel> productList = <ProductModel>[
  ProductModel('Product 1', 100.0, 'Ok',
      'https://image.thanhnien.vn/w660/Uploaded/2022/jvunzvu/2021_06_04/diec-lua_fsdb_vsni.jpg'),
  ProductModel('Product 2', 90.0, 'Ok',
      'https://media.vov.vn/uploaded/4bpdy3ykolq/2020_01_13/a2_nqng.jpg'),
  ProductModel('Product 3', 80.0, 'Ok',
      'https://daohieu.com/wp-content/uploads/2020/05/chim-vang-anh-917x1024.jpg'),
  ProductModel('Product 4', 95.0, 'Ok',
      'https://e.khoahoc.tv/photos/image/2020/04/23/chim-Bearded-Reedling.jpg'),
];
