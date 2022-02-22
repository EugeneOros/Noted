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
        return errorColor;
      case MessageType.warning:
        return warningColor;
      case MessageType.success:
        return successColor;
      case MessageType.info:
        return infoColor;
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