import 'package:flutter/material.dart';

var currentPage = DrawerSections.settings;

Widget ListDrawer() {
  return Container(
    padding: EdgeInsets.only(
      top: 15,
    ),
    child: Column(
      children: [
        menuItem(2, "Contacts", Icons.people_alt_outlined,
            currentPage == DrawerSections.contacts ? true : false),
        menuItem(3, "Events", Icons.event,
            currentPage == DrawerSections.events ? true : false),
        menuItem(4, "Notes", Icons.notes,
            currentPage == DrawerSections.notes ? true : false),
        menuItem(5, "Settings", Icons.settings_outlined,
            currentPage == DrawerSections.settings ? true : false),
        menuItem(6, "Notifications", Icons.notifications_outlined,
            currentPage == DrawerSections.notifications ? true : false),
        Divider(),
        menuItem(7, "Privacy Policy", Icons.privacy_tip_outlined,
            currentPage == DrawerSections.privacy_policy ? true : false),
        menuItem(8, "Send feedback", Icons.feed_outlined,
            currentPage == DrawerSections.send_feedback ? true : false),
      ],
    ),
  );
}

Widget menuItem(int id, String title, IconData icon, bool selected) {
  return Material(
    color: selected ? Colors.grey[300] : Colors.transparent,
    child: InkWell(
      onTap: () {
        // setState(()
        // {
        //    if (id == 2) {
        //     currentPage = DrawerSections.contacts;
        //   } else if (id == 3) {
        //     currentPage = DrawerSections.events;
        //   } else if (id == 4) {
        //     currentPage = DrawerSections.notes;
        //   } else if (id == 5) {
        //     currentPage = DrawerSections.settings;
        //   } else if (id == 6) {
        //     currentPage = DrawerSections.notifications;
        //   } else if (id == 7) {
        //     currentPage = DrawerSections.privacy_policy;
        //   } else if (id == 8) {
        //     currentPage = DrawerSections.send_feedback;
        //   }
        // });
        // Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(children: [
          Expanded(
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          ),
          Expanded(
              flex: 3,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ))
        ]),
      ),
    ),
  );
}

enum DrawerSections {
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
