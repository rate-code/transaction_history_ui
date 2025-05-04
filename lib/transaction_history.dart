import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final Color primaryColor = Colors.black;
  final Color secondaryColor = Colors.grey;
  final Color purpleColor = Color(0xFFE093FF);
  final Color lightBlackColor = Color(0xFF202020);
  final Color lightBlueColor = Color(0xFFADCCE7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Container(
                width: 100.w,
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Text(
                  "Transactions",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Tab Selector
              Container(
                padding: EdgeInsets.all(1.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    tabButton("All", false),
                    tabButton("Spendings", true),
                    tabButton("Income", false),
                  ],
                ),
              ),
              SizedBox(height: 2.h),

              // Month selector
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ["January", "March", "April", "May", "June"]
                      .map(
                        (month) => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 1.5.w),
                          decoration: BoxDecoration(
                            color: month == "June"
                                ? Colors.black
                                : Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.w),
                            ),
                          ),
                          child: Text(
                            month,
                            style: TextStyle(
                              fontWeight: month == "June"
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 16.sp,
                              color:
                                  month == "June" ? Colors.white : primaryColor,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(height: 1.h),

              // Total balance
              Text(
                "\$12,654.80",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 1.5.w,
                    width: 35.w,
                    decoration: BoxDecoration(
                      color: Color(0xFFFAB09E),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.5.w),
                        bottomLeft: Radius.circular(2.5.w),
                      ),
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Container(
                    height: 1.5.w,
                    width: 20.w,
                    decoration: BoxDecoration(
                      color: Color(0xFFACC7FB),
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Container(
                    height: 1.5.w,
                    width: 10.w,
                    decoration: BoxDecoration(
                      color: Color(0xFFD0E880),
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Container(
                    height: 1.5.w,
                    width: 7.w,
                    decoration: BoxDecoration(
                      color: Color(0xFFAAC7FE),
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Container(
                    height: 1.5.w,
                    width: 6.w,
                    decoration: BoxDecoration(
                      color: purpleColor,
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Container(
                    height: 1.5.w,
                    width: 5.w,
                    decoration: BoxDecoration(
                      color: Color(0xFFC8C9C6),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(2.5.w),
                        bottomRight: Radius.circular(2.5.w),
                      ),
                    ),
                  ),
                  SizedBox(width: 1.w),
                ],
              ),
              SizedBox(height: 1.h),
              Divider(color: secondaryColor.withValues(alpha: 0.5)),
              SizedBox(height: 2.h),

              // Transaction list
              Expanded(
                child: ListView(
                  children: [
                    transactionGroup(
                      "Today",
                      [
                        transactionTile(
                          "Nick Johnson",
                          "+ \$250.00",
                          bgColor: lightBlueColor,
                          secondaryIcon: Icons.add,
                        ),
                        transactionTile(
                          "Apple",
                          "- \$16.99",
                          icon: Icons.apple,
                        ),
                        transactionTile(
                          "Uber",
                          "- \$50.00",
                          bgColor: lightBlackColor,
                        ),
                        transactionTile(
                          "Transfer to Anna King",
                          "- \$230.00",
                          bgColor: purpleColor,
                          secondaryIcon: Icons.upload,
                        ),
                      ],
                    ),
                    transactionGroup(
                      "Yesterday",
                      [
                        transactionTile(
                          "Netflix subscription",
                          "- \$12.99",
                          icon: Icons.movie,
                        ),
                        transactionTile(
                          "Transfer to Royal Dada",
                          "- \$230.00",
                          bgColor: purpleColor,
                          secondaryIcon: Icons.upload,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: primaryColor,
        unselectedItemColor: secondaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
            ),
            label: "Invest",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                Icons.compare_arrows,
                color: Colors.white,
              ),
            ),
            label: "Transfers",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.currency_bitcoin,
            ),
            label: "Crypto",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_view,
            ),
            label: "Manage",
          ),
        ],
      ),
    );
  }

  Widget tabButton(String label, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.5.w, horizontal: 5.w),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.black : Colors.grey,
          fontSize: 16.sp,
          fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget transactionGroup(String title, List<Widget> transactions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 1.h),
        ...transactions,
        SizedBox(height: 2.h),
      ],
    );
  }

  String getInitials(String name) {
    List<String> words = name.trim().split(" ");

    if (words.isEmpty) return "";

    String initials = "";

    for (int i = 0; i < words.length && i < 2; i++) {
      if (words[i].isNotEmpty) {
        initials += words[i][0].toUpperCase();
      }
    }

    return initials;
  }

  Widget transactionTile(
    String title,
    String amount, {
    IconData? icon,
    Color? bgColor = Colors.black,
    IconData? secondaryIcon,
    IconData? doubleIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      icon != null
                          ? Container(
                              padding: EdgeInsets.all(2.5.w),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: secondaryColor),
                              ),
                              child: Icon(
                                icon,
                                color: Colors.black,
                                size: 20.sp,
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.all(2.5.w),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: bgColor,
                              ),
                              child: Center(
                                child: Text(
                                  getInitials(title),
                                  style: TextStyle(
                                    color: bgColor == lightBlackColor ||
                                            bgColor == Colors.black
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                      secondaryIcon != null
                          ? Positioned(
                              bottom: -5,
                              right: -5,
                              child: SizedBox(
                                child: Container(
                                  padding: EdgeInsets.all(1.5.w),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      secondaryIcon,
                                      color: Colors.white,
                                      size: 13.sp,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
                SizedBox(width: 2.5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text("18:19"),
                  ],
                )
              ],
            ),
            Text(
              amount,
              style: TextStyle(
                color: primaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        SizedBox(height: 5.w),
      ],
    );
  }
}
