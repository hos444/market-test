import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 229, 234, 234),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // 🔹 Top Row (Image + Info)
          Row(
            children: [
              // Image
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage("assets/fruits/banana.png"), // غير الصورة
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(width: 12),

              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Banana Fruit",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 6),

                    // Rating
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 18),
                        Icon(Icons.star, color: Colors.orange, size: 18),
                        Icon(Icons.star, color: Colors.orange, size: 18),
                        Icon(Icons.star, color: Colors.orange, size: 18),
                        Icon(Icons.star_half, color: Colors.orange, size: 18),
                        SizedBox(width: 5),
                        Text("4.8"),
                      ],
                    ),
                    SizedBox(height: 6),

                    Text(
                      "\$100.99",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 12),

          // 🔹 Status Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Status",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 50, 158, 245),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Pending",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),

          SizedBox(height: 8),

          // 🔹 Delivery Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Date",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("22 Dec, 2025"),
            ],
          ),

          SizedBox(height: 14),

          // 🔹 Buttons
          Row(
            children: [
              // View Details
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.green),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Productdetails()),
                    );
                  },
                  child: Text(
                    "View details",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),

              SizedBox(width: 10),

              // Cancel
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {},
                  child: Text("Cancel", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
