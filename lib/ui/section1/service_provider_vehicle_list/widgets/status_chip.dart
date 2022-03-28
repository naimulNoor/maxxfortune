import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

enum ChipStatus { APPROVED, PENDING, FREE, BUSY }

class StatusChip extends StatelessWidget {
  final ChipStatus chipStatus;

  const StatusChip({required this.chipStatus});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _getColor(chipStatus).withOpacity(0.1),
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(dp50),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: dp20,
          vertical: dp5,
        ),
        child: Text(
          _getTitle(chipStatus),
          style: GoogleFonts.manrope(color: _getColor(chipStatus)),
        ),
      ),
    );
  }

  Color _getColor(ChipStatus status) {
    switch (status) {
      case ChipStatus.APPROVED:
        return approvedChipColor;
      case ChipStatus.PENDING:
        return pendingChipColor;
      case ChipStatus.FREE:
        return freeChipColor;
      case ChipStatus.BUSY:
        return busyChipColor;
      default:
        return accent;
    }
  }

  String _getTitle(ChipStatus status) {
    switch (status) {
      case ChipStatus.APPROVED:
        return "Approved";
      case ChipStatus.PENDING:
        return "Pending";
      case ChipStatus.FREE:
        return "Free";
      case ChipStatus.BUSY:
        return "Busy";
      default:
        return "Undefined";
    }
  }
}
