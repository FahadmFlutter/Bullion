part of 'get_assets_bloc.dart';

abstract class GetAssetsState {}

final class GetAssetsInitial extends GetAssetsState {}

class GetAssetsLoaded extends GetAssetsState {}
class GetAssetsLoading extends GetAssetsState {}
class GetAssetsError extends GetAssetsState {}