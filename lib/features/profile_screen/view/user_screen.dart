import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int currentIndex = 2;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Padding(
      //     padding: EdgeInsets.only(bottom: 33.0),
      //     child: Text(
      //       'Wash Alafas',
      //       style: TextStyle(
      //         fontSize: 25,
      //         color: const Color.fromARGB(255, 12, 88, 68),
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   automaticallyImplyLeading: false,
      // ),
      extendBodyBehindAppBar: true,
     
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                // color background of the profile screen ==>
                // gradient: LinearGradient(
                //   colors: [
                //     Color.fromARGB(255, 255, 255, 255),
                //     Color.fromARGB(255, 164, 240, 213),
                //     Color.fromARGB(255, 255, 227, 176),
                //     Color.fromARGB(255, 233, 228, 161),
                //     Color.fromARGB(255, 255, 255, 255),
                //   ],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                // ),
              ),

              child: Center(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 80),
                      padding: EdgeInsets.fromLTRB(20, 70, 20, 20),
                      width: 320,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 230, 228, 228),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          /// account name
                          Text(
                            "account name",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightGreen,
                            ),
                          ),

                          SizedBox(height: 6),

                          /// email
                          Text(
                            "useremail@gmail.com",
                            style: TextStyle(color: Colors.black54),
                          ),

                          SizedBox(height: 12),

                          /// info
                          Text(
                            "Member since (the year) / account type",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///  PROFILE IMAGE
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Stack(
                        children: [
                          CircleAvatar(radius: 55),

                          /// edit button
                          Positioned(
                            bottom: 0,
                            right: 0,

                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.green,

                                borderRadius: BorderRadius.all(
                                  Radius.circular(80),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditProfileScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Column(
              children: [
                //
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      Text(
                        'Account settings',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                //container for account settings
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 228, 228),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        // my order
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/myorder.svg',
                            height: 24,
                            width: 24,
                          ),
                          title: const Text(' My Order '),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Myorder(),
                              ),
                            );
                          },
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/add.svg',
                            height: 24,
                            width: 24,
                          ),
                          title: const Text('Address'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdressScreen(),
                              ),
                            );
                          },
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/payment.svg',
                            height: 10,
                            width: 14,
                          ),
                          title: const Text('Payment Methods'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentScreen(),
                              ),
                            );
                          },
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/notification.svg',
                            height: 24,
                            width: 24,
                          ),
                          title: const Text('Notifications'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Natifiation(),
                              ),
                            );
                          },
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/setting.svg',
                            height: 24,
                            width: 24,
                          ),
                          title: const Text('Settings'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingScreen(),
                              ),
                            );
                          },
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            //container for log out
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 228, 228),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/icons/logout.svg',
                        height: 24,
                        width: 24,
                      ),
                      title: const Text(
                        'Log out',
                        style: TextStyle(color: Colors.red),
                      ),
                      onTap: () {},
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
