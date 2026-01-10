import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';
import 'package:saas_dashboard/presentation/widgets/cus_label_textfield.dart';

class SignUpForm extends StatefulWidget {
  final Function toLogIn;
  const SignUpForm({super.key, required this.toLogIn});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(AppConstrain.paddingMedium),
          child: SvgPicture.asset(Assets.images.logo, width: 50),
        ),
        Text("Sign Up", style: TextTheme.of(context).titleLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(Assets.images.gmail, width: 15),
                  SizedBox(width: 10),
                  Text("Google", style: TextTheme.of(context).bodySmall),
                ],
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(Assets.images.facebook, width: 8),
                  SizedBox(width: 10),
                  Text("Facebook", style: TextTheme.of(context).bodySmall),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: Divider(color: AppColors.grey)),
            Padding(padding: const EdgeInsets.all(8.0), child: Text("Or")),
            Expanded(child: Divider(color: AppColors.grey)),
          ],
        ),
        CusLabelTextfield(label: "Full Name", hintText: "JiuShuang"),
        CusLabelTextfield(
          label: "Email Address",
          hintText: "eaxmple@gmail.com",
        ),
        CusLabelTextfield(label: "Username", hintText: "johnkevine4362"),
        CusLabelTextfield(
          label: "Password",
          hintText: "Enter the Password",
          obscureText: true,
        ),
        Row(
          children: [
            Checkbox(value: false, onChanged: (value) {}),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "By creating an account you agree to the ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: TextTheme.of(context).bodySmall?.fontSize,
                      ),
                    ),
                    TextSpan(
                      text: "terms of use ",
                      style: TextStyle(
                        color: AppColors.secondColor,
                        fontSize: TextTheme.of(context).bodySmall?.fontSize,
                      ),
                    ),
                    TextSpan(
                      text: "and our",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: TextTheme.of(context).bodySmall?.fontSize,
                      ),
                    ),
                    TextSpan(
                      text: "privacy policy.",
                      style: TextStyle(
                        color: AppColors.secondColor,
                        fontSize: TextTheme.of(context).bodySmall?.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size(280, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
            ),
          ),
          onPressed: () => widget.toLogIn(),
          child: Text(
            "Create Account",
            style: TextStyle(
              fontSize: TextTheme.of(context).bodySmall?.fontSize,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Already have an account?",
                style: TextTheme.of(context).bodySmall,
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () => widget.toLogIn(),
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: AppColors.secondColor,
                      fontSize: TextTheme.of(context).bodySmall?.fontSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
