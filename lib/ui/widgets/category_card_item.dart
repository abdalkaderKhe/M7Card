import 'package:flutter/material.dart';
import '../home/category_page.dart';

class CategoryCardItem extends StatefulWidget {
    String title;
    String imageUrl;
    int categoryId;
    CategoryCardItem({Key? key,required this.title,required this.imageUrl,required this.categoryId}) : super(key: key);

  @override
  State<CategoryCardItem> createState() => _CategoryCardItemState();
}

class _CategoryCardItemState extends State<CategoryCardItem> {
  @override
  Widget build(BuildContext context) {
    final double boxImageSize = ((MediaQuery.of(context).size.width)-14)/2-12;
    return Column(
      children: [
        SizedBox(
          height: 80,width: 120,
          child: InkWell(
            onTap: (){
              //CategoryPage
              print("CategoryPage");
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  CategoryPage(categoryId: widget.categoryId, title: widget.title,),
                ),
              );

            },
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                widget.imageUrl,
                width: boxImageSize/8,
                height: boxImageSize/8,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 3,),
        Text(widget.title,textAlign: TextAlign.center,style:const TextStyle(
             fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 12,
        ),),
      ],
    );
  }
}
