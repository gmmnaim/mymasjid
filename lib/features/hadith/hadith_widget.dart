import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'hadith_provider.dart';

class HadithWidget extends ConsumerWidget {

  const HadithWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final hadith = ref.watch(hadithProvider);

    if(hadith==null){
      return const CircularProgressIndicator();
    }

    return Container(
      height:200,
      padding:const EdgeInsets.all(10),

      child:Column(
        children:[

          Text(
            hadith.bookSlug,
            style:const TextStyle(fontWeight:FontWeight.bold),
          ),

          const SizedBox(height:5),

          Text(hadith.englishNarrator),

          const SizedBox(height:5),

          Expanded(
            child:AutoSizeText(
              hadith.hadithEnglish,
              maxLines:6,
              minFontSize:10,
              maxFontSize:18,
              overflow:TextOverflow.ellipsis,
            ),
          ),

        ],
      ),
    );
  }
}
