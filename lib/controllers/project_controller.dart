import 'package:get/get.dart';
import '../models/project_model.dart';

class ProjectController extends GetxController {
  final RxList<Project> projects = <Project>[].obs;
  final Rx<Project?> selectedProject = Rx<Project?>(null);

  @override
  void onInit() {
    super.onInit();
    loadProjects();
  }

  void loadProjects() {
    projects.addAll([
      Project(
        id: '1',
        name: 'Lemon App',
        description:
            'A modern mobile application for managing and tracking personal finances with features like expense tracking, budget planning, and financial insights.',
        imageUrl: 'assets/images/lemon/Screenshot_1746893705.png',
        screenshots: [
          'assets/images/lemon/Screenshot_1746893702.png',
          'assets/images/lemon/Screenshot_1746893696.png',
          'assets/images/lemon/Screenshot_1746893685.png',
          'assets/images/lemon/Screenshot_1746893710.png',
          'assets/images/lemon/Screenshot_1746893717.png',
          'assets/images/lemon/Screenshot_1746893726.png',
        ],
        technologies: [
          'Flutter',
          'Firebase',
          'GetX',
          'OpenSteerMap',
          'Rest API'
        ],
        projectUrl: 'https://github.com/yourusername/lemon-app',
      ),
      Project(
        id: '2',
        name: 'E-Commerce App',
        description:
            'A full-featured e-commerce application with product catalog, shopping cart, user authentication, and payment integration.',
        imageUrl: 'assets/images/ecommerce/Screenshot_1740924979.png',
        screenshots: [
          'assets/images/ecommerce/Screenshot_1740924961.png',
          'assets/images/ecommerce/Screenshot_1740924955.png',
          'assets/images/ecommerce/Screenshot_1740924947.png',
          'assets/images/ecommerce/Screenshot_1740924939.png',
          'assets/images/ecommerce/Screenshot_1740924928.png',
          'assets/images/ecommerce/Screenshot_1740924920.png',
        ],
        technologies: ['Flutter', 'Firebase', 'GetX', 'Rest API', 'php'],
        projectUrl: 'https://github.com/yourusername/ecommerce-app',
      ),
      Project(
        id: '3',
        name: 'Max To Go',
        description:
            'A food delivery application with real-time order tracking, restaurant listings, and seamless payment processing.',
        imageUrl: 'assets/images/max-to-go/Screenshot_1746899230.png',
        screenshots: [
          'assets/images/max-to-go/Screenshot_1746899180.png',
          'assets/images/max-to-go/Screenshot_1746896337.png',
          'assets/images/max-to-go/Screenshot_1746896314.png',
          'assets/images/max-to-go/Screenshot_1746896307.png',
          'assets/images/max-to-go/Screenshot_1746896296.png',
          'assets/images/max-to-go/Screenshot_1746896282.png',
        ],
        technologies: [
          'Flutter',
          'Firebase',
          'GetX',
          'Google Maps',
          'Rest API'
        ],
        projectUrl: 'https://github.com/yourusername/max-to-go',
      ),
      Project(
        id: '4',
        name: 'Delicous',
        description:
            'A food delivery and restaurant management application with features for ordering, tracking, and managing restaurant operations.',
        imageUrl: 'assets/images/delicous/Screenshot_1746960741.png',
        screenshots: [
          'assets/images/delicous/Screenshot_1746960741.png',
          'assets/images/delicous/Screenshot_1746960725.png',
          'assets/images/delicous/Screenshot_1746960709.png',
          'assets/images/delicous/Screenshot_1746960690.png',
          'assets/images/delicous/Screenshot_1746960686.png',
          'assets/images/delicous/Screenshot_1746960672.png',
        ],
        technologies: ['Flutter', 'Firebase', 'Bloc', 'Rest API'],
        projectUrl: 'https://github.com/yourusername/delicous',
      ),
      Project(
        id: '5',
        name: 'Kefak',
        description:
            'A comprehensive food delivery platform with advanced features for both customers and restaurant owners.',
        imageUrl: 'assets/images/kefak/Screenshot_1746962796.png',
        screenshots: [
          'assets/images/kefak/Screenshot_1746962796.png',
          'assets/images/kefak/Screenshot_1746962785.png',
          'assets/images/kefak/Screenshot_1746962771.png',
          'assets/images/kefak/Screenshot_1746962768.png',
          'assets/images/kefak/Screenshot_1746962437.png',
          'assets/images/kefak/Screenshot_1746962426.png',
          'assets/images/kefak/Screenshot_1746962404.png',
          'assets/images/kefak/Screenshot_1746962401.png',
          'assets/images/kefak/Screenshot_1746962350.png',
          'assets/images/kefak/Screenshot_1746962344.png',
        ],
        technologies: ['Flutter', 'Firebase', 'Bloc', 'Rest API'],
        projectUrl: 'https://github.com/yourusername/kefak',
      ),
    ]);
  }

  void selectProject(Project project) {
    selectedProject.value = project;
  }
}
