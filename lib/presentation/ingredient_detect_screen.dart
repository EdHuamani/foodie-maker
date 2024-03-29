import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';


class FlutterVisionHome extends StatefulWidget {
  @override
  _FlutterVisionHomeState createState() {
    return _FlutterVisionHomeState();
  }
}

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class _FlutterVisionHomeState extends State<FlutterVisionHome> {
  CameraController controller;
  String imagePath;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter Vision'),
      ),
      body: Stack(
        children: <Widget>[
           _cameraPreviewWidget(),
          Positioned(
            bottom: 50,
            child:  Center(child: _captureControlRowWidget(context)),
            ),
         
          
        ],
      ),
    );
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Tap a camera',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return CameraPreview(controller);
    }
  }

  /// Display the control bar with buttons to take pictures.
  Widget _captureControlRowWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
             RaisedButton(
      
      textColor: Colors.white,
      color: Colors.blue,
      onPressed: controller != null &&
                  controller.value.isInitialized 
              ? () => onTakePictureButtonPressed(context)
              : null,
      child:  Text("Take Photo"),
    )
      ],
    );
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void onTakePictureButtonPressed(BuildContext context) {
    takePicture().then((String filePath) {
      if (mounted) {
        setState(() {
          imagePath = filePath;
        });
        if (filePath != null) {
          showInSnackBar('Picture saved to $filePath');

          detectLabels(context).then((_) { 

          });
        } 
      }
    });
  }

  Future<void> detectLabels(BuildContext context) async {
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFilePath(imagePath);
    final ImageLabeler labelDetector = FirebaseVision.instance.cloudImageLabeler();
    final List<ImageLabel> labels = await labelDetector.processImage(visionImage);
    // Navigator.push(context, MaterialPageRoute(builder: (context) => IngredientView(labels: labels)));
    for (ImageLabel label in labels) {
      final String text = label.text ;
      //final String entityId = label.entityId;
      //final double confidence = label.confidence;

      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text)));
    }
  }

  Future<String> takePicture() async {
    if (!controller.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_vision';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await controller.takePicture(filePath);
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return filePath;
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}

List<CameraDescription> cameras;

class IngredientDetectScreen extends StatelessWidget {
  
  IngredientDetectScreen(List<CameraDescription> cam)  {
    cameras = cam;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlutterVisionHome(),
    );
  }
}
