import 'package:chuva_dart/controllers/activity_controller.dart';
import 'package:chuva_dart/models/activity_model.dart';
import 'package:chuva_dart/models/people_model.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final ActivityController activityController;
  HomeController({required this.activityController});

  String formatterPeoples(List<PeopleModel>? peoples) {
    String authorsString = '';
    if (peoples != null && peoples.isNotEmpty) {
      for (int i = 0; i < peoples.length; i++) {
        authorsString += peoples[i].name;
        if (i != peoples.length - 1) {
          authorsString += ', ';
        }
      }
    }

    return authorsString;
  }

  List<ActivityModel> getActivityInDay() {
    return activityController.activities.where((e) {
      DateTime dateStart = e.dateStarted;
      DateTime dateActivity = DateTime(dateStart.year, dateStart.month, dateStart.day);
      return dateActivity.isAtSameMomentAs(activityController.dateSelected);
    }).toList();
  }

  String formaterDateOfActivity(String type, DateTime dateStart, DateTime dateEnd) {
    String hourStart = '${dateStart.hour}:${dateStart.minute.toString().padLeft(2, '0')}';
    String hourEnd = '${dateEnd.hour}:${dateEnd.minute.toString().padLeft(2, '0')}';

    return '$type de $hourStart até $hourEnd';
  }
}
