import 'notifier/camera_notifier.dart';
import 'package:geoshot/core/app_export.dart';
import 'package:geoshot/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

// ignore_for_file: must_be_immutable
class CameraPage extends ConsumerStatefulWidget {
  const CameraPage({Key? key})
      : super(
          key: key,
        );

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends ConsumerState<CameraPage> {
  late CameraController _controller;
  late List<CameraDescription> cameras;
  String _selectedFilter = ' No Filter'; // Initialize selected filter

  final List<String> _filters = ['No Filter', 'Polaroid', 'Warm', 'Cool', 'Frosty', 'Blossom', 'Faded', 'Grayscale' ];

  @override
  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    await _controller.initialize();
    if (mounted) {
      setState(() {});
    }
  }
  void initState() {
    super.initState();
    _initializeCamera().catchError((error) {
      // Handle camera initialization errors
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Camera Permission Error',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(
              'Camera permission has not been granted.',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          );

        },
      );
    });
  }



  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 600.h,
          child: Column(
            children: [
              _buildComponentFilters2(context),
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Center(
                        child: _controller.value.isInitialized
                            ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: CameraPreview(_controller),
                        )
                            : Container(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _onCapturePressed(); // Call a method to capture the photo
          },
          child: Icon(Icons.camera), // You can change the icon as needed
        ),
      ),
    );
  }

// Add the method to capture the photo
  void _onCapturePressed() async {
    if (!_controller.value.isTakingPicture) {
      try {
        final image = await _controller.takePicture(); // Capture the picture
        // Do something with the captured image, like saving it or displaying it
        print('Picture captured: ${image.path}');
      } catch (e) {
        print('Error capturing picture: $e');
      }
    }
  }


  Widget _buildComponentFilters2(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.v),
      decoration: AppDecoration.fillOnPrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 4.v),
            child: _buildComponentFilters(
              context,
              searchIcon: ImageConstant.imgIcon,
              filterText: "lbl_flash".tr,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.v),
            child: _buildComponentFilters(
              context,
              searchIcon: ImageConstant.imgArrowRight,
              filterText: "lbl_switch".tr,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.v),
            child: _buildFilterDropdown(), // Include the filter dropdown here

          ),
        ],
      ),
    );
  }

  // Widget to display the filter dropdown
  Widget _buildFilterDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PopupMenuButton<String>(
          icon: Container(
            height: 32.v,
            width: 64.h,
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 4.v,
            ),
            decoration: AppDecoration.fillLightPurple.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder16,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgSearch,
              height: 24.adaptSize,
              width: 24.adaptSize,
              alignment: Alignment.center,
            ),
          ),
          onSelected: (String value) {
            setState(() {
              _selectedFilter = value;
            });
          },
          itemBuilder: (BuildContext context) {
            return _filters.map((String filter) {
              return PopupMenuItem<String>(
                value: filter,
                child: Text(filter),
              );
            }).toList();
          },
        ),
        SizedBox(width: 8.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Align text center
          children: [
            Text(
              "lbl_filters".tr, // Display lbl_filters label
              style: theme.textTheme.labelLarge!.copyWith(
                color: appTheme.deepPurple50,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.v),
            Text(
              _selectedFilter.isEmpty ? "Selected Filter: " : "Selected Filter: $_selectedFilter", // Show selected filter
              style: theme.textTheme.labelLarge!.copyWith(
                color: appTheme.deepPurple50,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }


  Widget _buildComponentFilters(
      BuildContext context, {
        required String searchIcon,
        required String filterText,
      }) {
    return Column(
      children: [
        Container(
          height: 32.v,
          width: 64.h,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 4.v,
          ),
          decoration: AppDecoration.fillLightPurple.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder16,
          ),
          child: CustomImageView(
            imagePath: searchIcon,
            height: 24.adaptSize,
            width: 24.adaptSize,
            alignment: Alignment.center,
          ),
        ),
        SizedBox(height: 4.v),
        Text(
          filterText,
          style: theme.textTheme.labelLarge!.copyWith(
            color: appTheme.deepPurple50,
          ),
        ),
      ],
    );
  }
}

