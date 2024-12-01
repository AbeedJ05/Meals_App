import 'package:flutter/material.dart';
import 'package:meals_app/models/meals_model.dart';

class MealsDetails extends StatelessWidget {
  const MealsDetails({
    required this.onToggleFavorite, // Callback function for toggling favorite status.
    required this.meal, // The meal object to display details for.
    super.key,
  });

  final MealsModel meal; // Holds the data of the selected meal.
  final void Function(MealsModel meal) onToggleFavorite; // Function to toggle meal favorite status.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title), // Displays the meal's title in the app bar.
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal); // Toggles favorite status when the star icon is tapped.
            },
            icon: const Icon(Icons.star), // Star icon for marking as favorite.
          ),
        ],
      ),
      body: SingleChildScrollView( // Allows vertical scrolling for content.
        child: Column(
          children: [
            // Displays the meal's image.
            Image.network(
              meal.imageUrl, // URL of the meal image.
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover, // Scales the image to cover the entire width and height.
            ),
            const SizedBox(height: 14), // Adds vertical spacing.

            // Section title for ingredients.
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary, // Primary color from the theme.
                    fontWeight: FontWeight.bold, // Bold font for emphasis.
                  ),
            ),
            const SizedBox(height: 14), // Adds vertical spacing.

            // Displays each ingredient in the meal.
            for (final ingredient in meal.ingredients)
              Text(
                ingredient, // Ingredient text.
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface, // Adapts to theme color.
                    ),
              ),
            const SizedBox(height: 24), // Adds vertical spacing.

            // Section title for steps.
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary, // Primary color from the theme.
                    fontWeight: FontWeight.bold, // Bold font for emphasis.
                  ),
            ),
            const SizedBox(height: 14), // Adds vertical spacing.

            // Displays each step with padding for better readability.
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12, // Horizontal padding for each step.
                  vertical: 8, // Vertical spacing between steps.
                ),
                child: Text(
                  step, // Step description text.
                  textAlign: TextAlign.center, // Centers the text horizontally.
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface, // Adapts to theme color.
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
