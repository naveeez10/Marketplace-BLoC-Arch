import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:oruphones/features/home/repository/i_home_repository.dart';

import '../../../../../core/models/listing.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repository) : super(HomeState(homeStatus: HomeStatus.intial));
  final IHomeRepository repository;

  List<Listing> _allListings = [];
  int _currentPage = 1;
  int _limit = 20;

  Future<void> getListings() async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    final response = await repository.getListings(_currentPage, _limit);
    response.fold(
      (l) => emit(state.copyWith(homeStatus: HomeStatus.failed)),
      (r) {
        _allListings = r;
        emit(state.copyWith(
            homeStatus: HomeStatus.success, listings: _allListings));
      },
    );
  }

  Future<void> loadMoreListings() async {
    final response = await repository.getListings(_currentPage, _limit);
    response.fold(
      (l) => emit(state.copyWith(homeStatus: HomeStatus.failed)),
      (r) {
        _currentPage++;
        List<Listing> newListings = [];
        newListings.addAll(r);
        emit(state.copyWith(
            listings: List.from(newListings), homeStatus: HomeStatus.success));
      },
    );
  }

  void Refresh() {
    final list = state.listings;
    emit(state.copyWith(listings: list));
  }
}
