import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../theme/theme.dart';
import '../../../widgets/actions/bla_button.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
    if (widget.initRidePref != null) {
      final ridePre = widget.initRidePref!;
      departure = ridePre.departure;
      arrival = ridePre.arrival;
      departureDate = ridePre.departureDate;
      requestedSeats = ridePre.requestedSeats;
    } else {
      departure = null;
      arrival = null;
      departureDate = DateTime.now();
      requestedSeats = 1;
    }
  }

  Widget _buildFormRow({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    bool showTrailing = false,
    IconData? trailingIcon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: BlaSpacings.m),
            child: Row(
              children: [
                Icon(icon, color: BlaColors.iconLight),
                SizedBox(width: BlaSpacings.s),

                Expanded(
                  child: Text(
                    text,
                    style: BlaTextStyles.body.copyWith(
                      color: BlaColors.textNormal,
                    ),
                  ),
                ),

                if (showTrailing && trailingIcon != null)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        final oldDeparture = departure;
                        departure = arrival;
                        arrival = oldDeparture;
                      });
                    },
                    icon: Icon(trailingIcon, color: BlaColors.primary),
                  ),
              ],
            ),
          ),
          Divider(height: 1),
        ],
      ),
    );
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildFormRow(
          icon: Icons.location_on_outlined,
          text: departure?.name ?? 'Select Departure',
          onTap: () {},
          showTrailing: true,
          trailingIcon: Icons.swap_vert,
        ),

        _buildFormRow(
          icon: Icons.location_on_outlined,
          text: arrival?.name ?? 'Select Arrival',
          onTap: () {},
        ),

        _buildFormRow(
          icon: Icons.date_range_outlined,
          text: DateFormat('EEE d MMM').format(departureDate),
          onTap: () {},
        ),

        _buildFormRow(
          icon: Icons.person,
          text: requestedSeats.toString(),
          onTap: () {},
        ),

        SizedBox(height: BlaSpacings.l),

        BlaButton(text: 'Search', onTap: () {}),
      ],
    );
  }
}
