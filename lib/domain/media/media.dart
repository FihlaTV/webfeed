import 'package:webfeed/domain/media/category.dart';
import 'package:webfeed/domain/media/content.dart';
import 'package:webfeed/domain/media/credit.dart';
import 'package:webfeed/domain/media/group.dart';
import 'package:webfeed/domain/media/rating.dart';
import 'package:webfeed/util/helpers.dart';
import 'package:xml/xml.dart';

class Media {
  final Group group;
  final List<Content> contents;
  final List<Credit> credits;
  final Category category;
  final Rating rating;

  Media({
    this.group,
    this.contents,
    this.credits,
    this.category,
    this.rating,
  });

  factory Media.parse(XmlElement element) {
    return new Media(
      group: new Group.parse(
        findElementOrNull(element, "media:group"),
      ),
      contents: element.findElements("media:content").map((e) {
        return new Content.parse(e);
      }).toList(),
      credits: element.findElements("media:credit").map((e) {
        return new Credit.parse(e);
      }).toList(),
      category: new Category.parse(
        findElementOrNull(element, "media:category"),
      ),
      rating: new Rating.parse(
        findElementOrNull(element, "media:rating"),
      ),
    );
  }
}