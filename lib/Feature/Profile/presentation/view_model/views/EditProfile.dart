import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../generated/l10n.dart';

// =========== Cubit ===========
class EditProfileCubit extends Cubit<Map<String, String>> {
  EditProfileCubit()
      : super({
    'name': '',
    'phone': '',
  });

  void updateField(String key, String value) {
    emit({...state, key: value});
  }
}

// =========== Screen ===========
class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(),
      child: const EditProfileView(),
    );
  }
}

// =========== UI ===========
class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: SecoundColor,
      appBar: CustomAppBar(title: S.of(context).editProfile),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileImage(screenWidth),
            SizedBox(height: screenWidth * 0.15),
            BlocBuilder<EditProfileCubit, Map<String, String>>(
              builder: (context, state) {
                return Column(
                  children: [
                    _buildTextField(
                      context,
                      label: S.of(context).FullName,
                      keyField: 'name',
                      hint: S.of(context).FullName,
                      value: state['name'] ?? '',
                      icon: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        child: Image.asset(
                          'Assets/user.png',
                          width: screenWidth * 0.05,
                          height: screenWidth * 0.05,
                          color: Colors.grey.shade800,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    _buildTextField(
                      context,
                      label: S.of(context).PhoneNumber,
                      keyField: 'phone',
                      hint: S.of(context).PhoneNumber,
                      value: state['phone'] ?? '',
                      icon: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(
                            Localizations.localeOf(context).languageCode == 'ar'
                                ? 3.1416
                                : 0,
                          ),
                          child: Icon(
                            Icons.phone_enabled_outlined,
                            size: screenWidth * 0.05,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: screenWidth * 0.05),
            _buildSaveCancelButtons(context),
          ],
        ),
      ),
    );
  }

  // صورة البروفايل
  Widget _buildProfileImage(double screenWidth) {
    final String? imagePath = null;

    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: screenWidth * 0.15,
            backgroundColor: Colors.grey.shade300,
            backgroundImage:
            imagePath != null ? AssetImage(imagePath) : null,
            child: imagePath == null
                ? Icon(
              Icons.person,
              size: screenWidth * 0.15,
              color: ThirdColor,
            )
                : null,
          ),
          Positioned(
            right: 0.0,
            bottom: screenWidth * 0.05,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: KprimaryColor,
              ),
              width: screenWidth * 0.07,
              height: screenWidth * 0.07,
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: screenWidth * 0.04,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // حقول الإدخال
  Widget _buildTextField(
      BuildContext context, {
        required String label,
        required String keyField,
        required String hint,
        required String value,
        required Widget icon,
      }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RichText(
        text: TextSpan(
          text: label,
          style: TextStyle(
            color: Colors.black,
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.bold,
          ),
          children: keyField == 'phone'
              ? const [
            TextSpan(
              text: ' * ',
              style: TextStyle(
                color: KprimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]
              : [],
        ),
      ),
      SizedBox(height: screenWidth * 0.015),
      SizedBox(
        height: screenWidth * 0.12,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color(0xffFAFAFA),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xff333333)),
          ),
          child: TextField(
            controller: TextEditingController(text: value),
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              color: KprimaryText,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                vertical: screenWidth * 0.035,
                horizontal: screenWidth * 0.035,
              ),
              suffixIcon: icon,
            ),
            onChanged: (val) {
              context.read<EditProfileCubit>().updateField(keyField, val);
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(40),
            ],
          ),
        ),
      ),
    ]);
  }

  // أزرار الحفظ والإلغاء
  Widget _buildSaveCancelButtons(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: screenWidth * 0.12,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Color(0xffE72929)),
                ),
                backgroundColor: SecoundColor,
              ),
              child: Center(
                child: Text(
                  S.of(context).cancel,
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffE72929),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            height: screenWidth * 0.12,
            child: ElevatedButton(
              onPressed: () {
                // TODO: save logic here
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: KprimaryColor,
              ),
              child: Text(
                S.of(context).save,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
