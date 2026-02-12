import 'package:flutter/material.dart';
import '../../../model/ride/locations.dart';
import '../../../dummy_data/dummy_data.dart';
import '../../theme/theme.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<Location> allLocations = fakeLocations;
  String search = '';

  final TextEditingController controller = TextEditingController();

  void _onSearch(String value) {
    setState(() {
      search = value;
      allLocations = fakeLocations
          .where(
            (location) =>
                location.name.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    });
  }

  void _clearSearch() {
    controller.clear();
    _onSearch('');
  }

  void _selectLocation(Location location) {
    Navigator.pop(context, location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: BlaColors.iconLight),
                    onPressed: () => Navigator.pop(context),
                  ),

                  Expanded(
                    child: TextField(
                      controller: controller,
                      onChanged: _onSearch,
                      decoration: InputDecoration(
                        hintText: "Search Location",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: BlaColors.textNormal),
                      ),
                    ),
                  ),

                  if (search.isNotEmpty)
                    IconButton(
                      icon: Icon(Icons.close, color: BlaColors.iconLight),
                      onPressed: _clearSearch,
                    ),
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView.separated(
              itemCount: allLocations.length,
              separatorBuilder: (context, index) =>
                  Divider(height: 1, color: Colors.grey.shade300),
              itemBuilder: (context, index) {
                final location = allLocations[index];

                return InkWell(
                  onTap: () => _selectLocation(location),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        SizedBox(width: 36),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                location.name,
                                style: BlaTextStyles.body.copyWith(
                                  color: BlaColors.textNormal,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                location.country.name,
                                style: BlaTextStyles.label.copyWith(
                                  color: BlaColors.textLight,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Icon(Icons.chevron_right, color: BlaColors.iconLight),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
