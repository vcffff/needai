import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needai/presentation/themes/colors.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Container(
              height: MediaQuery.of(context).size.width - 350,
              decoration: BoxDecoration(color: maincolor),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello from BD',
                          style: GoogleFonts.poppins(
                            color: lighttext,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Let’s start learning',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 60,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Avatar.png'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // White Card Section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Learned today',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            text: "46min",
                            style: GoogleFonts.poppins(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: "/60min",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 200,
                          child: LinearProgressIndicator(
                            value: 46 / 60,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.orange,
                            ),
                            minHeight: 8,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'My courses',
                        style: GoogleFonts.poppins(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
