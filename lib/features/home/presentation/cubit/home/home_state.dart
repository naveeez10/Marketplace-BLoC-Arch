part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.intial) HomeStatus homeStatus,
    @Default([]) List<Listing> listings,
  }) = _HomeState;
}

enum HomeStatus {
  intial,
  loading,
  failed,
  success,
}
