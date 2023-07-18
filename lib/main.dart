import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcp/basic_details/birth.dart';
import 'package:mcp/basic_details/institution.dart';
import 'package:mcp/basic_details/pregnancy.dart';
import 'basic_details/family.dart';
import 'colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.sourceSans3TextTheme(),),
      home: const Scaffold(body: MyAppContent(),),
      routes: {
        '/basic-details/family' : (context) => const FamilyApp(),
        '/basic-details/pregnancy' : (context) => const PregnancyApp(),
        '/basic-details/birth' : (context) => const BirthApp(),
        '/basic-details/institution' : (context) => const InstitutionApp(),
      },);
  }
}

class MyAppContent extends StatelessWidget {
  const MyAppContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      elevation: 1,
      backgroundColor: AppColors.surface,
      titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold, color: AppColors.onSurface),
      leading: IconButton(onPressed: () {
        exit(0);
      }, icon: const Icon(Icons.arrow_back, color: AppColors.onSurface,),),
      title: const Text("Card Details", style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.onSurface,
          fontSize: 18),),
      centerTitle: true,), body: const MyAppBody(),);
  }
}

class MyAppBody extends StatelessWidget {
  const MyAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(width: double.maxFinite,
      child: const SingleChildScrollView(child: Column(children: [
        CardHeader(),
        BasicInfo(),
        CheckupForMother(),
        CheckupForChild()
      ],)),);
  }
}

class CardHeader extends StatelessWidget {
  const CardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Container(padding: const EdgeInsets.all(8),
          child: Image.asset(
            'assets/images/profile_placeholder.png', width: 80, height: 80,),),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Card ID: MCPC0004", style: TextStyle(
                color: AppColors.onBackground, fontWeight: FontWeight.bold),),
            const Text("Created Date: Aug 18, 2022"),
            Padding(padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Row(children: [
                FilledButton(style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        const RoundedRectangleBorder(borderRadius: BorderRadius
                            .all(Radius.circular(4)))),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.redAccent)),
                    onPressed: () => {},
                    child: const Text("Pregnancy High Risk")),
                Container(margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: FilledButton(style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(4)))),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueAccent)),
                      onPressed: () => {},
                      child: const Text("Send email")),)
              ],),)
          ],)
      ],),);
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(width: double.maxFinite,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 234, 234, 234)),
        child: Center(child: Text(title, style: const TextStyle(
            color: AppColors.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 18)),));
  }
}

class BasicInfo extends StatelessWidget {
  const BasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: "Basic Details"),
        Container(padding: const EdgeInsets.all(2),
          child: Column(children: [
            Row(children: [
              BasicInfoItem(title: 'Family',
                image: 'family',
                onTap: () => {
                  Navigator.pushNamed(context, '/basic-details/family')
                },

              ),
              BasicInfoItem(title: 'Pregnancy',
                image: 'pregnancy',
                onTap: () => {
                  Navigator.pushNamed(context, '/basic-details/pregnancy')
                },),
            ],),
            Row(children: [
              BasicInfoItem(title: 'Birth',
                image: 'birth',
                onTap: () => {
                  Navigator.pushNamed(context, '/basic-details/birth')
                },),
              BasicInfoItem(title: 'Institution',
                image: 'institution',
                onTap: () => {
                  Navigator.pushNamed(context, '/basic-details/institution')
                },),
            ],)
          ],),)
      ],);
  }
}

class BasicInfoItem extends StatelessWidget {
  const BasicInfoItem(
      {super.key, required this.onTap, required this.title, required this.image});

  final String title, image;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: InkWell(borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Padding(padding: const EdgeInsets.all(2),
        child: Container(decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: AppColors.borderBetweenSurfaceAndBackground),
          color: Colors.white.withOpacity(0.5),),
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Image.asset("assets/images/$image.png", width: 40, height: 40,),
            Padding(padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Text(title, style: const TextStyle(
                  color: AppColors.onSurface, fontSize: 16),),)
          ],),),),));
  }
}

class CheckupForMother extends StatelessWidget {
  const CheckupForMother({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      SectionTitle(title: "Healthcare Check for Mother"),
      CheckForMotherItem(title: "Regular Checkup", image: "hospital"),
      CheckForMotherItem(title: "Antenatal Care", image: "pregnant"),
      CheckForMotherItem(title: "Post Natal Care", image: "post_natal"),
    ],);
  }
}

class CheckForMotherItem extends StatelessWidget {
  const CheckForMotherItem(
      {super.key, required this.title, required this.image,});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(2),
      child: Container(decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.borderBetweenSurfaceAndBackground,),),
        child: Padding(padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(children: [
              Image.asset("assets/images/$image.png", width: 48, height: 48,),
              const SizedBox(width: 8),
              Text(title),
              const Spacer(),
              OutlinedButton(onPressed: () {}, child: const Text("Update"),),
            ],),
          ],),),),);
  }
}

class CheckupForChild extends StatelessWidget {
  const CheckupForChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SectionTitle(title: "Healthcare Check for Baby"),
      Container(width: double.infinity,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 218, 241, 255)),
        padding: const EdgeInsets.all(8),
        child: RichText(text: const TextSpan(style: TextStyle(
          color: Color.fromARGB(255, 0, 127, 178),
          fontWeight: FontWeight.bold,),
          children: [
            TextSpan(text: 'Birth to 6 months: '),
            TextSpan(text: 'early and exclusive breast feeding',
              style: TextStyle(fontWeight: FontWeight.normal,),),
          ],),),),
    ],);
  }
}