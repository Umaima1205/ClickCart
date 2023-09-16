import 'package:flutter/material.dart';
import 'package:myproject/models/Category.dart';

List<Category> ListOfCategory = [
  Category(id: 1, title: 'HouseHold'),
  Category(id: 2, title: 'Grocery'),
  Category(id: 3, title: 'Accessories'), // New category
];

class CategoryList extends StatefulWidget {
  final List<Category> categories;
  final Function(int) onCategorySelected;

  CategoryList({
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedCategoryId = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Enable horizontal scrolling
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (Category category in widget.categories)
            Container(
              margin: const EdgeInsets.all(8.0), // Add margin here
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedCategoryId = category.id;
                  });
                  widget.onCategorySelected(category.id);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: selectedCategoryId == category.id
                      ? const Color(0xffFFC83A)
                      : Colors.white,
                  foregroundColor:selectedCategoryId == category.id
                      ? Colors.white
                      : Colors.black,// Change text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Round the corners
                    // Add border
                    side: BorderSide(
                      color: selectedCategoryId == category.id
                          ? Colors.transparent// Border color when selected
                          :Colors.grey,
                      width: 1.0, // Border width
                    ),
                  ),
                  // Change the height and width of the button
                  minimumSize: const Size(120, 40), // Adjust the size as needed
                ),
                child: Text(
                  category.title, // Change category title and make it uppercase
                  style: const TextStyle(
                    fontSize: 14, // Adjust font size
                    fontWeight: FontWeight.normal, // Apply bold style
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
