import 'package:movies_app/app/constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension DashString on String? {
  String orDash() {
    if (this == null) {
      return Constants.dash;
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}

extension NonNulldouble on double? {
  double orZero() {
    if (this == null) {
      return Constants.doubleZero;
    } else {
      return this!;
    }
  }
}

extension NonNullBoolean on bool? {
  bool orFalse() {
    if (this == null) {
      return Constants.defaultBool;
    } else {
      return this!;
    }
  }
}
