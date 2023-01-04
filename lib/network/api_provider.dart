import 'package:flutter/material.dart';
import 'package:m7card/config/constants.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:m7card/model/category.dart';
import 'package:m7card/model/payment_by_category.dart';
import 'package:m7card/model/payment_category.dart';
import 'package:m7card/model/product_by_category.dart';
import 'package:m7card/model/product_details.dart';
import 'package:m7card/model/shop.dart';
import 'package:m7card/model/slider_model.dart';
import 'package:m7card/model/user.dart';
import 'package:m7card/model/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {

  late User user;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _isLogin({required bool isLogin}) async
  {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool('isLogin', isLogin);
  }
  Future<void> _setUserProfileData({required User user}) async
  {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('firstName', user.firstName);
    await prefs.setString('lastName', user.lastName);
    await prefs.setString('image', user.image);
    await prefs.setString('email', user.email);
    await prefs.setString('phone', user.phone);
    await prefs.setString('token', user.token);
  }
  Future<String?> _getToken() async
  {
    final SharedPreferences prefs = await _prefs;
    String? token = await prefs.getString('token');
    return token;
  }

  getAllCategory(String url)async
  {
    try {
      var request = http.Request('GET', Uri.parse(url));
      http.StreamedResponse response = await request.send();
      switch (response.statusCode) {
        case STATUS_OK:
          String result = await response.stream.bytesToString();
          var body = jsonDecode(result);
          List responseList = body['data'];
          List<CategoryModel> listData = responseList.map((f) => CategoryModel.fromJson(f)).toList();
          return listData;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
  getProductByCategory(String url,String id)async
  {
    // "https://m7card.manarhays.com/api/v100/products-by-category/7",
    try {
      var request = http.Request('GET', Uri.parse(url+id));
      http.StreamedResponse response = await request.send();
      switch (response.statusCode) {
        case STATUS_OK:
          String result = await response.stream.bytesToString();
          var body = jsonDecode(result);
          List responseList = body['data'];
          List<ProductByCategory> listData = responseList.map((f) => ProductByCategory.fromJson(f)).toList();
          for(int i = 0 ; i<listData.length ; i++){
            print(listData[i].title);
            print(listData[i].isFavourite);
          }
          return listData;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
  getProductDetails(String url)async
  {
    // "https://m7card.manarhays.com/api/v100/product-details/2",
    try {
      var request = http.Request('GET', Uri.parse(url));
      http.StreamedResponse response = await request.send();
      switch (response.statusCode) {
        case STATUS_OK:
          String result = await response.stream.bytesToString();
          Map<String, dynamic> body = Map<String, dynamic>.from(jsonDecode(result));
          ProductDetails productDetails = ProductDetails.fromJson(body['data']);
          print(productDetails.title);
          return productDetails;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
  getAllShop(String url)async
  {
    // "https://m7card.manarhays.com/api/v100/all-shop",
    try {
      var request = http.Request('GET', Uri.parse(url));
      http.StreamedResponse response = await request.send();
      switch (response.statusCode) {
        case STATUS_OK:
          String result = await response.stream.bytesToString();
          var body = jsonDecode(result);
          List responseList = body['data'];
          List<Shop> listData = responseList.map((f) => Shop.fromJson(f)).toList();
          for(int i = 0 ; i<listData.length ; i++){
              print("============"+ listData[i].shopName);
          }
          return listData;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }

  postRegister(String url,dynamic body)async
  {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(url));
    request.body = json.encode(body);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    switch(response.statusCode){
      case 200:
        var responseJson = jsonDecode(await response.stream.bytesToString());
        print(responseJson);
        return responseJson;
      case 422:
        var responseJson = jsonDecode(await response.stream.bytesToString());
        return responseJson;
      default:
        return Exception("default Error ${response.statusCode.toString()}");
    }
  }
  postLogin(String url,dynamic body)async
  {

    final request = await http.post(Uri.parse(url),body:body);

    switch(request.statusCode){

      case 200:
        var responseJson = jsonDecode(request.body.toString());
        Map<String, dynamic> data = responseJson["data"];
        user = User.fromJson(data);
        _isLogin(isLogin: true);
        _setUserProfileData(user: user);
        return responseJson;

      case 422:
        var responseError = jsonDecode(request.body.toString());
        _isLogin(isLogin: false);
        return responseError;

      case 401:
        var responseError = jsonDecode(request.body.toString());
        _isLogin(isLogin: false);
        return responseError;

      case 500:
        var responseError = jsonDecode(request.body.toString());
        _isLogin(isLogin: false);
        return responseError;

      default:
        _isLogin(isLogin: false);
        return Exception("default Error ${request.statusCode.toString()}");
    }
  }

  getUserProfile(String url , String token) async
  {

     var headers = {
       'Authorization': 'Bearer ${token}'
     };
     var request = http.MultipartRequest('GET', Uri.parse(url+ token));
     request.fields.addAll({
       'token': token,
     });

     request.headers.addAll(headers);

     http.StreamedResponse response = await request.send();

     if (response.statusCode == 200)
     {
       String result = await response.stream.bytesToString();
       Map<String, dynamic> body = Map<String, dynamic>.from(jsonDecode(result));
       UserProfile userProfile =UserProfile.fromJson(body["data"]);
       return userProfile;
     }
     else
     {
       return Exception("default Error ${response.statusCode.toString()}");
     }

   }
  getAllPaymentCategory({required String url}) async
  {
     var request = http.Request('GET', Uri.parse('https://m7card.manarhays.com/api/v100/all-payment-category'));
     http.StreamedResponse response = await request.send();
     if (response.statusCode == 200)
     {
       String result = await response.stream.bytesToString();
       var body = jsonDecode(result);
       List responseList = body['data'];
       List<PaymentCategory> listData = responseList.map((f) => PaymentCategory.fromJson(f)).toList();
       print(listData[0].name);
       return listData;
     }
     else
     {
       throw response.statusCode.toString();
     }

   }
  getPaymentByCategory({required String url,required String id})async
  {
     var request = http.Request('GET', Uri.parse(url+id));
     http.StreamedResponse response = await request.send();
     if (response.statusCode == 200)
     {
       String result = await response.stream.bytesToString();
       var body = jsonDecode(result);
       List responseList = body['data'];
       List<PaymentByCategory> listData = responseList.map((f) => PaymentByCategory.fromJson(f)).toList();
       print(listData[0].name);
       return listData;
     }
     else
     {
       throw response.statusCode.toString();
     }
   }
  postOrderPayment({required String url, required dynamic body})async
  {
     var request = http.MultipartRequest('POST', Uri.parse('https://m7card.manarhays.com/api/v100/orderpayment'));
     request.fields.addAll({
       'payment_way_id': '1',
       'acc_name': '123123',
       'user_id': '1',
       'amount': '200',
       'balance_value': '195',
       'date': '',
       'note': 'this is '
     });

     http.StreamedResponse response = await request.send();

     if (response.statusCode == 200) {
       var responseJson = jsonDecode(await response.stream.bytesToString());
       return responseJson;
     }
     else {
       throw response.statusCode.toString();
     }
   }
  getAllCategoryGames(String url)async
  {
    var request = http.Request('GET', Uri.parse(url));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String result = await response.stream.bytesToString();
      var body = jsonDecode(result);
      List listCategoryGames = body['data'];
      List<CategoryModel> listData = listCategoryGames.map((f) => CategoryModel.fromJson(f)).toList();
      print("============listData[0]=============");
      print(listData[0].title);
      return listData;
    }
    else
    {
      print(response.reasonPhrase);
    }

  }
  getSlider({required String url})async
  {
    var request = http.Request('GET', Uri.parse(url));

    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200)
    {
      String result = await response.stream.bytesToString();
      var body = jsonDecode(result);
      List responseList = body['data'];

      List<SliderModel> listData = responseList.map((f) => SliderModel.fromJson(f)).toList();
      print(listData[0].title);
     // print(listData[0].sliderImage);
     // print(listData[1].sliderImage);
      return listData;
    }
    else
    {
      throw Exception(response.reasonPhrase);
    }

  }

  postTiket({required String url ,required UserProfile body ,required String token})async
  {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({
      'first_name': body.firstName,
      'last_name': body.lastName,
      'email': body.email,
      'phone': body.phone,
      'user_id': body.id.toString(),
      'token': token,
    });


    http.StreamedResponse response = await request.send();
    print(response.statusCode);

    if (response.statusCode == 200)
    {
      //print(await response.stream.bytesToString());
      var responseJson = jsonDecode(await response.stream.bytesToString());
      print(responseJson);
      return responseJson;
    }
    else
    {
      throw response.statusCode.toString();
    }

  }



}