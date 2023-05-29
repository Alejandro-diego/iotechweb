import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/Project.dart';
import '../../../responsive.dart';


import '../../preset_img/prensentatios.dart';

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
          Row(
            children: [
              Hero(
                tag: project.refTag!,
                child: Container(
                  width: 100.00,
                  height: 100.00,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: ExactAssetImage(project.imageAsstes!),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>  PresetantionImg(assetsImg: project.imageAsstes!, refTag: project.refTag!,),
                    ),
                  );
               
                },
                child: const Text(
                  "Saber Mais >>",
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  
}
