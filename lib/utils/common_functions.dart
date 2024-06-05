class CustomException implements Exception {
  final String message;
  CustomException(this.message);

  @override
  String toString() {
    return message;
  }
}

void printFull(String str) {
  const int chunkSize = 600; // You can adjust the size
  for (int i = 0; i < str.length; i += chunkSize) {
    print(str.substring(i, i + chunkSize > str.length ? str.length : i + chunkSize));
  }
}