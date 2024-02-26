import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:road_safe_app/utils/app_drawer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:tflite_v2/tflite_v2.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Picking Up Image
  File? selectedImage;

  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = File(returnedImage!.path);
    });
  }

  Future pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      selectedImage = File(returnedImage!.path);
    });
  }

  //gettingLocation

  Location location = Location();
  late bool serviceEnabled;
  late PermissionStatus permissionGranted;
  late LocationData locationData;
  LocationData? currentLocation; //setting location state
  late double latitude;
  late double longitude;
  String address = 'Your address'; //setting address

  Future<dynamic> getLocation() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) serviceEnabled = await location.requestService();

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }

    locationData = await location.getLocation();

    setState(() {
      currentLocation = locationData;
      latitude = currentLocation!.latitude!;
      longitude = currentLocation!.longitude!;
    });

    return locationData;
  }

  String accessToken = "pk.6ad0615ce37a554ee116ff99d77a2b36";

  Future<void> getLocationDetails(double latitude, double longitude) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://us1.locationiq.com/v1/reverse?key=$accessToken&lat=$latitude&lon=$longitude&format=json'),
      );

      if (response.statusCode == 200) {
        // Successful response
        final data = json.decode(response.body);
        setState(() {
          address = data['display_name'];
        });
      } else {
        // Handle error
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      // Handle network or other errors
      print("Error: $e");
    }
  }

  //Choice Chip
  Map<String, bool> ProblemFilter = {
    'Pothole': false,
    'Cracks': false,
    'Water logging': false,
  };

  List<String> selectedChips = [];
  bool isSelectedChip = false;

  //YOLO_model_run

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String? res = await Tflite.loadModel(
      model: "assets/multi_detection/best_float32.tflite",
      labels: "assets/multi_detection/labels.txt",
      // useGpuDelegate: true,
    );

    print('$res model loaded');
  }

  // Future yolov8(File image) async {
  //   var recognitions = await Tflite.detectObjectOnImage(
  //     path: image.path,
  //     model: "YOLO",
  //     threshold: 0.3,
  //     imageMean: 0.0,
  //     imageStd: 255.0,
  //     numResultsPerClass: 1,
  //   );

  //   if (recognitions != null) {
  //     print("Object Detected");
  //     print("Recognitions Shape: ${recognitions.length}");
  //     print(
  //         "First Recognition: ${recognitions.isNotEmpty ? recognitions[0] : null}");
  //   } else {
  //     print("No Object Detected");
  //   }
  // }

  List<dynamic>? _recognitions;

  Future predictImage(File image) async {
    // await yolov8(image);
    var recognitions = await Tflite.detectObjectOnImage(
      path: image.path,
      model: "YOLO",
      threshold: 0.3,
      imageMean: 0.0,
      imageStd: 255.0,
      numResultsPerClass: 2,
    );

    await Tflite.close();

    setState(() {
      _recognitions = recognitions;
    });

    if (_recognitions != null) {
      print("Object Detected");
      print("Recognitions Shape: ${_recognitions!.length}");
      // print(
      //     "First Recognition: ${_recognitions.isNotEmpty ? _recognitions[0] : null}");
    } else {
      print("No Object Detected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //picking up image
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    color: Colors.amber,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.image_search_rounded),
                        SizedBox(width: 8),
                        Text('Choose from gallery'),
                      ],
                    ),
                    onPressed: () {
                      pickImageFromGallery();
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    color: Colors.amber,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.camera_alt),
                        SizedBox(width: 8),
                        Text('Take a picture'),
                      ],
                    ),
                    onPressed: () {
                      pickImageFromCamera();
                    },
                  ),
                ],
              ),

              selectedImage != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: Image.file(selectedImage!, fit: BoxFit.fill),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.3,
                          color: Colors.grey[400],
                          child: const Icon(Icons.image_rounded),
                        ),
                      ),
                    ),
              //Adding Location
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: MaterialButton(
                        color: Colors.amber,
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.location_on),
                            SizedBox(width: 8),
                            Text('Location'),
                          ],
                        ),
                        onPressed: () {
                          getLocation();
                          getLocationDetails(latitude, longitude);
                        }),
                  ),
                ],
              ),
              Wrap(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6.8),
                  child: Text(
                    address,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text("Problem Description (if Any)",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
              const SizedBox(
                height: 8,
              ),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 5,
                children: [
                  for (var option in ProblemFilter.keys)
                    FilterChip(
                      label: Text(option),
                      selected: ProblemFilter[option]!,
                      selectedColor: Colors.amber,
                      onSelected: (selected) {
                        setState(() {
                          ProblemFilter[option] = selected;
                        });
                        selectedChips = ProblemFilter.entries
                            .where((entry) => entry.value)
                            .map((entry) => entry.key)
                            .toList();
                        print('Selected Options: $selectedChips');
                      },
                    )
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Problem description (if any)',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Center(
                child: MaterialButton(
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Raise Complaint'),
                    ],
                  ),
                  onPressed: () {
                    if (selectedImage != null) {
                      predictImage(selectedImage!);
                    }

                    print('raising complaint');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
