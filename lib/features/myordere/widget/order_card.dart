import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:finall_app/core/utils/image_url_utils.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import '../../orders/data/models/order_model.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final firstItem = order.items.isNotEmpty ? order.items.first : null;
    final imagePath = firstItem?.listing?.image;
    final isAr = context.locale.languageCode == 'ar';

    // Title logic matching React frontend
    String title = "Product";
    if (order.items.isNotEmpty) {
      title = firstItem?.listing?.title ?? "Product";
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsScreen(order: order))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Top Row: ID and Status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "#${order.orderNumber}",
                      style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF1a1a1a), fontSize: 14),
                    ),
                    _buildStatusBadge(order.status, isAr),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(color: Color(0xFFF1F5F9), height: 1),
                ),
                
                // Middle Row: Image, Title, Date
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                        image: imagePath != null 
                            ? DecorationImage(
                                image: NetworkImage(ImageUrlUtils.getFullUrl(imagePath)),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: imagePath == null ? const Icon(Icons.image_not_supported, color: Color(0xFFCBD5E1)) : null,
                    ),
                    const SizedBox(width: 12),
                    
                    // Title and Date
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  title,
                                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Color(0xFF1E293B)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (order.items.length > 1)
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 6),
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF1F5F9),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    "+${order.items.length - 1}",
                                    style: const TextStyle(fontSize: 10, color: Color(0xFF475569), fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today, size: 12, color: Color(0xFF94A3B8)),
                              const SizedBox(width: 4),
                              Text(
                                DateFormat('dd MMM, yyyy').format(order.createdAt),
                                style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Bottom Row: Price and Action
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "total".tr(),
                          style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "${order.totalAmount} ${'egp'.tr()}",
                          style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF2E7D32), fontSize: 16),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFF94A3B8)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status, bool isAr) {
    String labelAr = status;
    String labelEn = status;
    Color color = const Color(0xFF6B7280);
    Color bg = const Color(0xFFF3F4F6);
    IconData icon = Icons.inventory_2_outlined;

    switch (status.toUpperCase()) {
      case 'PENDING_PAYMENT':
      case 'PENDING':
        labelAr = "في انتظار الدفع";
        labelEn = "Pending Payment";
        color = const Color(0xFFF59E0B);
        bg = const Color(0xFFFEF3C7);
        icon = Icons.access_time;
        break;
      case 'PAID':
        labelAr = "تم الدفع";
        labelEn = "Paid";
        color = const Color(0xFF10B981);
        bg = const Color(0xFFD1FADF);
        icon = Icons.check_circle_outline;
        break;
      case 'SHIPPED':
        labelAr = "تم الشحن";
        labelEn = "Shipped";
        color = const Color(0xFF3B82F6);
        bg = const Color(0xFFDBEAFE);
        icon = Icons.local_shipping_outlined;
        break;
      case 'COMPLETED':
        labelAr = "مكتمل";
        labelEn = "Completed";
        color = const Color(0xFF10B981);
        bg = const Color(0xFFD1FADF);
        icon = Icons.check_circle_outline;
        break;
      case 'CANCELLED':
        labelAr = "ملغي";
        labelEn = "Cancelled";
        color = const Color(0xFFEF4444);
        bg = const Color(0xFFFEE2E2);
        icon = Icons.cancel_outlined;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            isAr ? labelAr : labelEn,
            style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
