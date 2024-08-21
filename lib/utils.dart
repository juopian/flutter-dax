
double? parseDouble(Object? value) {
  if (value is int) {
    return value.toDouble();
  } else if((value is double)) {
    return value;
  } else {
    return null;
  }

}