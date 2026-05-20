import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/offers_cubit.dart';
import '../../data/models/offer_model.dart';
import '../../../auth/presentation/bloc/auth_cubit.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() {
    final authState = context.read<AuthCubit>().state;
    if (authState is AuthAuthenticated) {
      context.read<OffersCubit>().fetchOffers(authState.user.role);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "negotiations".tr(),
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async => _refresh(),
        color: const Color(0xff1B5E3C),
        child: BlocBuilder<OffersCubit, OffersState>(
          builder: (context, state) {
            if (state is OffersLoading) {
              return const Center(child: CircularProgressIndicator(color: Color(0xff1B5E3C)));
            }

            if (state is OffersError) {
              return Center(child: Text(state.message));
            }

            if (state is OffersLoaded) {
              if (state.offers.isEmpty) {
                return _buildEmptyState();
              }
              return ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: state.offers.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) => _buildOfferCard(state.offers[index]),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.handshake_outlined, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          Text(
            "no_offers".tr(),
            style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildOfferCard(OfferModel offer) {
    final authState = context.read<AuthCubit>().state;
    if (authState is! AuthAuthenticated) return const SizedBox();
    final user = authState.user;
    final isOwner = offer.listing?.userId == user.id;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          offer.listing?.title ?? "Product",
                          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: Color(0xff1A1A1A)),
                        ),
                      ),
                      _buildStatusBadge(offer.status),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.payments_outlined, size: 18, color: Colors.grey.shade600),
                      const SizedBox(width: 8),
                      Text(
                        "${"offered_price".tr()}: ",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      Text(
                        "${offer.amount} EGP",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xff1B5E3C)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (offer.status == 'PENDING' && isOwner)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                color: const Color(0xffF9FAFB),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1B5E3C),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () => _respond(offer.id.toString(), 'ACCEPTED'),
                        child: Text("accept".tr(), style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.redAccent,
                          side: const BorderSide(color: Colors.redAccent),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () => _respond(offer.id.toString(), 'REJECTED'),
                        child: Text("reject".tr(), style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              )
            else if (offer.status == 'PENDING' && !isOwner)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                color: Colors.grey.shade50,
                child: Center(
                  child: Text(
                    "waiting_for_response".tr(),
                    style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey.shade600, fontSize: 13),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    IconData icon;
    
    switch (status.toUpperCase()) {
      case 'ACCEPTED':
        color = Colors.green;
        icon = Icons.check_circle_rounded;
        break;
      case 'REJECTED':
        color = Colors.red;
        icon = Icons.cancel_rounded;
        break;
      case 'PENDING':
        color = Colors.orange;
        icon = Icons.timer_rounded;
        break;
      default:
        color = Colors.grey;
        icon = Icons.help_outline_rounded;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            status.tr(),
            style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }

  void _respond(String id, String status) {
    context.read<OffersCubit>().respondToOffer(id, status);
  }
}

