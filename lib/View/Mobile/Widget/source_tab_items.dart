import 'package:akhbarak_el_youm/Core/model/sources.dart';
import 'package:akhbarak_el_youm/Core/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SourceTab extends StatelessWidget {

  Source sources;
  bool isSelected;


  SourceTab(this.sources,this.isSelected,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeApp.lightPrimary,width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
        color: isSelected ? ThemeApp.lightPrimary : Colors.transparent,
      ),
      child: Text(sources.name ?? '',
      style: GoogleFonts.exo(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: isSelected ? Colors.white : ThemeApp.lightPrimary
      ),

      ),
    );
  }
}
