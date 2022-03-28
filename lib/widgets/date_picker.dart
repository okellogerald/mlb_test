import 'package:mlb_test1/utils/utils.dart';
import 'package:mlb_test1/widgets/app_material_button.dart';
import '../source.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key, required this.onDateSelected}) : super(key: key);

  final void Function(DateTime) onDateSelected;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    final formattedDate = _getFormattedDate();
    return AppMaterialButton(
        onPressed: _showDatePicker,
        width: 110.dw,
        isFilled: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.calendar_today),
            Text(formattedDate ?? 'Select Date',
                style: TextStyle(color: AppColors.onPrimary, fontSize: 16.dw))
          ],
        ));
  }

  String? _getFormattedDate() {
    if (selectedDate == null) return null;
    return Utils.getFormattedDate(selectedDate!);
  }

  _showDatePicker() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime.now());
    if (selectedDate != null) {
      widget.onDateSelected(selectedDate);
    }
  }
}
