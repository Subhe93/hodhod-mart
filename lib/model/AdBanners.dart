class AdBanner {
  AdBanner({
    this.id,
    this.title,
    this.subtitle,
    this.buttonText,
    this.buttonLink,
    this.status,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  String subtitle;
  String buttonText;
  String buttonLink;
  String status;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  AdBanner copyWith({
    int id,
    String title,
    String subtitle,
    String buttonText,
    String buttonLink,
    String status,
    String image,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      AdBanner(
        id: id ?? this.id,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        buttonText: buttonText ?? this.buttonText,
        buttonLink: buttonLink ?? this.buttonLink,
        status: status ?? this.status,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory AdBanner.fromJson(Map<String, dynamic> json) => AdBanner(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        buttonText: json["button_text"],
        buttonLink: json["button_link"],
        status: json["status"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "button_text": buttonText,
        "button_link": buttonLink,
        "status": status,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
