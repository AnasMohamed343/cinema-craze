class ReusableFunctions {
  static String extractYear(String dateString) {
    if (dateString == "") {
      return "";
    }
    DateTime dateTime = DateTime.parse(dateString);
    return dateTime.year.toString();
  }

  static String getMovieClassification(bool adult) {
    if (adult) {
      return 'NC-17';
    } else {
      return 'PG-13';
    }
  }

  static String formatRuntime(int? runtimeInMinutes) {
    if (runtimeInMinutes != null && runtimeInMinutes > 0) {
      int hours = runtimeInMinutes ~/ 60;
      int minutes = runtimeInMinutes % 60;

      if (hours > 0 && minutes > 0) {
        return '${hours}h ${minutes}min';
      } else if (hours > 0) {
        return '${hours}h';
      } else if (minutes > 0) {
        return '${minutes}min';
      } else {
        return 'Unknown';
      }
    } else {
      return 'Unknown';
    }
  }
}
