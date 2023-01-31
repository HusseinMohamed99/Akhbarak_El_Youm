import 'package:akhbarak_el_youm/Core/components/navigator.dart';
import 'package:akhbarak_el_youm/Core/components/size_box.dart';
import 'package:akhbarak_el_youm/Core/model/category_model.dart';
import 'package:akhbarak_el_youm/View/Mobile/NewsScreen/news_screen.dart';
import 'package:akhbarak_el_youm/View/Mobile/SearchScreen/search_screen.dart';
import 'package:akhbarak_el_youm/View/Mobile/Settings/settings_screen.dart';
import 'package:akhbarak_el_youm/View/Mobile/Widget/category_grid_view.dart';
import 'package:akhbarak_el_youm/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home-Screen';
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> allCategory = [
   // business entertainment general health science sports technology
    CategoryModel(
      categoryID: 'sports',
      categoryTitle: 'Sports',
      categoryImage: Assets.imagesSports,
      categoryBackGround: const Color.fromARGB(255, 201, 28, 34),
    ),
    CategoryModel(
      categoryID: 'general',
      categoryTitle: 'General',
      categoryImage: Assets.imagesPolitics,
      categoryBackGround: const Color.fromARGB(255, 0, 62, 144),
    ),
    CategoryModel(
        categoryID: 'Health',
        categoryTitle: 'Health',
        categoryImage: Assets.imagesHealth,
        categoryBackGround: const Color.fromARGB(255, 237, 30, 121)),
    CategoryModel(
        categoryID: 'business',
        categoryTitle: 'Business',
        categoryImage: Assets.imagesBussines,
        categoryBackGround: const Color.fromARGB(255, 207, 126, 72)),
    CategoryModel(
        categoryID: 'entertainment',
        categoryTitle: 'Entertainment',
        categoryImage: Assets.imagesEnvironment,
        categoryBackGround: const Color.fromARGB(255, 72, 130, 207)),
    CategoryModel(
        categoryID: 'science',
        categoryTitle: 'Science',
        categoryImage: Assets.imagesScience,
        categoryBackGround: const Color.fromARGB(255, 242, 211, 82)),
    CategoryModel(
        categoryID: 'technology',
        categoryTitle: 'Technology',
        categoryImage: Assets.imagesSearch,
        categoryBackGround: const Color.fromARGB(255, 57, 165, 82)),
  ];

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            Assets.imagesPattern,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title:  Text(
              selectedCategory == null ?
              'Akhbarak El Youm' : selectedCategory!.categoryTitle,
            ),
            actions:  [
           IconButton(onPressed: ()
           {
             navigateTo(context, routeName: SearchScreen.routeName,);
           }, icon:  const ImageIcon(AssetImage(Assets.imagesSearch)),)

            ],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
          ),
          drawer: Drawer(
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    Assets.imagesPattern,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.green,
                      width: double.infinity,
                      height: 130,
                      child: Text(
                        'Akhbarak El Youm!',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                    ),
                    InkWell(
                      onTap: ()
                      {
                        setState(() {
                          selectedCategory = null;
                          pop(context);
                        });

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(FontAwesomeIcons.warehouse),
                            const Space(width: 20, height: 0),
                            Text(
                              'Category',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, routeName: SettingsScreen.routeName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(FontAwesomeIcons.sliders),
                            const Space(width: 20, height: 0),
                            Text(
                              'Settings',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: selectedCategory == null
              ? Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Pick your category\nof interest',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.black54),
                      ),
                      allCategory.isEmpty ? Center(
                        child: Lottie.asset(
                          Assets.lottieNodata,
                        ),
                      )
                          :
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: allCategory.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 6 / 7),
                          itemBuilder: (context, index) => CategoryGridView(
                              onClickItem: onClickFunction,
                              category: allCategory[index],
                              index: index),
                        ),
                      ),
                    ],
                  ),
                )
              : NewsScreen(selectedCategory!),
        ),
      ],
    );
  }

  CategoryModel? selectedCategory;
  void onClickFunction(CategoryModel category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
