import 'package:akhbarak_el_youm/Core/components/size_box.dart';
import 'package:akhbarak_el_youm/Core/model/sources.dart';
import 'package:akhbarak_el_youm/View/Mobile/Widget/news_lits.dart';
import 'package:akhbarak_el_youm/View/Mobile/Widget/source_tab_items.dart';
import 'package:flutter/material.dart';

class CategoryTabsWidget extends StatefulWidget {
  List<Source> sources;

  CategoryTabsWidget(this.sources, {super.key});

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources
                  .map((item) => SourceTab(
                      item, widget.sources.indexOf(item) == selectedIndex))
                  .toList(),
            ),
            const Space(width: 0, height: 20),
            Expanded(
              child: NewsList(widget.sources[selectedIndex]),
            ),
          ],
        ),
      ),
    );
  }
}
