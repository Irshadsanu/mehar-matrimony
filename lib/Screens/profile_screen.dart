import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../Providers/main_provider.dart';
import 'Matches_screen.dart';

class Main_screen extends StatelessWidget {
  const Main_screen({super.key});

  @override
  Widget build(BuildContext context) {
    MainProvider donationProvider =
    Provider.of<MainProvider>(context, listen: false);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 2,
          backgroundColor: Colors.white,
          bottom: const TabBar(
            // onTap: (value) {
            //   print(value.toString() + "999999999".toString());
            //   donationProvider.ISClicked(value);
            //   donationProvider.valuee = value;
            //   // donationProvider.valuee = donationProvider.ButtonIndex;
            //   // print(donationProvider.ButtonIndex);
            // },
            indicatorColor: Colors.pink,
            labelColor: Colors.pink,
            unselectedLabelColor: Colors.black,
            tabs: [
              Text(
                "MATCHES",
                style: TextStyle(fontSize: 12),
              ),
              Text("NEW MATCHES", style: TextStyle(fontSize: 12)),
              Text("NEAR ME", style: TextStyle(fontSize: 12)),
              Text("SHORT LISTED", style: TextStyle(fontSize: 12))
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            matches_page(),
          ],
        ),
      ),
    );
    ;
  }
}