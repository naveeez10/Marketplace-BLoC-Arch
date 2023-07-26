import 'package:dartz/dartz.dart';
import 'package:oruphones/features/home/repository/i_home_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../core/models/errors/failures.dart';
import '../../../core/models/listing.dart';

@LazySingleton(as: IHomeRepository)
class HomeRepository extends IHomeRepository {
  HomeRepository(this._dio, this._logger);
  final Dio _dio;
  final Logger _logger;

  @override
  Future<Either<Failure, List<Listing>>> getListings() async {
    try {
      final response = await _dio.get('/getListings', queryParameters: {
        'page': 2,
        'limit': 10,
      });
      final List<dynamic> listingsData = response.data['listings'];
      final List<Listing> listings = listingsData
          .map<Listing>((listingData) =>
              Listing.fromMap(listingData as Map<String, dynamic>))
          .toList();

      _logger.d('Fetched listings data: $response');

      return Right(listings);
    } catch (e) {
      _logger.e(e);
      return const Left(Failure.server());
    }
  }
}
