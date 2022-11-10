import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nativapps_test/core/utils/bottom_sheet_image_picker.dart';
import 'package:nativapps_test/presentation/pages/create_report_view/create_report_controller.dart';

final injector = GetIt.instance;

const double radiusCircle = 10;
const double sizeContainer = 125;

const optionsPhoto = [
  {
    "label": 'Tomar foto',
    "icon": Icons.photo_camera,
    "value": ImageSource.camera,
    "isCancel": false,
  },
  {
    "label": 'Cancel',
    "icon": Icons.close,
    "value": null,
    "color": Colors.red,
    "isCancel": true,
  }
];

class CardImage extends StatefulWidget {
  final String? file;
  final double? width;
  final bool? isActive;
  final double? height;
  final double? sizeIcon;
  final Color? backgroundColor;

  const CardImage({
    Key? key,
    this.file,
    this.width,
    this.height,
    this.sizeIcon = 40,
    this.backgroundColor,
    this.isActive = true,
  }) : super(key: key);

  @override
  State<CardImage> createState() => _CardImageState();
}

class _CardImageState extends State<CardImage> {
  XFile? file;
  final _controller = injector.get<CreateReportController>();
  final bottomSheetImagePicker = BottomSheetImagePicker(items: optionsPhoto);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Column(
        children: [
          file != null || widget.file != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(radiusCircle),
                  child: Image(
                    image: file != null
                        ? FileImage(File(file!.path)) as ImageProvider
                        : NetworkImage(widget.file!),
                    fit: BoxFit.cover,
                    width: sizeContainer,
                    height: sizeContainer,
                  ),
                )
              : Container(
                  width: sizeContainer,
                  height: sizeContainer,
                  decoration: BoxDecoration(
                    color: const Color(0xFFf7f7f7),
                    borderRadius: BorderRadius.circular(radiusCircle),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    MaterialCommunityIcons.camera_outline,
                    size: widget.sizeIcon,
                    color: Colors.blue,
                  ),
                ),
          const SizedBox(height: 15),
          Text(
            file == null ? "Tomar foto" : "Cambiar foto",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  void _pickImage() async {
    final ImagePicker picker = ImagePicker();

    final imageSource = await bottomSheetImagePicker.show(context);
    if (imageSource != null) {
      final XFile? selectedFile = await picker.pickImage(source: imageSource);
      if (selectedFile != null) {
        setState(() {
          file = selectedFile;
        });
        _controller.takePhoto(selectedFile);
      }
    }
  }
}
