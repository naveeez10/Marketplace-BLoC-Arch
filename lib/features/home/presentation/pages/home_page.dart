import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
              success: (value) => Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(height: 200.0),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: DecorationImage(
                                    fit: BoxFit
                                        .cover, // You can use BoxFit.fill or other properties based on your need
                                    image: CachedNetworkImageProvider(
                                      "https://picsum.photos/500/200",
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      )
                    ],
                  ));
        },
      ),
    ));
  }
}
