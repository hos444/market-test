import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

//// ================= DESCRIPTION =================

class SectionText extends StatelessWidget {
  const SectionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Text(
        "description_text".tr(),
        style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.5),
      ),
    );
  }
}

//// ================= HEADER =================

class RecipeHeader extends StatelessWidget {
  const RecipeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "name".tr(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 8),

        Row(
          children: [
            const CircleAvatar(radius: 14),
            const SizedBox(width: 8),

            Text("farmer_name".tr(), style: TextStyle(fontSize: 14)),

            const Spacer(),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "price".tr(),
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//// ================= INGREDIENTS =================

class IngredientsList extends StatelessWidget {
  const IngredientsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IngredientItem(text: "origin".tr()),
        IngredientItem(text: "nutrition".tr()),
        IngredientItem(text: "shelf_life".tr()),
      ],
    );
  }
}

class IngredientItem extends StatelessWidget {
  final String text;

  const IngredientItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

//// ================= STEPS =================

class StepsList extends StatelessWidget {
  const StepsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons/star.svg'),
            SvgPicture.asset('assets/icons/star.svg'),
            SvgPicture.asset('assets/icons/star.svg'),
            SvgPicture.asset('assets/icons/star.svg'),
            SizedBox(width: 5),
            Text('4.5', style: TextStyle(fontWeight: FontWeight.normal)),
          ],
        ),
      ],
    );
  }
}

class StepItem extends StatelessWidget {
  final int number;
  final String text;

  const StepItem({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.black,
            child: Text(
              "$number",
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CommentWidget extends StatelessWidget {
  final String name;
  final String comment;
  final double rating;

  const CommentWidget({
    super.key,
    required this.name,
    required this.comment,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الاسم + التقييم
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 18,
                    );
                  }),
                ),
              ],
            ),

            SizedBox(height: 8),

            // الكومنت
            Text(
              comment,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
