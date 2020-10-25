//商品详情信息
class CategoryGoodsListModel {
  List<CategoryGoodsModel> data;

  CategoryGoodsListModel(this.data);

  factory CategoryGoodsListModel.fromJson(List json) {
    if (json == null) {
      return CategoryGoodsListModel([]);
    }
    return CategoryGoodsListModel(
        json.map((e) => CategoryGoodsModel.fromJson(e)).toList());
  }
}

class CategoryGoodsModel {
  String image;
  double oriPrice;
  double presentPrice;
  String goodsName;
  String goodsId;

  CategoryGoodsModel(
      {this.image,
      this.oriPrice,
      this.presentPrice,
      this.goodsName,
      this.goodsId});

  CategoryGoodsModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    oriPrice = double.parse(json['oriPrice'].toString());
    presentPrice = double.parse(json['presentPrice'].toString());
    goodsName = json['goodsName'];
    goodsId = json['goodsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['goodsName'] = this.goodsName;
    data['goodsId'] = this.goodsId;
    return data;
  }
}
