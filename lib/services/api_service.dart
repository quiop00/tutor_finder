import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/body/login_body.dart';
import 'package:tutor_finder_app/services/body/register_body.dart';
import 'package:tutor_finder_app/services/body/tutor_body.dart';
import 'package:tutor_finder_app/services/response/add_post_response.dart';
import 'package:tutor_finder_app/services/response/register_response.dart';
import 'package:tutor_finder_app/services/response/tutor_response.dart';
import 'package:tutor_finder_app/services/response/tutors_response.dart';
import 'package:tutor_finder_app/settings.dart' as settings;
import 'body/post_body.dart';
import 'body/user_body.dart';
import 'local_storage_service.dart';
import 'response/login_response.dart';
import 'response/notification_response.dart';
import 'response/posts_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: "https://manage-tutor-123.herokuapp.com")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  @POST('/api/auth/signin')
  Future<LoginResponse> checkLogin(@Body() LoginBody loginBody);
  @POST('/api/auth/signup')
  Future<RegisterResponse> register(@Body() RegisterBody registerBody);
  @POST('/api/post')
  Future<AddPostResponse> post(@Body() PostBody postBody);
  @GET('/api/post')
  Future<PostsResponse> getPosts();
  @GET('/tutor')
  Future<TutorsResponse> getTutors();
  @GET('/api/tutor/profile')
  Future<TutorResponse> getTutorProfile();
  @PUT('/api/tutor')
  Future<void> updateTutor(@Body() TutorBody tutorBody);
  @GET('/api/user/profile')
  Future<UserBody> getUserProfile();
  @PUT('/api/user')
  Future<void> updateUser(@Body() UserBody userBody);
  @POST('/api/invitation/{id}')
  Future<void> invite(@Path() int id);
  @PUT('/api/invitation/acceptance')
  Future<void> acceptInvitation(@Body() Map<String, dynamic> data);
  @PUT('/api/invitation/denial')
  Future<void> denyInvitation(@Body() Map<String, dynamic> data);
  @POST('/api/comment')
  Future<void> comment(@Body() Map<String, dynamic> comment);
  @GET('/api/user/{id}')
  Future<UserBody> getUserById(@Path() int id);
  @GET('/api/tutor/{id}')
  Future<TutorResponse> getTutorById(@Path() int id);
  @POST('/api/suggestion')
  Future<void> addSuggestion(
      @Query('idStudent') int idStudent, @Query('idPost') int idPost);
  @PUT('/api/suggestion/acceptance')
  Future<void> acceptSuggestion(
      @Query('idPost') int idPost, @Query('idTutor') int idTutor);
  @PUT('/api/suggestion/denial')
  Future<void> denySuggestion(
      @Query('idPost') int idPost, @Query('idTutor') int idTutor);
  @PUT('/api/post/{idPost}')
  Future<void> updatePost(@Path() int idPost, @Body() PostBody postBody);
  @DELETE('/api/post/{id}')
  Future<void> deletePost(@Path() int idPost);
}

class Api {
  ApiClient client;
  Api() {
    final Dio dio = Dio();
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    dio.options.sendTimeout = 30000;
    dio.options.baseUrl = settings.BASE_API_URL;
    dio.options.headers['Content-Type'] = 'application/json';
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options) {
        final token = PreferenceUtils.getString('token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        } else
          options.headers['Authorization'] = 'Bearer';
        return options;
      },
    ));
    client = ApiClient(dio, baseUrl: settings.BASE_API_URL);
  }
}
