import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';

// This widget represents a single category item in the app.
// It displays the category's title and uses a gradient background color.
class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key, // Passes a key to the widget, used for optimizing widget rebuilds.
    required this.category, // A required parameter for the category's data.
    required this.onSelectCategory, // A required callback function for handling taps.
  });

  final CategoryModel category; // The category data, including title and color.
  final void Function() onSelectCategory; // Function to call when the category is selected.

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Makes the container tappable with visual feedback.
      onTap: onSelectCategory, // Calls the provided callback when tapped.

      splashColor: Theme.of(context).primaryColor, // The color shown when the widget is tapped.

      borderRadius: BorderRadius.circular(16), // Applies a rounded border to the touch feedback.

      child: Container(
        // A container that holds the visual representation of the category.
        padding: const EdgeInsets.all(16), // Adds padding inside the container.

        decoration: BoxDecoration(
          // Adds styling to the container.
          borderRadius: BorderRadius.circular(16), // Rounded corners with a radius of 16.

          gradient: LinearGradient(
            // A gradient background with two colors.
            colors: [
              category.color.withOpacity(0.55), // First gradient color with 55% opacity.
              category.color.withOpacity(0.9), // Second gradient color with 90% opacity.
            ],
            begin: Alignment.topLeft, // Starts the gradient from the top-left corner.
            end: Alignment.bottomRight, // Ends the gradient at the bottom-right corner.
          ),
        ),

        child: Text(
          // Displays the title of the category.
          category.title, // The text to display, coming from the category model.

          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            // Applies the app's theme style for large titles, with custom modifications.
            color: Theme.of(context).colorScheme.onSurface, // Sets the text color.
          ),
        ),
      ),
    );
  }
}
