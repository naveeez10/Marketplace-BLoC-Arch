import 'package:freezed_annotation/freezed_annotation.dart';

part 'listing.freezed.dart';

@freezed
class Listing with _$Listing {
  factory Listing({
    required String id,
    required String deviceCondition,
    required String listedBy,
    required String deviceStorage,
    required List<ImageInfo> images,
    required DefaultImageInfo defaultImage,
    required String listingLocation,
    required String make,
    required String marketingName,
    required String mobileNumber,
    required String model,
    required bool verified,
    required String status,
    required String listingDate,
    required String deviceRam,
    required String createdAt,
    required String listingId,
    required int listingNumPrice,
    required String listingState,
  }) = _Listing;

  factory Listing.fromMap(Map<String, dynamic> map) {
    final List<dynamic> imagesData = map['images'];
    final List<ImageInfo> images =
        imagesData.map((imageData) => ImageInfo.fromMap(imageData)).toList();

    final Map<String, dynamic> defaultImageData = map['defaultImage'];
    final DefaultImageInfo defaultImage =
        DefaultImageInfo.fromMap(defaultImageData);

    return Listing(
      id: map['_id'],
      deviceCondition: map['deviceCondition'],
      listedBy: map['listedBy'],
      deviceStorage: map['deviceStorage'],
      images: images,
      defaultImage: defaultImage,
      listingLocation: map['listingLocation'],
      make: map['make'],
      marketingName: map['marketingName'],
      mobileNumber: map['mobileNumber'],
      model: map['model'],
      verified: map['verified'],
      status: map['status'],
      listingDate: map['listingDate'],
      deviceRam: map['deviceRam'],
      createdAt: map['createdAt'],
      listingId: map['listingId'],
      listingNumPrice: map['listingNumPrice'],
      listingState: map['listingState'],
    );
  }
}

@freezed
class ImageInfo with _$ImageInfo {
  factory ImageInfo({required String fullImage}) = _ImageInfo;

  factory ImageInfo.fromMap(Map<String, dynamic> map) =>
      ImageInfo(fullImage: map['fullImage']);
}

@freezed
class DefaultImageInfo with _$DefaultImageInfo {
  factory DefaultImageInfo({required String fullImage}) = _DefaultImageInfo;

  factory DefaultImageInfo.fromMap(Map<String, dynamic> map) =>
      DefaultImageInfo(fullImage: map['fullImage']);
}
