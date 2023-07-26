import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oruphones/core/injection/injection.dart';
import 'package:oruphones/core/routes/router.dart';
import 'package:oruphones/features/home/presentation/cubit/home/home_cubit.dart';
import 'package:oruphones/features/search/presentation/cubit/search_cubit.dart';

class OruPhones extends StatefulWidget {
  const OruPhones({super.key});

  @override
  State<OruPhones> createState() => _OruPhonesState();
}

class _OruPhonesState extends State<OruPhones> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (_) => getIt<HomeCubit>(),
          lazy: false,
        ),
        BlocProvider<SearchCubit>(
          create: (context) => getIt<SearchCubit>(),
          lazy: false,
        )
      ],
      child: MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        title: "OruPhones",
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
