import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/body/login_body.dart';
import 'package:tutor_finder_app/services/body/register_body.dart';
import 'package:tutor_finder_app/services/response/register_response.dart';
import 'package:tutor_finder_app/services/response/tutors_response.dart';
import 'package:tutor_finder_app/settings.dart' as settings;
import 'response/login_response.dart';
import 'response/notification_response.dart';
import 'response/posts_response.dart';
part 'api_service.g.dart';
@RestApi(baseUrl:"https://manage-tutor-123.herokuapp.com/api")
abstract class ApiClient{
  factory ApiClient(Dio dio,{String baseUrl})=_ApiClient;
  @POST('/auth/signin')
  Future<LoginResponse> checkLogin(@Body() LoginBody loginBody);
  @POST('/auth/signup')
  Future<RegisterResponse> register(@Body() RegisterBody registerBody);
  @GET('/getPosts')
  Future<PostsResponse> getPosts();
  @GET('/db')
  Future<TutorsResponse> getTutors();
  @GET('/tutor?id={idTutor}')
  Future<Tutor> getTutorById(@Path('idTutor') String id);
  //fake api notifications
  @GET('/db')
  Future<NotificationResponse> getNotifiesById();
}
class Api{
  ApiClient client;
  Api(){
    final Dio dio=Dio();
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    dio.options.sendTimeout = 30000;
    dio.options.baseUrl = settings.BASE_API_URL;
    dio.options.headers['Content-Type'] = 'application/json';
    client=ApiClient(dio,baseUrl: settings.BASE_API_URL);
  }
}