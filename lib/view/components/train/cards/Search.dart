import 'package:app/view/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search>
{

  DateTime? selectedDate = DateTime.now();
  bool dateSelected =  false;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              onSurface: context.onSurface,
              primary: context.onSurface,
              surface: context.primary,
            ),

            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: context.onSurface, // button text color
              ),
            ),
          ),

          child: child!,
        );
      },


    );

    setState(() {
      if(pickedDate != null)selectedDate = pickedDate;
    });
  }


  @override
  Widget build(BuildContext context)
  {

    return Container(
      height: 48,
      width: double.infinity,
      alignment: Alignment.center,

      padding: EdgeInsets.fromLTRB(20, 0, 6, 0),

      decoration: ShapeDecoration(
        color: context.primary,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          smoothness: 0.6,
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                hintText: "Enter Train Name/No",
                hintStyle: context.labelMedium?.copyWith(
                  color: context.onSurface.withValues(alpha: 0.5),
                ),
                border: InputBorder.none,
              ),

              onSubmitted: (String data) {
                SearchSubmitNotifier(data: data).dispatch(context);
              },
            ),
          ),

          //date selector
          InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: ()
            {
              _selectDate();
            },
            child: Container(
              width: 100,
              height: 36,
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: context.secondary,
                shape: SmoothRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                  smoothness: 0.6,
                ),
              ),
              child: Text("Date"),
            ),
          )
        ],
      ),
    );
  }

}

class SearchSubmitNotifier extends Notification {
  final String data;

  const SearchSubmitNotifier({required this.data});
}
