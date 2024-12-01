import 'package:flutter/material.dart';
import 'package:meals_app/models/meals_model.dart'; // Model representing a meal.
import 'package:meals_app/screens/meals_details.dart'; // Screen for detailed meal view.
import 'package:meals_app/widgets/meals_widget.dart'; // Widget to display a meal card.

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title, // Optional title for the screen (e.g., category name).
    required this.meals, // List of meals to display on this screen.
    required this.onToggleFavorite, // Callback for toggling meal favorite status.
  });

  final void Function(MealsModel meal) onToggleFavorite; // Function to toggle favorite status.
  final String? title; // Optional title passed to the screen.
  final List<MealsModel> meals; // List of meals to be displayed.

  // Navigates to the meal details screen when a meal is selected.
  void selectMeal(BuildContext context, MealsModel meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsDetails(
          meal: meal, // Passes the selected meal to the details screen.
          onToggleFavorite: onToggleFavorite, // Passes the toggle favorite function.
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Default content to display when there are no meals to show.
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Centers the column vertically.
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ), // Uses theme-based styling.
          ),
          const SizedBox(height: 16), // Adds spacing between text widgets.
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ), // Suggests selecting another category.
          ),
        ],
      ),
    );

    // If meals are available, replace the default content with a list view of meals.
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length, // Number of items in the list.
        itemBuilder: (ctx, index) => MealsWidget(
          meal: meals[index], // Passes each meal to the meal widget.
          onSelectMeal: (meals) {
            selectMeal(context, meals); // Triggers navigation to meal details.
          },
        ),
      );
    }

    // If no title is provided, return just the content (no app bar).
    if (title == null) {
      return content;
    }

    // If a title is provided, wrap the content in a Scaffold to include an app bar.
    return Scaffold(
      appBar: AppBar(
        title: Text(title!), // Displays the provided title in the AppBar.
      ),
      body: content, // Displays the list of meals or the default message.
    );
  }
}
