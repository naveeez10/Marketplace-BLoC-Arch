// search_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:oruphones/features/home/repository/i_home_repository.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.repository) : super(SearchState.initial());
  final IHomeRepository repository;

  Future<void> searchListings(String searchTerm) async {
    emit(SearchState.loading());
    final response = await repository.searchListings(searchTerm);
    response.fold(
      (l) => emit(SearchState.failed()),
      (r) => emit(SearchState.success(r)),
    );
  }
}
