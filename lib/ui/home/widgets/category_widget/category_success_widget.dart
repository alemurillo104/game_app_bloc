import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/genre_model.dart';
import '../games_by_category_widget/bloc/games_by_category_bloc.dart';
import 'bloc/category_bloc.dart';
import 'category_item.dart';

class CategorySuccessWidget extends StatelessWidget {
  const CategorySuccessWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return SizedBox(
          height: 100,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: state.categories.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, int index) {
              return CategoryItem( 
                category: state.categories[index], 
                callback: (Genre categorySelected) {  
                  context.read<GamesByCategoryBloc>().add(
                    GetGamesByCategory(
                      idSelected: categorySelected.id,
                      categoryName: categorySelected.name,
                    ),
                  );
                  context.read<CategoryBloc>().add(
                    SelectCategory(
                      idSelected: categorySelected.id,
                    ),
                  );
                }, 
              );
            },
            separatorBuilder: (_, __) => const SizedBox( width: 16.0 )
          ),
        );
      },
    );
  }
}