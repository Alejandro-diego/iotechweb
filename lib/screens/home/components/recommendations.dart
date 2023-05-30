import 'package:flutter/material.dart';
import 'package:iotechweb/screens/home/components/recommendation_card.dart';
import '../../../constants.dart';
import '../../../models/Recommendation.dart';

class Recommendations extends StatelessWidget {
  const Recommendations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recomendações",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: defaultPadding),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                demorecommendations.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: defaultPadding),
                  child: RecommendationCard(
                    recommendation: demorecommendations[index],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

