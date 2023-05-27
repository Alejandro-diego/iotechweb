import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/Project.dart';
import '../../../responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const Spacer(),
          Text(
            project.description!,
            maxLines: Responsive.isMobileLarge(context) ? 3 : 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(height: 1.5),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              _launchUr1();
            },
            child: const Text(
              "Saber Mais >>",
              style: TextStyle(color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUr1() async {
    if (!await launchUrl(project.url!)) {
      throw Exception('Could not launch ${project.url!}');
    }
  }
}
