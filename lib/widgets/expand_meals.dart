import 'package:flutter/material.dart';

// This widget represents an icon paired with a label (text).
// It's typically used for displaying meal attributes like duration, complexity, or affordability.
class ExpandMeals extends StatelessWidget {
  // Constructor for initializing the icon and label.
  const ExpandMeals({
    required this.label, // The text to display next to the icon.
    required this.icon, // The icon to display.
    super.key, // Optional key for widget identification and optimization.
  });

  final IconData icon; // The icon to represent a specific attribute (e.g., duration).
  final String label; // The text to describe the attribute (e.g., "30 min").

  @override
  Widget build(BuildContext context) {
    return Row(
      // A horizontal layout for the icon and label.
      children: [
        Icon(
          icon, // Displays the provided icon.
          size: 17, // Sets the size of the icon.
          color: Colors.white, // Makes the icon white to match the design.
        ),
        const SizedBox(width: 6), // Adds horizontal spacing between the icon and the label.
        Text(
          label, // Displays the provided text.
          style: const TextStyle(
            color: Colors.white, // Makes the text white to match the icon.
          ),
        ),
      ],
    );
  }
}
