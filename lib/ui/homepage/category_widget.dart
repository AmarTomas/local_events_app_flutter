
import 'package:flutter/material.dart';
import '../../Model/category.dart';
import '../../app_state.dart';
import '../../styleguide.dart';
import 'package:provider/provider.dart';
class CategoryWidget extends StatelessWidget {
  final Category category;
  const CategoryWidget({required this.category,super.key});

  @override
  Widget build(BuildContext context) {
    final appState=Provider.of<AppState>(context);
    final isSelected=appState.selectedCategoryId==category.categoryId;
    return GestureDetector(
      onTap: () {
        if(!isSelected) {
          appState.updateCategoryId(category.categoryId!);
        }},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0x99FFFFFF),width: 3),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: isSelected?Colors.white:Colors.transparent
        ),
        child: Column(
          children: <Widget>[
            Icon(category.icon,color: isSelected?Theme.of(context).primaryColor:Colors.white,size: 40,),
            const SizedBox(height: 10,),
            Text("${category.name}",style: isSelected?selectedCategoryTextStyle:categoryTextStyle)
          ],
        ),
      ),
    );
  }
}
