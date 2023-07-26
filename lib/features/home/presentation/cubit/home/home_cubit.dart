import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:oruphones/features/home/repository/i_home_repository.dart';

import '../../../../../core/models/listing.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repository) : super(const HomeState.initial());
  final IHomeRepository repository;

  Future<void> getListings() async {
    emit(const HomeState.loading());
    final response = await repository.getListings();
    response.fold((l) => emit(const HomeState.failed()),
        (r) => emit(HomeState.success(r)));
  }
}
