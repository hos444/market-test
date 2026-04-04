import 'package:flutter/material.dart';

void showDeleteAccountSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// indicator
            Container(
              width: 40,
              height: 4,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            /// icon
            Icon(Icons.warning, color: Colors.red, size: 40),

            SizedBox(height: 15),

            /// title
            Text(
              "Delete Account",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            /// description
            Text(
              "Are you sure you want to delete your account? "
              "This action cannot be undone.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600, height: 1.5),
            ),

            SizedBox(height: 25),

            /// delete button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // DELETE ACCOUNT LOGIC
                },
                child: Text(
                  "Delete Account",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 10),

            /// cancel button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
            ),

            SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}
