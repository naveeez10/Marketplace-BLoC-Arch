import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oruphones/core/routes/router.gr.dart';
import 'package:oruphones/core/widgets/product_card.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../cubit/home/home_cubit.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeCubit cubit = getIt<HomeCubit>();

  @override
  void initState() {
    super.initState();
    getToken();
    setupInteractions();
  }

  void getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (kDebugMode) {
      print('Token: $token');
    }
  }

  void setupInteractions() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      AutoRouter.of(context).push(NotificationsRoute());
    });

    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      AutoRouter.of(context).push(NotificationsRoute());
    });

    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      AutoRouter.of(context).push(NotificationsRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85.0),
        child: CustomAppBar(),
      ),
      body: SafeArea(
        child: BlocProvider<HomeCubit>(
          create: (context) => cubit,
          child: BlocBuilder<HomeCubit, HomeState>(
            bloc: context.read<HomeCubit>()..getListings(),
            builder: (context, state) {
              switch (state.homeStatus) {
                case (HomeStatus.loading):
                  return Center(child: CircularProgressIndicator());
                case HomeStatus.success:
                  return SingleChildScrollView(
                    child: Column(
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
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                        "https://picsum.photos/500/200",
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            childAspectRatio: (164 / 294),
                          ),
                          itemCount: state.listings.length + 1,
                          itemBuilder: (context, index) {
                            if (index >= state.listings.length) {
                              cubit.loadMoreListings();
                              cubit.Refresh();
                              return Center(child: CircularProgressIndicator());
                            } else {
                              print(state.listings.length);
                            }
                            return GridTile(
                              child: ProductCard(
                                product: state.listings[index],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  );
                case HomeStatus.failed:
                  return Center(
                    child: Text("No Listings Found"),
                  );
                default:
                  return SizedBox.shrink();
              }
            },
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
