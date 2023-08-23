
import 'package:b_pointer/model/product_model.dart';
import 'package:b_pointer/repo/api_services.dart';
import 'package:b_pointer/repo/api_status.dart';
import 'package:b_pointer/utils/urls.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    getDetails();
  }
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ProductModel> _productModelData = [];
  List<ProductModel> get productModelData => _productModelData;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  setProductListData(List<ProductModel> value) {
    _productModelData = value;
    notifyListeners();
  }

  getDetails() async {
    setLoading(true);
    String url = ApiUrls.baseUrl;
    final response =
     await   ApiServices.getMEthod(url: url, function: productModelFromJson);

    if (response is Success) {
   
      setProductListData(response.response as List<ProductModel>);
      setLoading(false);
    } 
  }
}
