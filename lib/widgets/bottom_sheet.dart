import 'package:flutter/material.dart';

class BottomSheetMenu {
  final Column content;

  BottomSheetMenu(this.content);

  void showModalBottom(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
          ),
        ),
        builder: (context) {
          return Container(
            child: Container(
              padding: EdgeInsets.all(20),
              child: content,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ),
              ),
            ),
          );
        });
  }

  void showModalBottomVoid(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
          ),
        ),
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 30 / 100,
            child: Container(
              padding: EdgeInsets.all(20),
              child: content,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ),
              ),
            ),
          );
        });
  }
  void showModalBottomCustom(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
          ),
        ),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                color: Colors.transparent,
                child: Wrap(
                  children: <Widget>[content],
                )),
          );
        });
  }

  void showDragAbbleBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 1,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
          ),
        ),
        builder: (context) {
          return DraggableScrollableSheet(
            maxChildSize: 1,
            initialChildSize: 0.5,
            minChildSize: 0.5,
            expand: false,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  color: Colors.transparent,
                  child: Wrap(
                    children: <Widget>[
                      content
                    ],
                  ),
                ),
              );
            },
          );
        }
    );
  }
}
