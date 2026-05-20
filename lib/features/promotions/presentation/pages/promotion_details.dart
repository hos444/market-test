import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:finall_app/core/utils/image_url_utils.dart';
import '../../data/models/promotion_model.dart';
import 'package:finall_app/core/utils/export_packeg.dart';

class PromotionDetailsPage extends StatelessWidget {
  final PromotionModel promotion;

  const PromotionDetailsPage({super.key, required this.promotion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          promotion.name,
          style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (promotion.imageUrl != null)
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(promotion.imageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    promotion.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  if (promotion.description != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      promotion.description!,
                      style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                    ),
                  ],
                  const SizedBox(height: 24),
                  const Text(
                    "Products in this offer",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ).tr(),
                  const SizedBox(height: 16),
                  if (promotion.listings.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Text("no_products".tr()),
                      ),
                    )
                  else
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: promotion.listings.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.72,
                      ),
                      itemBuilder: (context, index) {
                        return PremiumListingCard(listing: promotion.listings[index]);
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
