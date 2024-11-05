import 'dart:convert';
import 'package:bullion/Repository/Models/get_assets_model.dart';
import 'package:http/http.dart';
import 'api_client.dart';

class GetAssetsApi {
  ApiClient apiClient = ApiClient();

  Future<GetAssetsList> getGetAssets() async {
    String path = 'http://178.18.254.224:3210/api/v1/assets';
    Response response = await apiClient.invokeAPI(path, 'GET', {});
    List<dynamic> jsonList = jsonDecode(response.body);
    return GetAssetsList.fromJson(jsonList);
  }
}