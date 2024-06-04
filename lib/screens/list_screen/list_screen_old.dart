// import 'package:captain_app/list_screen/order_detail_screen.dart';
// import 'package:captain_app/utils/colors.dart';
// import 'package:captain_app/utils/constants.dart';
// import 'package:flutter/material.dart';
//
// class ListScreen extends StatefulWidget {
//   const ListScreen({super.key});
//
//   @override
//   State<ListScreen> createState() => _ListScreen();
// }
//
// class _ListScreen extends State<ListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Row(
//           children: [
//             SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.45,
//                 child: const Image(image: AssetImage('assets/appBarBgImage.png'),fit: BoxFit.fill,)),
//             const Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text('Pending Orders', maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
//                   Text('Total Count : 37', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: appThemeColor,
//               borderRadius: const BorderRadius.all(Radius.circular(20))
//             ),
//             child: const Center(child: Text('View Reservation',style: TextStyle(color: Colors.white,fontSize: 16),)),
//           ),
//           Expanded(child: ListView.builder(itemCount: 10,itemBuilder: (context,index){
//             return GestureDetector(
//               onTap: (){
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const OrderDetailScreen()));
//               },
//               child: Container(
//                 margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//                 padding: const EdgeInsets.all(10),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(20))
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text('SO-T03-02052024-005',style: TextStyle(color: appThemeColor,fontWeight: FontWeight.bold,fontSize: 18)),
//                         const SizedBox(width: 10),
//                         const Text('2 May 2024',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600))
//                       ],
//                     ),
//                     const Divider(),
//                     Row(
//                       children: [
//                         const Expanded(
//                           flex: 3,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(bottom: 10.0),
//                                 child: Text('05:06 pm - Support',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600)),
//                               ),
//                               Row(
//                                 children: [
//                                   ListOrderTypeWidget(title: 'Dine In', orderTypeStatus: true),
//                                   SizedBox(width: 10,),
//                                   ListOrderTypeWidget(title: '${rupeeSymbol}360.00', orderTypeStatus: false)
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Spacer(),
//                         Expanded(
//                           flex: 2,
//                           child: Container(
//                             padding: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               color: appThemeColor,
//                               borderRadius: BorderRadius.all(Radius.circular(20))
//                             ),
//                             child: Center(child: Text('RE-ORDER',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16)),),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             );
//           }))
//         ],
//       ),
//     );
//   }
// }
//
// class ListOrderTypeWidget extends StatelessWidget {
//   final String title;
//   final bool orderTypeStatus;
//   const ListOrderTypeWidget({
//     super.key, required this.title, required this.orderTypeStatus,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         height: 30,
//         decoration: BoxDecoration(
//           color: orderTypeStatus ? Colors.teal.shade100 : Colors.orange.shade300,
//           borderRadius: BorderRadius.all(Radius.circular(15))
//         ),
//         child: Center(child: Text(title,style: TextStyle(color: orderTypeStatus ? Colors.grey.shade800 : Colors.white))),
//       ),
//     );
//   }
// }
