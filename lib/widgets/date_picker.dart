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
  var selectedDate = DateTime(2015, 7, 28);

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
    return Utils.getFormattedDate(selectedDate);
  }

  _showDatePicker() async {
    final date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2014),
        lastDate: DateTime.now());
    if (date != null) {
      selectedDate = date;
      setState(() {});
      widget.onDateSelected(date);
    }
  }
}
