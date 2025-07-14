
import 'package:beiti_care/view/screens/data/services_response_model.dart';
import 'package:flutter/material.dart';
import '../screens/nutrition_screen.dart';

class SuggestionsWidget extends StatelessWidget {
  final ServiceModel service ; 
   const SuggestionsWidget({super.key, required this.service,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NutritionScreen(service:service,)));
        },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 67,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.6, color: Colors.grey),
            ),
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, ),
                    child:
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 0.3,
                              color: Colors.grey),
                          color: Colors.grey.shade300
                      ),
                      child: Image.asset(
                        "assets/images/health.png",
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                  const SizedBox(width: 13),
                  Text(
                    service.name,
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}

