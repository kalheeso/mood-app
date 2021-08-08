import 'package:dio/dio.dart';
import 'package:mood_app/models/Mood.dart';
import 'package:mood_app/models/User.dart';
import 'package:mood_app/util/Return.dart';
import 'package:retrofit/retrofit.dart';

part 'MoodAppService.g.dart';

@RestApi(baseUrl: "https://us-central1-meu-blog-curso.cloudfunctions.net")
abstract class MoodAppService {
  factory MoodAppService(Dio dio, {String baseUrl}) = _MoodAppService;

  @POST("/usersMatheus/loginUser")
  Future<UserReturn> loginUser(@Body() User user);

  @POST("/usersMatheus/registerUser")
  Future<UserReturn> registerUser(@Body() User user);

  @POST("/usersMatheus/editUser")
  Future<UserReturn> editUser(@Body() User user);

  @GET("/moodsMatheus/readSingleMood")
  Future<MoodReturn> readSingleMood(@Query("id") String id);

  @DELETE("/moodsMatheus/deleteMood")
  Future<String> deleteMood(@Query("id") String id);

  @GET("/moodsMatheus/listMoods")
  Future<ListMoodsReturn> listMoods(@Query("idCreator") String idCreator);

  @POST("/moodsMatheus/postEditMood")
  Future<MoodReturn> postEditMood(@Body() Mood mood);
}
