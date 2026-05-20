class AddressModel {
  final String id;
  final String userId;
  final String tenantId;
  final String name;
  final String? governorate;
  final String? city;
  final String? district;
  final String? street;
  final String? building;
  final String? floor;
  final String? apartment;
  final String? receiverName;
  final String? receiverPhone;
  final String? notes;
  final double? lat;
  final double? lng;
  final bool isDefault;

  AddressModel({
    required this.id,
    required this.userId,
    required this.tenantId,
    required this.name,
    this.governorate,
    this.city,
    this.district,
    this.street,
    this.building,
    this.floor,
    this.apartment,
    this.receiverName,
    this.receiverPhone,
    this.notes,
    this.lat,
    this.lng,
    required this.isDefault,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      userId: json['user_id'],
      tenantId: json['tenant_id'],
      name: json['name'],
      governorate: json['governorate'],
      city: json['city'],
      district: json['district'],
      street: json['street'],
      building: json['building'],
      floor: json['floor'],
      apartment: json['apartment'],
      receiverName: json['receiver_name'],
      receiverPhone: json['receiver_phone'],
      notes: json['notes'],
      lat: json['lat'] != null ? double.parse(json['lat'].toString()) : null,
      lng: json['lng'] != null ? double.parse(json['lng'].toString()) : null,
      isDefault: json['is_default'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'tenant_id': tenantId,
      'name': name,
      'governorate': governorate,
      'city': city,
      'district': district,
      'street': street,
      'building': building,
      'floor': floor,
      'apartment': apartment,
      'receiver_name': receiverName,
      'receiver_phone': receiverPhone,
      'notes': notes,
      'lat': lat,
      'lng': lng,
      'is_default': isDefault,
    };
  }

  String get fullAddress {
    return "${street ?? ''}, ${city ?? ''}, ${governorate ?? ''}".replaceAll(RegExp(r'^, |, $'), '').trim();
  }
}
