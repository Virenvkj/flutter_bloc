import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ex/core/categories_bloc/category_bloc.dart';
import 'package:flutter_bloc_ex/core/categories_bloc/category_state.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryBloc>(context).fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: BlocConsumer<CategoryBloc, CategoryStates>(
            listener: (context, state) {
              log(state.toString());
              if (state is LoadingState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Loading"),
                    backgroundColor: Colors.orange,
                  ),
                );
              } else if (state is SuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Success"),
                    backgroundColor: Colors.greenAccent,
                  ),
                );
              } else if (state is FailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Failure"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is LoadingState) {
                return const CircularProgressIndicator();
              } else if (state is FailureState) {
                return const Text("Something went wrong");
              } else if (state is SuccessState) {
                return ListView.builder(
                  itemCount: state.categoriesList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      state.categoriesList[index],
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
