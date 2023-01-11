import 'package:pushit_test/data/model/video_model.dart';

class VideosResponseModel {
  VideosResponseModel({
    this.result,
    this.totalRows,
    this.rows,
    required this.clips,
  });

  int? result;
  int? totalRows;
  int? rows;
  List<VideoModel> clips;

  factory VideosResponseModel.fromJson(Map<String, dynamic> json) =>
      VideosResponseModel(
        result: json["result"],
        totalRows: json["totalrows"],
        rows: json["rows"],
        clips: List<VideoModel>.from(
          json["clips"].map(
            (x) => VideoModel.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "totalrows": totalRows,
        "rows": rows,
        "clips": List<dynamic>.from(clips.map((x) => x.toJson())),
      };
}
