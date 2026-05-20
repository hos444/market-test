import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:finall_app/core/utils/image_url_utils.dart';
import '../../catalog/presentation/bloc/catalog_cubit.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  ArrowBack(),
        title: Text(
          "category".tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<CatalogCubit, CatalogState>(
        builder: (context, state) {
          if (state is CatalogLoading) return const Center(child: CircularProgressIndicator());
          if (state is CatalogLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final category = state.categories[index];
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListProductScreen(categoryId: category.id.toString(), categoryName: category.name),
                    ),
                  ),
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            ImageUrlUtils.getFullUrl(category.image),
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(category.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
