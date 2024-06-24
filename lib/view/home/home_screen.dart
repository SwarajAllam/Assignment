import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_models/home/google_fit_controller.dart';

class HomeScreen extends StatelessWidget {
  final GoogleFitController googleFitController = Get.put(GoogleFitController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Hi!', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              _buildCard(
                title: 'Steps:',
                value: googleFitController.steps.value,
                goal: 15000,
                imageData: 'assets/footprint.png',
                context: context,
              ),
              SizedBox(height: 20),
              _buildCard(
                title: 'Calories Burned:',
                value: googleFitController.calories.value,
                goal: 1000,
                imageData: 'assets/calorie.png',
                context: context,
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildCard({required BuildContext context, required String title, required int value, required int goal, required String imageData}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                SizedBox(width: 5),
                Text(
                  value.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Image.asset(
                  imageData, // Replace with your image path
                  height: 60,
                  width: 40,
                ),
              ],
            ),
            SizedBox(height: 8),
            Stack(
              children: [
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: value / goal,
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('0',),
                Text('Goal: $goal',)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
