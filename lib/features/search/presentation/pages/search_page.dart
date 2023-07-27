import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oruphones/core/injection/injection.dart';
import 'package:oruphones/features/search/presentation/cubit/search_cubit.dart';

import '../../../../core/routes/router.gr.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchCubit _cubit = getIt<SearchCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocProvider<SearchCubit>(
          create: (context) => _cubit,
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    color: Colors.black,
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0)
                              .copyWith(top: 8),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.0),
                                child: Icon(
                                  Icons.format_align_center,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  "ORU PHONES",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Ahmedabad",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.0),
                                child: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        // const Spacer(),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          // padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            onTap: () {
                              if (AutoRouter.of(context).current.name !=
                                  SearchRoute.name) {
                                AutoRouter.of(context).push(SearchRoute());
                              }
                            },
                            onChanged: (value) => _cubit.searchListings(value),
                            decoration: InputDecoration(
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Icon(
                                    Icons.search,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Search and make models",
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(bottom: 6)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      return state.maybeMap(
                          orElse: SizedBox.shrink,
                          loading: (value) =>
                              Center(child: CircularProgressIndicator()),
                          failed: (value) => Center(
                                  child: Text(
                                "No results found",
                                style: TextStyle(color: Colors.black),
                              )),
                          success: (value) {
                            if (value.searchResults['models']!.isEmpty &&
                                value.searchResults['makes']!.isEmpty) {
                              return Center(
                                  child: Text(
                                "No results found",
                                style: TextStyle(color: Colors.black),
                              ));
                            }
                            return Column(
                              children: [
                                ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  separatorBuilder: (context, index) => Divider(
                                    color: Colors.grey[300],
                                  ),
                                  itemCount:
                                      value.searchResults['makes']!.length,
                                  itemBuilder: (context, index) => Container(
                                    color: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (index == 0) ...[
                                            Text(
                                              "Brands",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                          Text(
                                            value
                                                .searchResults['makes']![index],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  separatorBuilder: (context, index) => Divider(
                                    color: Colors.grey[300],
                                  ),
                                  itemCount:
                                      value.searchResults['models']!.length,
                                  itemBuilder: (context, index) => Container(
                                    color: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (index == 0) ...[
                                            Text(
                                              "Mobile Models",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                          Text(
                                            value.searchResults['models']![
                                                index],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
