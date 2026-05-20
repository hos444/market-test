import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:finall_app/core/utils/image_url_utils.dart';
import 'package:flutter/material.dart';
import '../../listings/data/models/listing_model.dart';

class CardHome1 extends StatelessWidget {
  final ListingModel listing;
  const CardHome1({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.grey.shade200),
              width: 220,
              height: 190,
              child: Image.network(ImageUrlUtils.getFullUrl(listing.image), fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const Text('3.9 /', style: TextStyle(fontSize: 12)),
                      Text("reviews_count".tr(), style: const TextStyle(color: Colors.grey, fontSize: 10)),
                    ],
                  ),
                  Text(
                    listing.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Productdetails(listing: listing))),
                    child: Text("browse_products".tr(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
