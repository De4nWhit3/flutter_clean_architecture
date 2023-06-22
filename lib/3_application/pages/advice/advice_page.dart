import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/3_application/core/services/theme_service.dart';
import 'package:flutter_clean_architecture/3_application/core/widgets/custom_button.dart';
import 'package:flutter_clean_architecture/3_application/pages/advice/widgets/advice_field.dart';
import 'package:flutter_clean_architecture/3_application/pages/advice/widgets/error_message.dart';
import 'package:provider/provider.dart';

class AdviserPage extends StatelessWidget {
  const AdviserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My app title',
          style: themeData.textTheme.headlineMedium,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) {
              Provider.of<ThemeService>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(
              child: Center(
                  child: ErrorMessage(message: 'Oops! Something went wrong.')
                  // child: AdviceField(advice: 'Your day will be good!'),
                  // child: CircularProgressIndicator(
                  //   color: themeData.colorScheme.secondary,
                  // ),
                  // child: Text(
                  //   'Your advice is wating for you,',
                  //   style: themeData.textTheme.bodyMedium,
                  // ),
                  ),
            ),
            SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
