import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
part 'comments_model.g.dart';
@JsonSerializable()
class CommentModel{
  String user;
  String content;
  String timeStamp;
  CommentModel();
  factory CommentModel.fromJson(Map<String,dynamic> json)=>
    _$CommentModelFromJson(json);
  Map<String,dynamic> toJson()=>
    _$CommentModelToJson(this);

  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('HH:mm a');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';
    if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' days ago';
      } else {
        time = diff.inDays.toString() + ' days ago';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' days ago';
      } else {

        time = (diff.inDays / 7).floor().toString() + ' days ago';
      }
    }
    return time;
  }
}