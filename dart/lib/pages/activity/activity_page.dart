import 'package:chuva_dart/controllers/activity_controller.dart';
import 'package:chuva_dart/models/activity_model.dart';
import 'package:chuva_dart/pages/activity/activity_page_controller.dart';
import 'package:chuva_dart/pages/activity/widgets/show_people.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  final ActivityModel activity;
  final ActivityController activityController;
  final ActivityPageController activityPageController;
  const ActivityPage({super.key, required this.activity, required this.activityController, required this.activityPageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chuva 💜 Flutter',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () => Navigator.pop(context), // Navigate back on tap
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(5),
              color: activityController.getFromCssColor(activity.color),
              child: Text(
                activity.titleCategory,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: Color(0xFF306dc3),
                      ),
                      const SizedBox(width: 5),
                      Text(activityPageController.formaterDateOfActivity(activity.dateStarted, activity.dateEnd)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Color(0xFF306dc3),
                      ),
                      const SizedBox(width: 5),
                      Text(activity.location),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () async {
                      activityPageController.setIsLoading(true);
                      await Future.delayed(const Duration(seconds: 1));
                      activityController.changeScheduled(activity.id);
                      activityPageController.setIsLoading(false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: activityPageController.isLoading ? const Color.fromARGB(255, 233, 233, 233) : const Color(0xFF306dc3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        activityPageController.isLoading
                            ? Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(3.14),
                                child: const Icon(
                                  Icons.replay,
                                  color: Color(0xFF888888),
                                ),
                              )
                            : const Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                        const SizedBox(width: 10),
                        activityPageController.isLoading
                            ? const Text(
                                'Processando...',
                                style: TextStyle(color: Color(0xFF888888)),
                              )
                            : Text(
                                activity.isScheduled ? 'Remover da sua agenda' : 'Adicionar à sua agenda',
                                style: const TextStyle(color: Colors.white),
                              ),
                      ],
                    ),
                  ),
                  if (activity.description != null) const SizedBox(height: 30),
                  if (activity.description != null)
                    Text(
                      activityPageController.formatterDescription(activity.description!),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  const SizedBox(height: 30),
                  if (activity.peoples != null && activity.peoples!.isNotEmpty)
                    Text(
                      activity.peoples![0].role,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  const SizedBox(height: 10),
                  if (activity.peoples != null && activity.peoples!.isNotEmpty)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: activity.peoples!.map((people) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ShowPeople(
                            people: people,
                          ),
                        );
                      }).toList(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
