import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/injection/injection.dart';
import '../cubit/home/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeCubit cubit = getIt<HomeCubit>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider<HomeCubit>(
      create: (context) => cubit,
      child: BlocBuilder<HomeCubit, HomeState>(
        bloc: context.read<HomeCubit>()..getListings(),
        builder: (context, state) {
          return state.maybeMap(
              orElse: SizedBox.shrink,
              loading: (value) => const Center(
                    child: CircularProgressIndicator(),
                  ),
              failed: (value) => const Center(child: Text("Failed")),
              success: (value) => const Center(
                    child: Text("Fetched Data"),
                  ));
        },
      ),
    ));
  }
}
