class CategoryModel {

  CategoryModel({
    required this.id,
    required this.icon,
    required this.parentId,
    required this.slug,
    required this.title,
    required this.image,
    required this.childCategories,
  });

  late final int id;
  late final String icon;
  late final int parentId;
  late final String slug;
  late final String title;
  late final String image;
  late final List<dynamic> childCategories;

  CategoryModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    icon = json['icon'];
    parentId = json['parent_id'];
    slug = json['slug'];
    title = json['title'];
    image = json['image'];
    childCategories = List.castFrom<dynamic, dynamic>(json['child_categories']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['icon'] = icon;
    _data['parent_id'] = parentId;
    _data['slug'] = slug;
    _data['title'] = title;
    _data['image'] = image;
    _data['child_categories'] = childCategories;
    return _data;
  }
}