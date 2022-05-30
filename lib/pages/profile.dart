import 'package:flutter/material.dart';
import 'package:duwin/constants/colors.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  Widget _buildDivider() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Divider(
          color: iconUntoggled,
          height: 2,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: ListTile(
                leading: Text(
                  'My Profile',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Material(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(40.0),
              ),
              clipBehavior: Clip.hardEdge,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black87,
                    ),
                    title: Text('Thiha Swam Htete'),
                    subtitle: Text('View Profile'),
                  ),
                  _buildDivider(),
                  ...[
                    [Icons.settings_outlined, 'Settings'],
                    [Icons.info_outline, 'Contact Support'],
                    [Icons.feed, 'Terms & Conditions'],
                    [Icons.privacy_tip, 'Privacy Info']
                  ]
                      .map(
                        (e) => ListTile(
                          leading: Icon(
                            e[0] as IconData,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: Text(e[1] as String),
                        ),
                      )
                      .toList(),
                  _buildDivider(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      shadowColor: Colors.transparent,
                      primary: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                      elevation: 1,
                      minimumSize: const Size(90.0, 1.0),
                      maximumSize: const Size(150.0, 100.0),
                      padding: const EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.logout,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
