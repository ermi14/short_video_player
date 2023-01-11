class VideoModel {
  VideoModel({
    required this.clipId,
    required this.clipName,
    required this.clipUrl,
    required this.clipThumb,
    this.faved,
    this.claimed,
    this.siteName,
    this.marGroup,
    this.clipDate,
    this.clipTitle,
    this.marSessionId,
    this.tags,
  });

  int clipId;
  String clipName;
  String clipUrl;
  String clipThumb;
  bool? faved;
  bool? claimed;
  String? siteName;
  String? marGroup;
  DateTime? clipDate;
  String? clipTitle;
  int? marSessionId;
  String? tags;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        clipId: json["clipId"],
        clipName: json["clipName"],
        clipUrl: json["clipURL"],
        clipThumb: json["clipThumb"],
        faved: json["faved"],
        claimed: json["claimed"],
        siteName: json["siteName"],
        marGroup: json["marGroup"],
        clipDate: DateTime.parse(json["clipDate"]),
        clipTitle: json["clipTitle"],
        marSessionId: json["marSessionID"],
        tags: json["tags"],
      );

  Map<String, dynamic> toJson() => {
        "clipId": clipId,
        "clipName": clipName,
        "clipURL": clipUrl,
        "clipThumb": clipThumb,
        "faved": faved,
        "claimed": claimed,
        "siteName": siteName,
        "marGroup": marGroup,
        "clipDate": clipDate?.toIso8601String(),
        "clipTitle": clipTitle,
        "marSessionID": marSessionId,
        "tags": tags,
      };
}
