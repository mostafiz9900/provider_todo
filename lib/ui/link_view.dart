import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' show PreviewData;

class LinkView extends StatelessWidget {
  const LinkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: _LinkPreviewWidget()

        // Column(children: [
        //   AnyLinkPreview(
        //     link:
        //         'https://www.espn.in/football/soccer-transfers/story/4163866/transfer-talk-lionel-messi-tells-barcelona-hes-more-likely-to-leave-then-stay',
        //     displayDirection: UIDirection.uiDirectionHorizontal,
        //     cache: Duration(hours: 1),
        //     backgroundColor: Colors.grey[300],
        //     errorWidget: Container(
        //       color: Colors.grey[300],
        //       child: Text('Oops!'),
        //     ),
        //     errorImage: "Error",
        //   ),
        // ]),
        );
  }
}

class _LinkPreviewWidget extends StatefulWidget {
  const _LinkPreviewWidget({Key? key}) : super(key: key);

  @override
  State<_LinkPreviewWidget> createState() => _LinkPreviewWidgetState();
}

class _LinkPreviewWidgetState extends State<_LinkPreviewWidget> {
  Map<String, PreviewData> datas = {};

  List<String> get urls => const [
        'github.com/flyerhq',
        'https://thereverseland.com',
        'https://www.prothomalo.com/bangladesh/district/ezg87xdrpu',
        'https://www.prothomalo.com/bangladesh/district/809h6jkux2'
      ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: urls.length,
        itemBuilder: (context, index) => Align(
          alignment: Alignment.centerLeft,
          child: Container(
            key: ValueKey(urls[index]),
            margin: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Color(0xfff7f7f8),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: LinkPreview(
                enableAnimation: true,
                onPreviewDataFetched: (data) {
                  setState(() {
                    datas = {
                      ...datas,
                      urls[index]: data,
                    };
                  });
                },
                previewData: datas[urls[index]],
                text: urls[index],
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
