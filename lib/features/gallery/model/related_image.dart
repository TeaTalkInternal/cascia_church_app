class RealatedImage {
  late String publicId;
  late String assetId;
  late String folder;
  late String filename;
  late String url;
  late String secureUrl;

  RealatedImage(
      {required this.publicId,
      required this.assetId,
      required this.folder,
      required this.filename,
      required this.url,
      required this.secureUrl});

  RealatedImage.fromJson(Map<String, dynamic> json) {
    publicId = json['public_id'] != null ? json['public_id'] as String : '--';
    assetId = json['asset_id'] != null ? json['asset_id'] as String : '--';
    folder = json['folder'] != null ? json['folder'] as String : '--';
    filename = json['filename'] != null ? json['filename'] as String : '--';
    url = json['url'] != null ? json['url'] as String : '--';
    secureUrl =
        json['secure_url'] != null ? json['secure_url'] as String : '--';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['public_id'] = this.publicId;
    data['asset_id'] = this.assetId;
    data['folder'] = this.folder;
    data['filename'] = this.filename;
    data['url'] = this.url;
    data['secure_url'] = this.secureUrl;
    return data;
  }
}
