import 'package:baitapbuoi6/album_request_model.dart';
import 'package:baitapbuoi6/send_album.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAlbum extends StatelessWidget {
  CreateAlbum({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              child: TextField(
                controller: controller,
              ),
            ),
            TextButton(
              onPressed: () async {
                // them 1 tag nhan biet log
                print(
                    'hoan.dv start create album - ${DateTime.now().millisecondsSinceEpoch}');
                final title = controller.text;
                final albumRequestModel = AlbumRequestModel(title: title);
                try {
                  final response = await createAlbum(albumRequestModel);
                  print('hoan.dv response $response');
                } catch (e) {
                  print(e.toString());
                }

                print(
                    'hoan.dv end create album - ${DateTime.now().millisecondsSinceEpoch}');
              },
              child: Text('Create Album'),
            )
          ],
        ),
      ),
    );
  }
}
