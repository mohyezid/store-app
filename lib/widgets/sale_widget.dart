import 'package:flutter/material.dart';

class SaleWidget extends StatelessWidget {
  const SaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
              colors: [Color(0xFF7A60A5), Color(0xFF82C3df)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.clamp)),
      child: Row(children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xff9689ce),
                  borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(children: const [
                  Text(
                    'Get The Special Discount',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          '50%\noff',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Image.network(
                  width: double.infinity, "https://i.ibb.co/vwB46Yq/shoes.png"),
            ))
      ]),
    );
  }
}
