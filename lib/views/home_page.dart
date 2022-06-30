import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_hub/data/data.dart';
import 'package:wallpaper_hub/view_model/wallpaper_model.dart';
import 'package:wallpaper_hub/views/search_view.dart';
import 'package:wallpaper_hub/widgets/categories_tile.dart';
import 'package:http/http.dart' as http;
import '../view_model/categories_model.dart';
import '../widgets/brand_name.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoriesModel> categories = [];
  List<WallPaperModel> wallpapers = [];
  final TextEditingController _controller = TextEditingController();

  getTrendingPhotos() async{
    const url = "https://api.pexels.com/v1/curated?per_page=10";
    var response = await http.get(Uri.parse(url),headers: {"Authorization" : apiKEY});
   print(response.body.toString());
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      //print(element);
      WallPaperModel wallPaperModel = WallPaperModel.fromMap(element);
      wallpapers.add(wallPaperModel);
    });
    setState(() {

    });
  }

  void loadCategories() {
    categories = getCategories();
    setState(() {});
  }


  @override
  void initState() {
    super.initState();
    getTrendingPhotos();
    loadCategories();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.transparent,
      elevation: 0,
      title: BrandName(),centerTitle: true,),
        body:Column(
          children: [
            Container(margin: EdgeInsets.symmetric(horizontal: 20),
              padding:EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                color:Color(0xfff5f8fD)),
              child: Row(children: [
                Expanded(child: TextField(controller: _controller,
                  decoration: InputDecoration(hintText: "Search",
                border: InputBorder.none),)
                ),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      SearchView(searchData:_controller.text)));

                }, icon: Icon(Icons.search))

              ],),
            ),
            SizedBox(height: 20,),
            Container(

              height: 100,
              // child: ListView.builder(itemCount: categories.length,
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) => CategoriesTile(imgUrl: categories[index].imgUrl, 
              //     title:categories[index].categoriesName)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...categories.map((category) => CategoriesTile(
                      imgUrl: category.imgUrl,
                      title: category.categoriesName,
                    )).toList(),
                  ]
                ),
              )
            ),
            Expanded(
              child: wallPaperList(wallpapers, context),
            ),
            
          ],
        )
    );
  }
}
