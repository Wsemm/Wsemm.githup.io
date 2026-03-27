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
            'A modern mobile application for managing and tracking personal health and shopping healthy products.',
        imageUrl: 'assets/images/lemon/lemon-1.jpg',
        screenshots: [
          'assets/images/lemon/lemon-2.jpg',
          'assets/images/lemon/lemon-3.jpg',
          'assets/images/lemon/lemon-4.jpg',
          'assets/images/lemon/lemon-5.jpg',
          'assets/images/lemon/lemon-6.jpg',
          'assets/images/lemon/lemon-7.jpg',
          'assets/images/lemon/lemon-8.jpg',
          'assets/images/lemon/lemon-9.jpg',
          'assets/images/lemon/lemon-10.jpg',
          'assets/images/lemon/lemon-11.jpg',
        ],
        technologies: [
          'Flutter',
          'Firebase',
          'GetX',
          'OpenSteerMap',
          'Rest API'
        ],
        // projectUrl: 'https://github.com/yourusername/lemon-app',
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
        projectUrl: 'https://github.com/Wsemm/Ecommerce-Front-End',
      ),
      Project(
        id: '3',
        name: 'Max To Go',
        description:
            'A mobile application that helps you to transfer your old home to your new home in the city you want to go.',
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
        projectUrl: 'https://github.com/Wsemm/Delicious',
      ),
      Project(
        id: '5',
        name: 'Kefak',
        description:
            'A Simple Social Media App for sharing thoughts and ideas with friends.',
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
        projectUrl: 'https://github.com/Wsemm/Kefak',
      ),
      Project(
        id: '6',
        name: 'Gym Zone',
        description:
            'A modern mobile application for managing health & fitness and gyms.',
        imageUrl: 'assets/images/gym-zone/gym-zone-1.jpg',
        screenshots: [
          'assets/images/gym-zone/gym-zone-2.jpg',
          'assets/images/gym-zone/gym-zone-3.jpg',
          'assets/images/gym-zone/gym-zone-4.jpg',
          'assets/images/gym-zone/gym-zone-5.jpg',
          'assets/images/gym-zone/gym-zone-6.jpg',
          'assets/images/gym-zone/gym-zone-7.jpg',
          'assets/images/gym-zone/gym-zone-8.jpg',
          'assets/images/gym-zone/gym-zone-9.jpg',
          'assets/images/gym-zone/gym-zone-10.jpg',
          'assets/images/gym-zone/gym-zone-11.jpg',
        ],
        technologies: [
          'Flutter',
          'Firebase',
          'CodeMagic',
          'GetX',
          'ShoreBird',
          'Rest API'
        ],
        // projectUrl: 'https://github.com/yourusername/lemon-app',
        projectPlayStoreUrl:
            'https://play.google.com/store/apps/details?id=com.pixllmall.gym_zones&hl=en',
      ),
      Project(
        id: '7',
        name: 'Oman Sale',
        description:
            'beautiful application for buying and selling items that consist of many categories and subcategories.',
        imageUrl: 'assets/images/oman sale/11.png',
        screenshots: [
          'assets/images/oman sale/1.png',
          'assets/images/oman sale/2.png',
          'assets/images/oman sale/3.png',
          'assets/images/oman sale/4.png',
          'assets/images/oman sale/5.png',
          'assets/images/oman sale/6.png',
          'assets/images/oman sale/7.png',
          'assets/images/oman sale/8.png',
          'assets/images/oman sale/9.png',
          'assets/images/oman sale/10.png',
        ],
        technologies: ['Flutter', 'GetX', 'CodeMagic', 'Firebase', 'Rest API'],
        projectPlayStoreUrl:
            'https://play.google.com/store/apps/details?id=com.pixllmall.sooq.sooq_sale&hl=af',
        // projectUrl: 'https://github.com/yourusername/lemon-app',
      )
    ]);
  }

  void selectProject(Project project) {
    selectedProject.value = project;
  }
}
