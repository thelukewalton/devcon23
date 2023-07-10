import 'package:flutter/material.dart';
import 'package:zds_flutter/zds_flutter.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class ZDSDemo extends StatelessWidget {
  const ZDSDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);
    final ZdsFilePickerController controller = ZdsFilePickerController();

    final headers = [
      ZdsBlockTableHeader(text: 'Sun'),
      ZdsBlockTableHeader(text: 'Mon'),
    ];
    final data = [
      ZdsBlockTableRow(
        header: 'Group 1',
        titleCell: ZdsBlockTableCellData(text: 'Row 1'),
        data: [
          ZdsBlockTableCellData(text: '10am', isSelected: true),
          ZdsBlockTableCellData(
            child: const Padding(
              padding: EdgeInsets.all(2),
              child: Wrap(children: [Icon(ZdsIcons.add, color: Colors.black)]),
            ),
          ),
        ],
      ),
      ZdsBlockTableRow(
        titleCell: ZdsBlockTableCellData(text: 'Row 2'),
        data: [
          ZdsBlockTableCellData(
            child: ZdsButton.filled(child: const Text('Button'), onTap: () {}),
          ),
          ZdsBlockTableCellData(text: '1pm'),
        ],
      ),
      ZdsBlockTableRow(
        header: 'Group 2',
        titleCell: ZdsBlockTableCellData(text: 'Row 1'),
        data: [
          ZdsBlockTableCellData(child: ZdsImages.sadZebra),
          ZdsBlockTableCellData(text: '10am'),
        ],
      ),
      ZdsBlockTableRow(
        titleCell: ZdsBlockTableCellData(text: 'Row 2'),
        data: [
          ZdsBlockTableCellData(text: '10am'),
          ZdsBlockTableCellData(text: '10am'),
        ],
      ),
    ];

    return ZdsApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: Container(
        color: ZetaColors.of(context).white,
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const _Wrapper(
                    child: ZdsAppBar(
                      color: ZdsTabBarColor.surface,
                      actions: [Icon(Icons.more_vert)],
                      title: Text('Appbar'),
                    ),
                  ),
                  const _Wrapper(
                    child: ZdsAppBar(
                      actions: [Icon(Icons.more_vert)],
                      title: Text('Appbar'),
                    ),
                  ),
                  const _Wrapper(
                    child: ZdsAppBar(
                      color: ZdsTabBarColor.primary,
                      actions: [Icon(Icons.more_vert)],
                      title: Text('Appbar'),
                    ),
                  ),
                  _Wrapper(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ZdsButton.filled(
                          child: const Text('Button'),
                          onTap: () {},
                        ),
                        ZdsButton.outlined(
                          child: const Text('Button'),
                          onTap: () {},
                        ),
                        ZdsButton.text(
                          child: const Text('Button'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  _Wrapper(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ZdsButton.filled(
                          onTap: () {},
                          customColorSwatch: colors.green,
                          child: const Text('Button'),
                        ),
                        ZdsButton.outlined(
                          onTap: () {},
                          customColorSwatch: colors.green,
                          child: const Text('Button'),
                        ),
                        ZdsButton.text(
                          onTap: () {},
                          customColorSwatch: colors.green,
                          child: const Text('Button'),
                        ),
                      ],
                    ),
                  ),
                  _Wrapper(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ZdsButton.filled(
                          onTap: () {},
                          customColorSwatch: colors.red,
                          child: const Text('Button'),
                        ),
                        ZdsButton.outlined(
                          onTap: () {},
                          customColorSwatch: colors.red,
                          child: const Text('Button'),
                        ),
                        ZdsButton.text(
                          onTap: () {},
                          customColorSwatch: colors.red,
                          child: const Text('Button'),
                        ),
                      ],
                    ),
                  ),
                  _Wrapper(
                    child: ZdsBottomSheet(
                      header: ZdsSheetHeader(
                        headerText: 'Bottom Sheet',
                        leading: Icon(
                          Icons.close,
                          color: colors.textDefault,
                        ),
                      ),
                      bottom: ZdsBottomBar(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ZdsButton.filled(
                              child: const Text('Submit'),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      child: SizedBox(
                        height: 200,
                        child: SingleChildScrollView(
                          child: ZdsListGroup(
                            items: [
                              ZdsListTile(
                                leading: const Text('Urgent'),
                                trailing: ZdsIndex(
                                  color: ZetaColors.of(context).red,
                                  child: const Text('U'),
                                ),
                              ),
                              ZdsListTile(
                                leading: const Text('Hight'),
                                trailing: ZdsIndex(
                                  color: ZetaColors.of(context).orange,
                                  child: const Text('1'),
                                ),
                              ),
                              ZdsListTile(
                                leading: const Text('Medium'),
                                trailing: ZdsIndex(
                                  color: Theme.of(context).colorScheme.primaryContainer,
                                  child: const Text('2'),
                                ),
                              ),
                              ZdsListTile(
                                leading: const Text('Low'),
                                trailing: ZdsIndex(
                                  color: ZetaColors.of(context).green,
                                  child: const Text('3'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const _Wrapper(
                    child: ZdsExpansionTile(
                      title: Text('Business dependents'),
                      child: Text('Lorem'),
                    ),
                  ),
                  const _Wrapper(
                    child: ZdsExpansionTile(
                      initiallyExpanded: true,
                      title: Text('Business descendents'),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      ),
                    ),
                  ),
                  _Wrapper(
                    child: ZdsFieldsListTile(
                      title: Row(
                        children: [
                          Icon(
                            ZdsIcons.task,
                            color: Theme.of(context).primaryColor,
                            size: 25,
                          ).paddingOnly(right: 10),
                          Text(
                            'Manual Task Survey 2',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      fieldsEndTextStyle: Theme.of(context).textTheme.bodyLarge,
                      fields: const [
                        TileField(
                          start: Text('Execution level'),
                          end: Text('Store'),
                        ),
                        TileField(
                          start: Text('Assigned'),
                          end: Text('Store Manager'),
                        ),
                        TileField(
                          start: Text('Department'),
                          end: Text('Store'),
                        ),
                        TileField(
                          start: Text('Type'),
                          end: Text('System'),
                        ),
                      ],
                      data: 'Any object',
                      onTap: (String? data) {},
                    ),
                  ),
                ].divide(const SizedBox(height: 16)).toList(),
              ),
              Column(
                children: [
                  _Wrapper(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          child: const ZdsProfile(
                            avatar: ZdsNetworkAvatar(
                              initials: 'ZDS',
                              url: 'https://i.pinimg.com/originals/1d/35/23/1d352375dd8bf60f05d91f9d41e034ce.jpg',
                            ),
                            nameText: Text('Joe Bloggs'),
                            jobTitleText: Text('Developer'),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 132,
                          child: ZdsListGroup(
                            padding: const EdgeInsets.all(1),
                            child: Column(
                              children: [
                                ZdsListTile(
                                  title: const Text('Settings'),
                                  shrinkWrap: true,
                                  onTap: () {},
                                ),
                                ZdsListTile(
                                  shrinkWrap: true,
                                  title: const Text('Options'),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _Wrapper(
                    child: ZdsToggleButton(
                      values: const ['a', 'b', 'c'],
                      onToggleCallback: (_) {},
                    ),
                  ),
                  _Wrapper(
                    child: ZdsToggleButton(
                      values: const ['a', 'b', 'c'],
                      backgroundColor: colors.green,
                      onToggleCallback: (_) {},
                      initialValue: 2,
                    ),
                  ),
                  _Wrapper(
                    child: ZdsToggleButton(
                      values: const ['a', 'b', 'c'],
                      backgroundColor: colors.red,
                      onToggleCallback: (_) {},
                      initialValue: 1,
                    ),
                  ),
                  _Wrapper(
                    child: ZdsBottomTabBar(
                      onTap: (index) {},
                      items: const [
                        ZdsNavItem(
                          icon: IconWithBadge(
                            Icons.article_outlined,
                            unread: 4,
                            semanticsLabel: '4 unread forms',
                          ),
                          label: 'Forms',
                        ),
                        ZdsNavItem(
                          icon: IconWithBadge(
                            Icons.search,
                          ),
                          label: 'Search',
                        ),
                        ZdsNavItem(
                          icon: IconWithBadge(
                            Icons.analytics_outlined,
                            unread: 50000,
                            maximumDigits: 4,
                          ),
                          label: 'Reports',
                        ),
                      ],
                    ),
                  ),
                  _Wrapper(
                    child: ZdsFilePicker(controller: controller, optionDisplay: ZdsOptionDisplay.plain),
                  ),
                  _Wrapper(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ZdsIconTextButton(
                          label: 'Tap',
                          icon: ZdsIcons.action,
                        ),
                        ZdsIconTextButton(
                          label: 'Bad',
                          icon: ZdsIcons.audit_activity,
                          backgroundColor: colors.red,
                        ),
                        ZdsIconTextButton(
                          label: 'Good',
                          icon: ZdsIcons.vacation,
                          backgroundColor: colors.green,
                        ),
                      ],
                    ),
                  ),
                  _Wrapper(
                    child: Column(
                      children: [
                        ZdsSelectableListTile(
                          title: const Text('Urgent'),
                          subTitle: const Text('32 hours available'),
                          selected: true,
                          trailing: ZdsIndex(color: colors.red, child: const Text('U')),
                          onTap: () {},
                        ),
                        ZdsSelectableListTile(
                          title: const Text('High'),
                          trailing: ZdsIndex(color: colors.orange, child: const Text('1')),
                          onTap: () {},
                        ),
                        ZdsSelectableListTile(
                          title: const Text('Medium'),
                          trailing: ZdsIndex(color: colors.teal, child: const Text('2')),
                          onTap: () {},
                        ),
                        ZdsSelectableListTile(
                          title: const Text('Low'),
                          trailing: ZdsIndex(color: colors.green, child: const Text('3')),
                          onTap: () {},
                        ),
                        ZdsSelectableListTile.checkable(
                          title: const Text('Checkable unselected'),
                          onTap: () {},
                        ),
                        ZdsSelectableListTile.checkable(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Checkable selected'),
                              Text(
                                'Checkable unselected',
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                          selected: true,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  _Wrapper(
                    isOutline: true,
                    child: ZdsBlockTable(headers: headers, rows: data),
                  ),
                ].divide(const SizedBox(height: 16)).toList(),
              ),
              Column(
                children: [
                  _Wrapper(
                    child: Column(
                      children: [
                        ZdsInformationBar(
                          color: colors.green,
                          icon: ZdsIcons.check,
                          label: 'Approved',
                        ),
                        const SizedBox(height: 10),
                        ZdsInformationBar(
                          color: colors.blue,
                          icon: ZdsIcons.hourglass,
                          label: 'Pending',
                        ),
                        const SizedBox(height: 10),
                        ZdsInformationBar(
                          color: colors.red,
                          icon: ZdsIcons.close,
                          label: 'Declined',
                        ),
                        const SizedBox(height: 10),
                        ZdsInformationBar(
                          label: 'Neutral text',
                          color: colors.warm,
                        )
                      ],
                    ),
                  ),
                  _Wrapper(
                    child: ZdsCalendar(
                      selectedDay: DateTime.now(),
                      events: [
                        CalendarEvent(id: 'a', date: DateTime.now()),
                        CalendarEvent(id: 'b', date: DateTime.now().subtract(const Duration(days: 1))),
                        CalendarEvent(id: 'c', date: DateTime.now().add(const Duration(days: 1))),
                      ],
                      holidayEvents: [DateUtils.dateOnly(DateTime(2023, 05, 23))],
                      onDaySelected: (selectedDay, focusedDay) {
                        debugPrint('Focused day is $focusedDay');
                        debugPrint('Selected day is $selectedDay');
                      },
                      onFormatChanged: (format) => debugPrint('The format has changed and it is now $format'),
                      onPageChanged: (focusedDay) =>
                          debugPrint('The page has changed and the focused day is now $focusedDay'),
                    ),
                  ),
                  _Wrapper(
                    child: ZdsCalendar.weekly(
                      selectedDay: DateTime.now(),
                      events: [
                        CalendarEvent(id: 'a', date: DateTime.now()),
                        CalendarEvent(id: 'b', date: DateTime.now().subtract(const Duration(days: 1))),
                        CalendarEvent(id: 'c', date: DateTime.now().add(const Duration(days: 1))),
                      ],
                      holidayEvents: [DateUtils.dateOnly(DateTime(2023, 05, 23))],
                      onDaySelected: (selectedDay, focusedDay) {
                        debugPrint('Focused day is $focusedDay');
                        debugPrint('Selected day is $selectedDay');
                      },
                      onFormatChanged: (format) => debugPrint('The format has changed and it is now $format'),
                      onPageChanged: (focusedDay) =>
                          debugPrint('The page has changed and the focused day is now $focusedDay'),
                    ),
                  ),
                  SizedBox(
                    width: 360,
                    height: 300,
                    child: ZdsModal(
                      actions: [
                        ZdsButton.muted(
                          child: const Text('Cancel'),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ZdsButton(
                          child: const Text('Save'),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: TextField(
                          decoration: ZdsInputDecoration(
                            labelText: 'Edit Walk Name',
                            counter: const Text('Character left: 255'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  _Wrapper(
                    child: ZdsListGroup(
                      items: [
                        ZdsListTile(
                          title: Text(
                            'Team Leader - Store',
                            style: TextStyle(color: Theme.of(context).colorScheme.primary),
                          ),
                          trailing: Icon(
                            ZdsIcons.check,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const ZdsListTile(
                          title: Text('View summary'),
                          trailing: Icon(ZdsIcons.check),
                        ),
                        const ZdsListTile(
                          title: Text('View summary'),
                          trailing: Icon(ZdsIcons.check),
                        ),
                      ],
                    ),
                  ),
                ].divide(const SizedBox(height: 16)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Wrapper extends StatelessWidget {
  final Widget child;
  final bool isOutline;
  const _Wrapper({required this.child, this.isOutline = false});

  @override
  Widget build(BuildContext context) {
    return ZdsCard(
      padding: isOutline ? const EdgeInsets.all(1) : EdgeInsets.zero,
      variant: isOutline ? ZdsCardVariant.outlined : ZdsCardVariant.elevated,
      child: SizedBox(width: 360, child: child),
    );
  }
}