
import 'package:flutter/material.dart';

const int STATUS_OK = 200;
const int STATUS_BAD_REQUEST = 400;
const int STATUS_NOT_AUTHORIZED = 403;
const int STATUS_NOT_FOUND = 404;
const int STATUS_INTERNAL_ERROR = 500;

const String ERROR_OCCURED = 'Error occured, please try again later';
const String ERROR_OCCURED_AR = 'حدث خطأ ، يرجى المحاولة مرة أخرى في وقت لاحق';
const String ACCOUNT_NOT_VERIFIED_STATE_AR = 'لم يتم التحقق من حسابك ، يرجى التحقق من حسابك.';

const Color BLACK_GREY = Color(0xff777777);



const String BASE_URL = 'https://m7card.manarhays.com/api/v100/';

const String ALL_BRAND = BASE_URL + "all-brand";
const String ALL_CATEGORY = BASE_URL + "category/all";
const String PRODUCTS_BY_CATEGORY = BASE_URL + "products-by-category/";
const String PRODUCT_DETAILS = BASE_URL + "product-details/2";
const String PRODUCTS_BY_BRAND = BASE_URL + "products-by-brand/12";
const String ALL_SHOP = BASE_URL + "all-shop";
const String ALL_PAYMENT_CATEGORY = BASE_URL + "all-payment-category";
const String PAYMENT_BY_CATEGORY = BASE_URL + "payment-by-category/";

const String GAME_CATEGORIES = BASE_URL + "category/games";
const String ONLINE_SHOPS_CATEGORIES = BASE_URL + "category/onlineshops";
const String SERVICES_CATEGORIES = BASE_URL + "category/services";
const String SOCIAlL_APPS_CATEGORIES = BASE_URL + "category/socialapps";
const String GIFTCARDS_CATEGORIES = BASE_URL + "category/giftcards";

const String GET_USER_PROFILE = BASE_URL + "user/profile?token=";

const String GET_SLIDER = BASE_URL + "sliders";

const String POST_TIKET = BASE_URL + "user/post-tiket?replay=";

const String CHEK_IS_GAME = 'http://match.m7-system.com/?key=KZXeXmqtfLRRQuCmMe5c4CnmCrEjSfeZeqd1NxIF2lg&id=' ;

