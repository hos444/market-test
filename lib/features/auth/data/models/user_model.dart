class UserModel {
  final String? id;
  final String name;
  final String email;
  final String? phone;
  final String role;
  final String? tenantId;
  final TenantModel? tenant;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.role,
    this.tenantId,
    this.tenant,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      role: json['role'] ?? 'FARMER',
      tenantId: json['tenant_id'],
      tenant: json['tenant'] != null ? TenantModel.fromJson(json['tenant']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'tenant_id': tenantId,
    };
  }
}

class TenantModel {
  final String id;
  final String name;
  final String? domain;

  TenantModel({
    required this.id,
    required this.name,
    this.domain,
  });

  factory TenantModel.fromJson(Map<String, dynamic> json) {
    return TenantModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      domain: json['domain'],
    );
  }
}

class AuthResponseModel {
  final UserModel user;
  final String token;

  AuthResponseModel({
    required this.user,
    required this.token,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return AuthResponseModel(
      user: UserModel.fromJson(data['user']),
      token: data['token'],
    );
  }
}
