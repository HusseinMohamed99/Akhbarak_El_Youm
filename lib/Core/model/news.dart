import 'package:akhbarak_el_youm/Core/model/sources.dart';

/// source : {"id":"business-insider","name":"Business Insider"}
/// author : "jhart@insider.com (Jordan Hart)"
/// title : "Property documents for a London apartment suggest wanted 'crypto-queen' is alive after allegedly vanishing in 2017 with $4 billion from investors"
/// description : "The listing was reportedly taken down after the property agent learned of its ties to the fugitive, a lead unearthed by podcast host Jamie Bartlett."
/// url : "https://www.businessinsider.com/scamming-crypto-queen-alive-on-the-run-property-documents-suggest-2023-1"
/// urlToImage : "https://i.insider.com/63cee194f7448600187a82b3?width=1200&format=jpeg"
/// publishedAt : "2023-01-29T17:07:24Z"
/// content : "Listings for a property in the UK may have just located the \"crypto-queen\" Ruja Ignatova years after her disappearance in 2017.\r\nBulgarian-born Ignatova, 42, is wanted by the FBI for allegedly scammi… [+1779 chars]"

class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,});

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}