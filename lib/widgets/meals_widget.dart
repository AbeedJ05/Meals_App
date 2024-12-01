import 'package:flutter/material.dart';
import 'package:meals_app/models/meals_model.dart';
import 'package:meals_app/widgets/expand_meals.dart'; // Custom widget to display icons with labels.
import 'package:transparent_image/transparent_image.dart'; // For a placeholder image while loading network images.

class MealsWidget extends StatelessWidget {
  const MealsWidget({
    super.key, // Key for identifying this widget instance.
    required this.meal, // Meal data to display (from the `MealsModel`).
    required this.onSelectMeal, // Callback function to handle meal selection.
  });

  final MealsModel meal; // Represents the meal's details, such as title, image URL, etc.
  final void Function(MealsModel meal) onSelectMeal; // Callback to execute when a meal is selected.

  // Getter to format the complexity text with the first letter capitalized.
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  // Getter to format the affordability text with the first letter capitalized.
  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // Represents a material design card widget.
      margin: const EdgeInsets.all(8), // Adds space around the card.
      shape: RoundedRectangleBorder(
        // Gives rounded corners to the card.
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge, // Ensures child widgets are clipped to the card's border.
      elevation: 2, // Adds shadow for a raised effect.
      child: InkWell(
        // Makes the card tappable with visual feedback.
        onTap: () {
          onSelectMeal(meal); // Triggers the callback with the meal data when tapped.
        },
        child: Stack(
          // Allows stacking child widgets on top of each other.
          children: [
            FadeInImage(
              // Fades in the image when loaded from the network.
              placeholder: MemoryImage(kTransparentImage), // Transparent placeholder while loading.
              image: NetworkImage(meal.imageUrl), // URL for the meal's image.
              fit: BoxFit.cover, // Ensures the image covers the entire space.
              height: 200, // Fixed height for the image.
              width: double.infinity, // Makes the image stretch to the card's width.
            ),
            Positioned(
              // Positions a child widget at the bottom of the stack.
              bottom: 0, // Aligns the container to the bottom.
              left: 0,
              right: 0,
              child: Container(
                // Semi-transparent container overlay for the text.
                color: Colors.black54, // Semi-transparent black background.
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 44,
                ), // Adds padding around the content.
                child: Column(
                  // Organizes the child widgets vertically.
                  children: [
                    Text(
                      // Displays the meal's title.
                      meal.title, // Title from the meal model.
                      maxLines: 2, // Limits to two lines.
                      textAlign: TextAlign.center, // Centers the text.
                      softWrap: true, // Breaks text into multiple lines if needed.
                      overflow: TextOverflow.ellipsis, // Adds "..." for overflow text.
                      style: const TextStyle(
                        fontSize: 20, // Font size for the title.
                        fontWeight: FontWeight.bold, // Bold font for emphasis.
                        color: Colors.white, // White text color for visibility.
                      ),
                    ),
                    const SizedBox(height: 12), // Spacing between the title and the row.
                    Row(
                      // Organizes icons and labels horizontally.
                      mainAxisAlignment: MainAxisAlignment.center, // Centers the row's content.
                      children: [
                        ExpandMeals(
                          // Custom widget to display an icon and label for duration.
                          icon: Icons.schedule, // Icon for duration.
                          label: '${meal.duration} min', // Duration in minutes.
                        ),
                        const SizedBox(width: 12), // Spacing between elements.
                        ExpandMeals(
                          // Custom widget to display an icon and label for complexity.
                          icon: Icons.work, // Icon for complexity.
                          label: complexityText, // Text for the complexity level.
                        ),
                        const SizedBox(width: 12), // Spacing between elements.
                        ExpandMeals(
                          // Custom widget to display an icon and label for affordability.
                          icon: Icons.attach_money, // Icon for affordability.
                          label: affordabilityText, // Text for the affordability level.
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
