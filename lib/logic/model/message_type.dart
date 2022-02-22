import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/config/colors.dart';

enum MessageType {error, warning, success, info}

extension MessageTypeExtension on MessageType{

  String get name{
    switch (this) {
      case MessageType.error:
        return 'Błąd';
      case MessageType.warning:
        return 'Ostrzeżenie';
      case MessageType.success:
        return 'Sukces';
      case MessageType.info:
        return 'Informacja';
    }
  }

  Color get color{
    switch (this) {
      case MessageType.error:
        return redColor;
      case MessageType.warning:
        return yellowColor;
      case MessageType.success:
        return greenColor;
      case MessageType.info:
        return blueColor;
    }
  }

  IconData get icon{
    switch (this) {
      case MessageType.error:
        return Icons.error;
      case MessageType.warning:
        return Icons.error;
      case MessageType.success:
        return Icons.check_circle;
      case MessageType.info:
        return Icons.info;
    }
  }
}