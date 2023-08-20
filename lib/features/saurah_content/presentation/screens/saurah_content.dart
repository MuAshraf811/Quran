// // ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class SC extends StatelessWidget {
  const SC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.black,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          );
        },
        itemCount: 302,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Center(
                child: Container(
                  width: 411.42857142857144,
                  height: 683.4285714285714,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image:
                              AssetImage('assets/Quran/000${index + 1}.png'))),
                  // Image.asset('assets/Quran/0001.png'),
                ),
              ),
              Center(
                child: Container(
                  width: 411.42857142857144,
                  height: 683.4285714285714,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/Quran/00${index + 1}.png'))),
                  // Image.asset('assets/Quran/0001.png'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}












// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:quran/core/constants.dart';

// import '../bloc/all_ayahs_bloc.dart';

// class SaurahContent extends StatelessWidget {
//   const SaurahContent(
//       {super.key,
//       required this.name,
//       required this.indexx,
//       required this.ayahsNumber});
//   final String name;
//   final int indexx;
//   final int ayahsNumber;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             name,
//             style: const TextStyle(
//               fontSize: 26,
//             ),
//           )),
//       body: BlocConsumer<AllAyahsBloc, AllAyahsState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           if (state is LoadingAyahs) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: appColor,
//               ),
//             );
//           } else if (state is LoadedAyahs) {
//             // return      ;

//             // return Center(
//             //   child: Text(
//             //     state.ayahs[0][1].text,
//             //   ),
//             // );
//             return ListView.builder(
//               itemCount: ayahsNumber,
//             // state.ayahs[1].length,
//             // separatorBuilder: (context, index) {
//             //   return CircleAvatar(
//             //     radius: 15,
//             //     backgroundColor: appColor,
//             //     child: CircleAvatar(
//             //       radius: 14,
//             //       backgroundColor: Colors.white,
//             //       child: Text(
//             //         state.ayahs[0][index].number.toString(),
//             //         style: const TextStyle(
//             //             color: appColor, fontWeight: FontWeight.bold),
//             //       ),
//             //     ),
//             //   );
//             // },
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//             //     child: RichText(
//             //       text: TextSpan(
//             //         children: [
//             //           TextSpan(text: state.ayahs[indexx - 1][index].text),
//             //         ],
//             //       ),
//             //     ),
//             // child: Text(
//             //   '${state.ayahs[indexx - 1][index].text}',
//             //   textAlign: TextAlign.end,
//             //   style: const TextStyle(
//             //     color: Colors.black,
//             //     fontSize: 20,
//             //     fontWeight: FontWeight.bold,
//             //   ),
//             // ),
//             child: Wrap(
//               crossAxisAlignment: WrapCrossAlignment.end,
//               alignment: WrapAlignment.end,
//               children: [
//                 CircleAvatar(
//                   radius: 16,
//                   backgroundColor: appColor,
//                   child: CircleAvatar(
//                     radius: 14.3,
//                     backgroundColor: Colors.white,
//                     child: Text(
//                       state.ayahs[indexx - 1][index].number.toString(),
//                       style: const TextStyle(
//                           color: appColor, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 Text(
//                   '${state.ayahs[indexx - 1][index].text}',
//                   textAlign: TextAlign.end,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//               );
//             },
//             );
//           } else if (state is LoadingAyahsError) {
//             return const Center(
//               child: Text('Some thing went wrong while fetching ayahs'),
//             );
//           }
//           return const Center(
//             child: Text('bloc has been skipped'),
//           );
//         },
//       ),
//     );
//   }
// }
