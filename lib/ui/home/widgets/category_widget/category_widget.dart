import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_app/ui/home/models/genre_model.dart';
import 'package:stripe_app/ui/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:stripe_app/ui/home/widgets/category_widget/category_item.dart';
import 'package:stripe_app/ui/home/widgets/games_by_category_widget/bloc/games_by_category_bloc.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      buildWhen: (previous, current) => current.status.isSuccess,
      builder: (context, state) {
        return const _CategoryWidget();
      },
    );
  }
}

class _CategoryWidget extends StatelessWidget {
  const _CategoryWidget({
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
