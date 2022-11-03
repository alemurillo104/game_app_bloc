import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stripe_app/ui/home/models/genre_model.dart';
import 'package:stripe_app/ui/home/widgets/category_widget/bloc/category_bloc.dart';

typedef CategoryCLicked = Function(Genre categorySelected);

class CategoryItem extends StatelessWidget {
  final Genre category;
  final CategoryCLicked callback;

  const CategoryItem({
    Key? key,
    required this.category,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(category),
      child: BlocSelector<CategoryBloc, CategoryState, bool>(
        selector: (state) => (state.status.isSelected && state.idSelected == category.id),
        builder: (context, state) {
          return Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: !state ? 60 : 70,
                height: !state ? 60 : 70,
                curve: Curves.easeInOutCirc,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric( horizontal:2.0),
                decoration: BoxDecoration(
                  color: !state ? Colors.amberAccent : Colors.deepOrangeAccent,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.mail),// gamepad_outlined),
              ),
              const SizedBox(height: 4),
              Text(
                category.name, 
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black87),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              )
            ],
          );
        },
      ),
    );
  }
}