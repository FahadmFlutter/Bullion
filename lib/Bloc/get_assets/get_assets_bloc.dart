import 'package:bullion/Repository/API/get_assets_api.dart';
import 'package:bullion/Repository/Models/get_assets_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_assets_event.dart';
part 'get_assets_state.dart';

class GetAssetsBloc extends Bloc<GetAssetsEvent, GetAssetsState> {
  GetAssetsApi getAssetsApi = GetAssetsApi();
  late GetAssetsList getAssetsList;

  GetAssetsBloc() : super(GetAssetsInitial()) {
    on<FetchGetAssets>((event, emit) async {
      emit(GetAssetsLoading());
      try {
        getAssetsList = await getAssetsApi.getGetAssets();
        emit(GetAssetsLoaded());
      } catch (e) {
        print(e);
        emit(GetAssetsError());
      }
    });
  }
}