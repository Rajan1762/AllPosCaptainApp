// import 'package:captain_app/utils/colors.dart';
// import 'package:captain_app/utils/constants.dart';
// import 'package:flutter/material.dart';
//
// class OrderDetailScreen extends StatefulWidget {
//   const OrderDetailScreen({super.key});
//
//   @override
//   State<OrderDetailScreen> createState() => _OrderDetailScreenState();
// }
//
// class _OrderDetailScreenState extends State<OrderDetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: appThemeColor,
//         title: const Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Order Details',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
//             Text('S)-T03-31052024-001',style: TextStyle(fontSize: 14))
//           ],
//         ),
//         actions: const [
//           Text('Dine In'),
//           SizedBox(width: 10)
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Table',style: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.w600)),
//                 Text('31 May 2024',style: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.w600)),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('...',style: TextStyle(color: Colors.grey.shade600)),
//                 Text('19:13',style: TextStyle(color: Colors.grey.shade600)),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                     style: ButtonStyle(
//                         padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(EdgeInsets.symmetric(horizontal: 15)),
//                         shape: WidgetStateProperty.all<OutlinedBorder?>( RoundedRectangleBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                             side: BorderSide(
//                                 color: Colors.grey.shade400
//                             )
//                         ))
//                     ),
//                     onPressed: (){}, child: Text('CHANGE TABLE',style: TextStyle(color: appThemeColor,fontSize: 16,fontWeight: FontWeight.w600))),
//                 const Text('${rupeeSymbol}0.00',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: ElevatedButton(
//                   style: ButtonStyle(
//                       padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(EdgeInsets.symmetric(horizontal: 15)),
//                       shape: WidgetStateProperty.all<OutlinedBorder?>(const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           side: BorderSide(
//                               color: Colors.red
//                           )
//                       ))
//                   ),
//                   onPressed: (){}, child: const Text('CANCEL ORDER',style: TextStyle(color: Colors.red,fontSize: 16,fontWeight: FontWeight.w600))),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 10),
//               padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
//               color: Colors.white,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('KOT-002/Indian',style: TextStyle(color: appThemeColor)),
//                       TextButton(
//                           style: ButtonStyle(
//                               padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(EdgeInsets.symmetric(horizontal: 15)),
//                               shape: WidgetStateProperty.all<OutlinedBorder?>( RoundedRectangleBorder(
//                                   borderRadius: const BorderRadius.all(Radius.circular(3)),
//                                   side: BorderSide(
//                                       color: Colors.grey.shade400
//                                   )
//                               ))
//                           ),
//                           onPressed: (){}, child: Text('REPRINT',style: TextStyle(color: appThemeColor,fontSize: 16,fontWeight: FontWeight.w600))),
//                     ],
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('1 x Milk'),
//                       Text('         ORDERED',style: TextStyle(
//                         color: appThemeColor,fontSize: 10
//                       )),
//                       Divider()
//                     ],
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('3 x Dosa'),
//                       Text('         ORDERED',style: TextStyle(
//                           color: appThemeColor,fontSize: 10
//                       )),
//                       Divider()
//                     ],
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('1 x Coffe'),
//                       Text('         ORDERED',style: TextStyle(
//                           color: appThemeColor,fontSize: 10
//                       )),
//                       Divider()
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Spacer(),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor: WidgetStateProperty.all<Color?>(Colors.orange),
//                           padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(EdgeInsets.symmetric(horizontal: 15)),
//                           shape: WidgetStateProperty.all<OutlinedBorder?>(const RoundedRectangleBorder(
//                               borderRadius: BorderRadius.all(Radius.circular(20)),
//                               // side: BorderSide(
//                               //     color: Colors.red
//                               // )
//                           )
//                           )
//                       ),
//                       onPressed: (){}, child: const Text('CLOSE',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600))),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }
//
