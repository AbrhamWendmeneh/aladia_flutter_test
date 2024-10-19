// import 'package:flutter/material.dart';
// import 'package:widgetbook/widgetbook.dart';
// import 'package:widgetbook_annotation/widgetbook_annotation.dart';
// import '../app/themes.dart';
// import '../widgets/custom_button.dart';
// import '../widgets/input_field.dart';
// import 'widgetbook.directories.g.dart';

// void main() {
//   runApp(const WidgetbookApp());
// }

// @App()
// class WidgetbookApp extends StatelessWidget {
//   const WidgetbookApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Widgetbook(
//       directories: directories,
//       appBuilder: (context, child) => ColoredBox(
//         color: const Color(0xFF404040),
//         child: child,
//       ),
//       addons: [
//         // CustomButtonAddon(),
//         // InputFieldAddon(),
//         DeviceFrameAddon(
//           devices: [
//             Devices.android.samsungGalaxyA50,
//             Devices.ios.iPhone13,
//           ],
//           initialDevice: Devices.android.samsungGalaxyA50,
//         ),
//         // ThemeAddon(
//         //   themes: [
//         //     WidgetbookTheme(
//         //       name: 'Light',
//         //       data: lightTheme,
//         //     ),
//         //     WidgetbookTheme(
//         //       name: 'Dark',
//         //       data: darkTheme,
//         //     ),
//         //   ],
//         //   themeBuilder: (context, child, theme) =>
//         //       ColoredBox(color: theme.colorScheme.primary , child: ()),
//         // ),
//       ],
//       integrations: [WidgetbookCloudIntegration()],
//     );
//   }
// }
