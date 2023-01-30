import 'package:intl/intl.dart';

class MyDateUtils{
  static String formatNewsDate(String inputDateString){
    var inputDateFormatter = DateFormat('yyyy-MM-ddThh:mm:ssZ');
    var outputDateFormatter =DateFormat('yyyy/MMM/dd hh:mm a');
    var inputDate = inputDateFormatter.parse(inputDateString);
    var outputDateString = outputDateFormatter.format(inputDate);
    return outputDateString;

  }  static String formatDate(String inputDateString){
    var inputDateFormatter = DateFormat('yyyy-MM-ddThh:mm:ssZ');
    var outputDateFormatter =DateFormat('dd/MM/yyyy - hh:mm a');
    var inputDate = inputDateFormatter.parse(inputDateString);
    var outputDateString = outputDateFormatter.format(inputDate);
    return outputDateString;
  }
}