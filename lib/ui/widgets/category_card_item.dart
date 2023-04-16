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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final double boxImageSize = ((MediaQuery.of(context).size.width)-14)/2-12;
    return Column(
      children: [
        SizedBox(
          height: height / 10,
          width: width / 3.2,
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  CategoryPage(categoryId: widget.categoryId, title: widget.title,),
                ),
              );

            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0,
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(10) //                 <--- border radius here
                ),
              ),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.imageUrl,
                    //height: height / 10,
                    //width: width / 3.2,
                    fit: BoxFit.cover,
                  ),
                )
              ),
            ),
          ),
        ),
        //const SizedBox(height: 3,),
        Text(widget.title,textAlign: TextAlign.center,style:const TextStyle(
             fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 10,
        ),),
      ],
    );
  }
}
