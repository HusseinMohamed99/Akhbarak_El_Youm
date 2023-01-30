import 'package:akhbarak_el_youm/Core/Apis/apis_manager.dart';
import 'package:akhbarak_el_youm/Core/components/navigator.dart';
import 'package:akhbarak_el_youm/Core/components/size_box.dart';
import 'package:akhbarak_el_youm/Core/model/news.dart';
import 'package:akhbarak_el_youm/View/Mobile/Widget/news_item.dart';
import 'package:akhbarak_el_youm/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'Search-Screen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String queryText = "";
  List<News> listOfNews = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        )),
        leading: const SizedBox(),
        leadingWidth: 10,
        title: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          height: 60,
          child: TextFormField(
            onChanged: (String? value)
            {
              debugPrint(value!);
              setState(() {
                queryText = value;
              });
            },
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const ImageIcon(
                    AssetImage(Assets.imagesSearch),
                    color: Color.fromARGB(255, 57, 165, 82),
                  ),
                ),
                prefixIcon: IconButton(
                  onPressed: ()
                  {
                    pop(context);
                  },
                  icon: const ImageIcon(
                    AssetImage(
                      Assets.imagesClose,
                    ),
                    color: Color.fromARGB(255, 57, 165, 82),
                  ),
                ),
                hintText: 'Search Article',
                hintStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 57, 165, 82),
                ),
                contentPadding: const EdgeInsets.only(top: 10)),
          ),
        ),
      ),
      body:
          searchFunction().isEmpty ? const Center(child: Text("No data")):
      ListView.separated(itemBuilder: (buildContext,index)
      {
        return NewsItem(searchFunction().elementAt(index));
      }, separatorBuilder:(buildContext,index) {

       return const Space(width: 0, height: 10);
      }, itemCount: searchFunction().length),
    );
  }

  List searchFunction()
  {
    ApisManager.getNews(query: queryText).then((newsResponse)
    {

      listOfNews = newsResponse.newsList ?? [];

    }).catchError((error)
    {
      debugPrint('Error During Call Apis $error');
    });
    return listOfNews;
  }
}
