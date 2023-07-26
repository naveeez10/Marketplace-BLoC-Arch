import 'package:dartz/dartz.dart';

import '../../../core/models/errors/failures.dart';
import '../../../core/models/listing.dart';

abstract class IHomeRepository {
  Future<Either<Failure, List<Listing>>> getListings(
    int page,
    int limit,
  );
  Future<Either<Failure, List<dynamic>>> searchListings(
    String searchTerm,
  );
}
