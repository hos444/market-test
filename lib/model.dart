class ItemModel {
  final String name;
  final String image;
  ItemModel({required this.name, required this.image});
}

class ProdactModel {
  final String name;
  final String image;
  final String price;
  final String rate;
  final String ratecont;

  ProdactModel({
    required this.name,
    required this.image,
    required this.price,
    required this.rate,
    required this.ratecont,
  });
}

class ProdactModelCart {
  final String nameCart;
  final String imageCart;
  final String priceCart;

  ProdactModelCart({
    required this.nameCart,
    required this.imageCart,
    required this.priceCart,
  });
}
class FavouriteModel {
  final String nameCart;
  final String imageCart;
  final String priceCart;

  FavouriteModel({
    required this.nameCart,
    required this.imageCart,
    required this.priceCart,
  });
}
