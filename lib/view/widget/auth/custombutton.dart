import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final Color? color;
  final void Function()? onBressed;

  const CustomButtonAuth(
      {super.key, required this.text, required this.color, required this.onBressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.all(5),
      child: MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        color: color,
        onPressed: onBressed,
        //color: AppColor.secondColor,
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}


/* 
  
  Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.blueAccent,
        textColor: Colors.white,
        onPressed: onBressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
   
 */
