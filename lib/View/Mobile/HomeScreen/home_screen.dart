import 'package:akhbarak_el_youm/Core/components/navigator.dart';
import 'package:akhbarak_el_youm/Core/components/size_box.dart';
import 'package:akhbarak_el_youm/View/Mobile/Settings/settings_screen.dart';
import 'package:akhbarak_el_youm/View/Mobile/Widget/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home-Screen';
   HomeScreen({Key? key}) : super(key: key);

  List <Category> category =
  [
    Category(
        categoryID: 'Sports',
        categoryTitle: 'Sports',
        categoryImage: 'assets/images/sports.png',
        categoryBackGround: const Color.fromARGB(255, 201, 28, 34),
    ),

    Category(
        categoryID: 'Politics',
        categoryTitle: 'Politics',
        categoryImage: 'assets/images/Politics.png',
        categoryBackGround: const Color.fromARGB(255, 0, 62, 144),
    ),

    Category(
        categoryID: 'Health',
        categoryTitle: 'Health',
        categoryImage: 'assets/images/health.png',
        categoryBackGround: const Color.fromARGB(255, 237, 30, 121)
    ),
    Category(
        categoryID: 'Business',
        categoryTitle: 'Business',
        categoryImage: 'assets/images/bussines.png',
        categoryBackGround: const Color.fromARGB(255, 207, 126, 72)
    ),
    Category(
        categoryID: 'Environment',
        categoryTitle: 'Environment',
        categoryImage: 'assets/images/environment.png',
        categoryBackGround: const Color.fromARGB(255, 72, 130, 207)
    ),
    Category(
        categoryID: 'Science',
        categoryTitle: 'Science',
        categoryImage: 'assets/images/science.png',
        categoryBackGround: const Color.fromARGB(255, 242, 211, 82)
    ),
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
            'assets/images/pattern.png',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text(
              'Akhbarak El Youm',
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
          ),

          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  color: Colors.green,
                  width: double.infinity,
                  height: 130,
                  child: Text('Akhbarak El Youm!',style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white
                  ),),
                ),
                InkWell(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children:
                      [
                        const Icon(Icons.menu),
                        const Space(width: 20, height: 0),
                        Text('Category',style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,

                        ),),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: ()
                  {
                    navigateTo(context, routeName: SettingsScreen.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children:
                      [
                        const Icon(Icons.settings),
                        const Space(width: 20, height: 0),
                        Text('Settings',style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,

                        ),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Pick your category\nof interest',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.black54
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: category.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 6/7
                      ),
                      itemBuilder: (context,index) => CategoryGridView(
                          category: category[index],
                          index: index),

                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
