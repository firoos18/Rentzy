import 'package:flutter/material.dart';
import 'package:rentzy_rpl/motorcycle_detail/presentation/components/available_date_section.dart';
import 'package:rentzy_rpl/motorcycle_detail/presentation/components/unit_specifications_card.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/entities/units_entity.dart';

class MotorcycleDetailScreen extends StatelessWidget {
  final UnitsEntity unitsEntity;

  const MotorcycleDetailScreen({super.key, required this.unitsEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                unitsEntity.imageUrl!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      unitsEntity.name!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Color(0xff0E0F0E),
                      ),
                    ),
                    Text(
                      '${unitsEntity.brands} - ${unitsEntity.yearManufactured}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w100,
                        color: Color(0xff0E0F0E),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Specifications',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: UnitSpecificationsCard(
                            category: 'Engine Capacity',
                            specifications: '599cm3',
                          ),
                        ),
                        SizedBox(width: 8),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: UnitSpecificationsCard(
                            category: 'Engine Capacity',
                            specifications: '599cm3',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: UnitSpecificationsCard(
                            category: 'Engine Capacity',
                            specifications: '599cm3',
                          ),
                        ),
                        SizedBox(width: 8),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: UnitSpecificationsCard(
                            category: 'Engine Capacity',
                            specifications: '599cm3',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Available Date',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    const AvailableDateSection(),
                    const SizedBox(height: 24),
                    const Text(
                      'Reviews',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
