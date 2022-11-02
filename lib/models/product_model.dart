class ProductModel {
  String? pName;
  int? pId;
  int? pCost;
  int? pAvailability;
  String? pDetails;
  String? pCategory;

  ProductModel(
      {this.pName,
      this.pId,
      this.pCost,
      this.pAvailability,
      this.pDetails,
      this.pCategory});

  ProductModel.fromJson(Map<String, dynamic> json) {
    pName = json['p_name'];
    pId = json['p_id'];
    pCost = json['p_cost'];
    pAvailability = json['p_availability'];
    pDetails = json['p_details'];
    pCategory = json['p_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['p_name'] = pName;
    data['p_id'] = pId;
    data['p_cost'] = pCost;
    data['p_availability'] = pAvailability;
    data['p_details'] = pDetails;
    data['p_category'] = pCategory;
    return data;
  }
}
