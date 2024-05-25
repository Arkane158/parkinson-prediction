import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/profile/privacy%20policy/expandable_container.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});
  static const String screenName = 'about_us_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ExpandableContainer(
                        title: 'Our Mission',
                        content:
                            "At ParkiCare, our mission is to revolutionize healthcare by empowering doctors with advanced predictive tools in predict parkinson disase. We believe that with the right technology, medical professionals can make more informed decisions, improve patient outcomes, and enhance the efficiency of healthcare delivery."),
                    ExpandableContainer(
                        title: 'Who We Are',
                        content:
                            'We are a team of dedicated programmers and technology enthusiasts who are passionate about making a positive impact on the medical field. With expertise in software development, machine learning, and artificial intelligence, we have come together to create an innovative solution tailored specifically for healthcare professionals'),
                    ExpandableContainer(
                        title: 'What We Do',
                        content:
                            'ParkiCare leverages state-of-the-art machine learning and artificial intelligence to provide doctors with accurate, real-time predictions. Our mobile application analyzes patient data and medical histories to forecast potential health issues, recommend treatment plans, and assist in early diagnosis. By integrating seamlessly into your workflow, ParkiCare ensures that you have the insights you need, right at your fingertips'),
                    ExpandableContainer(
                        title: 'Our Vision',
                        content:
                            "We envision a future where technology and healthcare work hand-in-hand to deliver personalized and precise medical care. Our goal is to bridge the gap between complex data and practical medical applications, making cutting-edge technology accessible and useful for every doctor"),
                    ExpandableContainer(
                        title: 'Why Choose Us',
                        content:
                            "Cutting-Edge Technology: Our app uses the latest advancements in AI and machine learning.\nUser-Friendly Interface: Designed with doctors in mind, our intuitive interface makes it easy to access and interpret predictions.\nContinuous Improvement: We are committed to constantly updating and improving our app based on user feedback and the latest research.\nDedicated Support: Our support team is always here to help you with any questions or issues.\n"),
                    ExpandableContainer(
                        title: 'Join Us on This Journey',
                        content:
                            "We invite you to join us on this exciting journey to transform healthcare. Together, we can harness the power of technology to predict, prevent, and personalize medical care, ultimately improving the lives of patients everywhere."),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
