import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/listing.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.product});
  final Listing product;

  final formatter = NumberFormat("##,###", "en_US");

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      padding: EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: CachedNetworkImageProvider(
                product.images[0].fullImage,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            "₹ " + formatter.format(product.listingNumPrice),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            product.marketingName,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Text(
                product.deviceStorage,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              const Spacer(),
              Text(
                "Condition: " + product.deviceCondition,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Text(
                product.listingLocation,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              const Spacer(),
              Text(
                DateFormat("MMMM d").format(
                    DateFormat('dd/MM/yyyy').parse(product.listingDate)),
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
