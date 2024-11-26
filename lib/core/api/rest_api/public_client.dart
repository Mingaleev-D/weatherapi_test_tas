import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weatherapi_test_tas/core/models/weather_response.dart';
part 'public_client.g.dart';

@RestApi()
abstract class PublicClient {
  factory PublicClient(Dio dio) = _PublicClient;

  // @POST(ApiEndpoints.registration)
  // Future<Registration> registerUser(@Body() RegistrationRequest registrationRequest);

  @GET('current.json')
  Future<WeatherResponse> getWeather(
    @Query("q") String query,
  );

  // @POST(ApiEndpoints.googleLogin)
  // Future<Login> googleLogin(@Body() GoogleLogin registrationRequest);
  //
  // 13
  // @GET(ApiEndpoints.getListContent)
  // Future<ListContent> getListContent();
  //
  // //
  // //11
  // @GET(ApiEndpoints.getPostsContent)
  // Future<PostsList> getPostsList();
  //
  // //
  // //14
  // @GET(ApiEndpoints.getListDetails)
  // Future<ListDetails> getListContentDetails(@Path('id') int id);
}
