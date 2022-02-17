import 'package:flutter/material.dart';

class TrackOrderProvider extends ChangeNotifier {
  TrackOrderProvider() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        isStepFinished2 = true;
        notifyListeners();
      },
    ).then(
      (value) {
        Future.delayed(
          const Duration(seconds: 3),
          () {
            isStepFinished3 = true;
            notifyListeners();
          },
        ).then(
          (value) {
            Future.delayed(
              const Duration(seconds: 5),
              () {
                isStepFinished4 = true;
                notifyListeners();
              },
            );
          },
        );
      },
    );
  }

  bool isStepFinished2 = false;
  bool isStepFinished3 = false;
  bool isStepFinished4 = false;
}
