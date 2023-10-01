import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:transparent_image/transparent_image.dart';

class UnitItemCard extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final String? yearManufactured;
  final String? brands;
  final int? pricePerDay;
  final double? rating;

  const UnitItemCard({
    super.key,
    this.brands,
    this.imageUrl,
    this.name,
    this.pricePerDay,
    this.rating,
    this.yearManufactured,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff0E0F0E)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(imageUrl!),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xff0E0F0E),
                      ),
                    ),
                    Text(
                      '$brands - $yearManufactured',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xff0E0F0E),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      FeatherIcons.star,
                      size: 12,
                    ),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff0E0F0E),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Per Day',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Color(0xff0E0F0E),
                  ),
                ),
                Text(
                  'Rp$pricePerDay',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0E0F0E),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 36),
                        backgroundColor: const Color(0xff0E0F0E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        )),
                    child: const Text(
                      'Book Now',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffF1F1F1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(36, 36),
                      backgroundColor: const Color(0xffF1F1F1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    icon: const Center(
                      child: Icon(
                        FeatherIcons.heart,
                        size: 16,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
