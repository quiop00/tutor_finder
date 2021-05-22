import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/body/post_body.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/posts_response.dart';

class PostManagementVM extends BaseViewModel {
  final _api = locator<Api>();
  PostsResponse posts = PostsResponse();
  getPostByStudent() async {
    setBusy(true);
    await _api.client.getPostsByStudent().then((value) {
      posts = value;
      print(posts.posts[0].toJson());
    }).catchError((onError) {});
    setBusy(false);
    notifyListeners();
  }
}
