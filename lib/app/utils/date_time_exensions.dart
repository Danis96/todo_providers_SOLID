

extension DateConversion on DateTime {

  String dateToString() {
    List<String> date = <String>[];
    date = toString().split(' ');
    return date[0];
  }

}