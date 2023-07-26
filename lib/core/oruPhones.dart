import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oruphones/core/injection/injection.dart';
import 'package:oruphones/core/widgets/custom_app_bar.dart';
import 'package:oruphones/features/home/presentation/cubit/home/home_cubit.dart';

import '../features/home/presentation/pages/home_page.dart';

class OruPhones extends StatefulWidget {
  const OruPhones({super.key});

  @override
  State<OruPhones> createState() => _OruPhonesState();
}

class _OruPhonesState extends State<OruPhones> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OruPhones",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(85.0),
          child: CustomAppBar(),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<HomeCubit>(
              create: (_) => getIt<HomeCubit>(),
              lazy: false,
            ),
          ],
          child: const HomePage(),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
