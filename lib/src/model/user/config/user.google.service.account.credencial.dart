import 'dart:convert';

class GoogleServiceAccountCredentialsConfig {
  String type;
  String projectId;
  String privateKeyId;
  String privateKey;
  String clientEmail;
  String clientId;
  String authUri;
  String tokenUri;
  String authProviderX509CertUrl;
  String clientX509CertUrl;
  GoogleServiceAccountCredentialsConfig({
    required this.type,
    required this.projectId,
    required this.privateKeyId,
    required this.privateKey,
    required this.clientEmail,
    required this.clientId,
    required this.authUri,
    required this.tokenUri,
    required this.authProviderX509CertUrl,
    required this.clientX509CertUrl,
  });

  GoogleServiceAccountCredentialsConfig copyWith({
    String? type,
    String? projectId,
    String? privateKeyId,
    String? privateKey,
    String? clientEmail,
    String? clientId,
    String? authUri,
    String? tokenUri,
    String? authProviderX509CertUrl,
    String? clientX509CertUrl,
  }) {
    return GoogleServiceAccountCredentialsConfig(
      type: type ?? this.type,
      projectId: projectId ?? this.projectId,
      privateKeyId: privateKeyId ?? this.privateKeyId,
      privateKey: privateKey ?? this.privateKey,
      clientEmail: clientEmail ?? this.clientEmail,
      clientId: clientId ?? this.clientId,
      authUri: authUri ?? this.authUri,
      tokenUri: tokenUri ?? this.tokenUri,
      authProviderX509CertUrl: authProviderX509CertUrl ?? this.authProviderX509CertUrl,
      clientX509CertUrl: clientX509CertUrl ?? this.clientX509CertUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'type': type});
    result.addAll({'project_id': projectId});
    result.addAll({'private_key_id': privateKeyId});
    result.addAll({'private_key': privateKey});
    result.addAll({'client_email': clientEmail});
    result.addAll({'client_id': clientId});
    result.addAll({'auth_uri': authUri});
    result.addAll({'token_uri': tokenUri});
    result.addAll({'auth_provider_x509_cert_url': authProviderX509CertUrl});
    result.addAll({'client_x509_cert_url': clientX509CertUrl});

    return result;
  }

  factory GoogleServiceAccountCredentialsConfig.fromMap(Map<String, dynamic> map) {
    return GoogleServiceAccountCredentialsConfig(
      type: map['type'] ?? '',
      projectId: map['project_id'] ?? '',
      privateKeyId: map['private_key_id'] ?? '',
      privateKey: map['private_key'] ?? '',
      clientEmail: map['client_email'] ?? '',
      clientId: map['client_id'] ?? '',
      authUri: map['auth_uri'] ?? '',
      tokenUri: map['token_uri'] ?? '',
      authProviderX509CertUrl: map['auth_provider_x509_cert_url'] ?? '',
      clientX509CertUrl: map['client_x509_cert_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GoogleServiceAccountCredentialsConfig.fromJson(String source) =>
      GoogleServiceAccountCredentialsConfig.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GoogleServiceAccountCredentialsConfig(type: $type, projectId: $projectId, privateKeyId: $privateKeyId, privateKey: $privateKey, clientEmail: $clientEmail, clientId: $clientId, authUri: $authUri, tokenUri: $tokenUri, authProviderX509CertUrl: $authProviderX509CertUrl, clientX509CertUrl: $clientX509CertUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GoogleServiceAccountCredentialsConfig &&
        other.type == type &&
        other.projectId == projectId &&
        other.privateKeyId == privateKeyId &&
        other.privateKey == privateKey &&
        other.clientEmail == clientEmail &&
        other.clientId == clientId &&
        other.authUri == authUri &&
        other.tokenUri == tokenUri &&
        other.authProviderX509CertUrl == authProviderX509CertUrl &&
        other.clientX509CertUrl == clientX509CertUrl;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        projectId.hashCode ^
        privateKeyId.hashCode ^
        privateKey.hashCode ^
        clientEmail.hashCode ^
        clientId.hashCode ^
        authUri.hashCode ^
        tokenUri.hashCode ^
        authProviderX509CertUrl.hashCode ^
        clientX509CertUrl.hashCode;
  }
}
