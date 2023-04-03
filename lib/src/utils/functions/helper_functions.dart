import 'package:flutter/material.dart';


enum MenuItem {
  camera,
  gallery,
  cancel,
}

class HelperFunctions {
  static void feedModalSheet(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 5,
        context: ctx,
        builder: (ctx) =>
            Padding(
              padding: EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                  bottom: MediaQuery
                      .of(ctx)
                      .viewInsets
                      .bottom + 15
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Create post', style: TextStyle(fontSize: 18)),
                      Text(
                        'Share', style: TextStyle(fontWeight: FontWeight.w600),),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Container(width: MediaQuery
                      .of(ctx)
                      .size
                      .width, height: 2, color: Colors.blueGrey,),
                  const SizedBox(height: 28),
                  ListTile(
                    leading: const Icon(Icons.account_circle_rounded, size: 45),
                    title: const Text('Occian Fumnanya Diaali',
                      style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: const Text('Share with..'),
                    trailing: PopupMenuButton<MenuItem>(
                      onSelected: (value) {},
                      itemBuilder: (ctx) =>
                      [
                        PopupMenuItem(
                          value: MenuItem.camera,
                          child: Row(
                            children: const [
                              Icon(Icons.camera_alt_outlined),
                              SizedBox(width: 10,),
                              Text("Camera"),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: MenuItem.camera,
                          child: Row(
                            children: const [
                              Icon(Icons.photo_album_outlined),
                              SizedBox(width: 10,),
                              Text("Gallery"),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: MenuItem.cancel,
                          child: Row(
                            children: const [
                              Icon(Icons.close_rounded),
                              SizedBox(width: 10,),
                              Text("Cancel"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: TextField(
                      cursorColor: Colors.deepOrangeAccent,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'What\'s on your mind?',
                          hintStyle: TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              color: Colors.blueGrey)),
                      maxLines: 15,
                    ),
                  ),
                ],
              ),
            )
    );
  }

}

