import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './../bloc/bloc.dart';

// ignore: must_be_immutable
class NewsCategoryButton extends StatefulWidget {
  Function onClicked;
  String category = "";
  String country = "";
  int buttonID;
  bool isSelected;

  NewsCategoryButton({
    Key? key,
    required this.onClicked,
    required this.isSelected,
    required this.category,
    required this.country,
    required this.buttonID
  }) : super(key: key);

  @override
  State<NewsCategoryButton> createState() => _NewsCategoryButtonState();
}

class _NewsCategoryButtonState extends State<NewsCategoryButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.007),
      child: BlocProvider(
        create: (context) => NewsBloc(),
        child: ElevatedButton(
          onPressed: () {
            GetArticlesEvent eventWithCategory = GetArticlesEvent(
              categoryName: widget.category,
              countryName: widget.country
            );
            if (BlocProvider.of<NewsBloc>(context).state is! NewsLoadingState) {
              BlocProvider.of<NewsBloc>(context).add(eventWithCategory);
            }
            widget.onClicked(widget.category, widget.buttonID);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.isSelected ?
                Colors.orange.shade700
                : Colors.orange.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width * 0.1),
            ),
          ),
          child: Text(widget.category),
        ),
      ),
    );
  }
}


