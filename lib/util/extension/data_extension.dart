extension StringExtension on String {
  String toCapitalCase() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String toTitleCase() {
    if (this.length <= 1) {
      return this.toUpperCase();
    } else {
      // Split string into multiple words
      final List<String> words = this.split(" ");

      // Capitalize first letter of each words
      final capitalizedWords = words.map(
        (word) {
          if (word.trim().isNotEmpty) {
            final String firstLetter =
                word.trim().substring(0, 1).toUpperCase();
            final String remainingLetters = word.trim().substring(1);

            return "$firstLetter$remainingLetters";
          }

          return "";
        },
      );

      // Merge all words back to one String
      return capitalizedWords.join(" ");
    }
  }
}
