part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.failed() = _Failed;
  const factory SearchState.success(
    List<dynamic> searchResults,
  ) = _Success;
}
