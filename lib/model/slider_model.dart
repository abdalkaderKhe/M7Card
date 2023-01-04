class SliderModel {
  SliderModel({
    required this.id,
    required this.order,
    required this.btnLink,
    required this.status,
    required this.imageAlign,
    required this.textAlign,
    required this.forMobile,
   // required this.image,
    required this.imageId,
 //   required this.bgImage,
    required this.bgImageId,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.subTitle,
    required this.btnText,
    required this.heading,
    required this.sliderImage,
    required this.sliderBgImage,
  //  required this.currentLanguage,
  });
  late final int id;
  late final int order;
  late final String btnLink;
  late final int status;
  late final String imageAlign;
  late final String textAlign;
  late final int forMobile;
 // late final SliderImage image;
  late final int? imageId;
 // late final BgImage bgImage;
  late final int bgImageId;
  late final String createdAt;
  late final String updatedAt;
  late final String title;
  late final String subTitle;
  late final String btnText;
  late final String heading;
  late final String sliderImage;
  late final String sliderBgImage;
 // late final List<CurrentLanguage> currentLanguage;

  SliderModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    order = json['order'];
    btnLink = json['btn_link'];
    status = json['status'];
    imageAlign = json['image_align'];
    textAlign = json['text_align'];
    forMobile = json['for_mobile'];
   // image = SliderImage.fromJson(json['image']);
    imageId = json['image_id'];
  //  bgImage = BgImage.fromJson(json['bg_image']);
    bgImageId = json['bg_image_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    subTitle = json['sub_title'];
    btnText = json['btn_text'];
    heading = json['heading'];
    sliderImage = json['slider_image'];
    sliderBgImage = json['slider_bg_image'];
  //  currentLanguage = List.from(json['current_language']).map((e)=>CurrentLanguage.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['order'] = order;
    _data['btn_link'] = btnLink;
    _data['status'] = status;
    _data['image_align'] = imageAlign;
    _data['text_align'] = textAlign;
    _data['for_mobile'] = forMobile;
   // _data['image'] = image.toJson();
    _data['image_id'] = imageId;
   // _data['bg_image'] = bgImage.toJson();
    _data['bg_image_id'] = bgImageId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['title'] = title;
    _data['sub_title'] = subTitle;
    _data['btn_text'] = btnText;
    _data['heading'] = heading;
    _data['slider_image'] = sliderImage;
    _data['slider_bg_image'] = sliderBgImage;
    //_data['current_language'] = currentLanguage.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class SliderImage {
  SliderImage({
    required this.storage,
    required this.originalImage,
    required this.image_40x40,
    required this.image_72x72,
    required this.image_190x230,
    required this.image_110x122,
    required this.image_320x320,
    required this.imageThumbnail,
    required this.image_140x190,
    required this.image_130x95,
    required this.image_80x60,
    required this.image_835x200,
    required this.image_280x280,
  });
  late final String storage;
  late final String originalImage;
  late final String image_40x40;
  late final String image_72x72;
  late final String image_190x230;
  late final String image_110x122;
  late final String image_320x320;
  late final String imageThumbnail;
  late final String image_140x190;
  late final String image_130x95;
  late final String image_80x60;
  late final String image_835x200;
  late final String image_280x280;

  SliderImage.fromJson(Map<String, dynamic> json){
    storage = json['storage'];
    originalImage = json['original_image'];
    image_40x40 = json['image_40x40'];
    image_72x72 = json['image_72x72'];
    image_190x230 = json['image_190x230'];
    image_110x122 = json['image_110x122'];
    image_320x320 = json['image_320x320'];
    imageThumbnail = json['image_thumbnail'];
    image_140x190 = json['image_140x190'];
    image_130x95 = json['image_130x95'];
    image_80x60 = json['image_80x60'];
    image_835x200 = json['image_835x200'];
    image_280x280 = json['image_280x280'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['storage'] = storage;
    _data['original_image'] = originalImage;
    _data['image_40x40'] = image_40x40;
    _data['image_72x72'] = image_72x72;
    _data['image_190x230'] = image_190x230;
    _data['image_110x122'] = image_110x122;
    _data['image_320x320'] = image_320x320;
    _data['image_thumbnail'] = imageThumbnail;
    _data['image_140x190'] = image_140x190;
    _data['image_130x95'] = image_130x95;
    _data['image_80x60'] = image_80x60;
    _data['image_835x200'] = image_835x200;
    _data['image_280x280'] = image_280x280;
    return _data;
  }
}

class BgImage {
  BgImage({
    required this.storage,
    required this.originalImage,
    required this.image_40x40,
    required this.image_72x72,
    required this.image_190x230,
    required this.image_110x122,
    required this.image_320x320,
    required this.imageThumbnail,
    required this.image_1905x464,
  });
  late final String storage;
  late final String originalImage;
  late final String image_40x40;
  late final String image_72x72;
  late final String image_190x230;
  late final String image_110x122;
  late final String image_320x320;
  late final String imageThumbnail;
  late final String image_1905x464;

  BgImage.fromJson(Map<String, dynamic> json){
    storage = json['storage'];
    originalImage = json['original_image'];
    image_40x40 = json['image_40x40'];
    image_72x72 = json['image_72x72'];
    image_190x230 = json['image_190x230'];
    image_110x122 = json['image_110x122'];
    image_320x320 = json['image_320x320'];
    imageThumbnail = json['image_thumbnail'];
    image_1905x464 = json['image_1905x464'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['storage'] = storage;
    _data['original_image'] = originalImage;
    _data['image_40x40'] = image_40x40;
    _data['image_72x72'] = image_72x72;
    _data['image_190x230'] = image_190x230;
    _data['image_110x122'] = image_110x122;
    _data['image_320x320'] = image_320x320;
    _data['image_thumbnail'] = imageThumbnail;
    _data['image_1905x464'] = image_1905x464;
    return _data;
  }
}

class CurrentLanguage {
  CurrentLanguage({
    required this.id,
    required this.sliderId,
    required this.lang,
    required this.title,
    required this.heading,
    required this.subTitle,
    required this.btnText,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int sliderId;
  late final String lang;
  late final String title;
  late final String heading;
  late final String subTitle;
  late final String btnText;
  late final String createdAt;
  late final String updatedAt;

  CurrentLanguage.fromJson(Map<String, dynamic> json){
    id = json['id'];
    sliderId = json['slider_id'];
    lang = json['lang'];
    title = json['title'];
    heading = json['heading'];
    subTitle = json['sub_title'];
    btnText = json['btn_text'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['slider_id'] = sliderId;
    _data['lang'] = lang;
    _data['title'] = title;
    _data['heading'] = heading;
    _data['sub_title'] = subTitle;
    _data['btn_text'] = btnText;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}