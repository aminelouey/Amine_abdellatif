import 'package:flutter/material.dart';
import 'patient.dart';
import 'theme_service.dart';
import 'sidebar.dart';
import 'patient_table.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final ThemeService themeService;

  const HomeScreen({
    super.key,
    required this.themeService,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSidebarOpen = true;
  final TextEditingController _searchController = TextEditingController();

  // Données d'exemple pour les patients
  final List<Patient> _patients = [
    Patient(
        id: 1,
        name: 'Jean Dupont',
        age: 45,
        gender: 'M',
        condition: 'Hypertension',
        lastVisit: '15/03/2024'),
    Patient(
        id: 2,
        name: 'Marie Laurent',
        age: 32,
        gender: 'F',
        condition: 'Diabète',
        lastVisit: '22/03/2024'),
    Patient(
        id: 3,
        name: 'Pierre Martin',
        age: 58,
        gender: 'M',
        condition: 'Arthrite',
        lastVisit: '10/03/2024'),
    Patient(
        id: 4,
        name: 'Sophie Petit',
        age: 27,
        gender: 'F',
        condition: 'Migraine',
        lastVisit: '28/03/2024'),
    Patient(
        id: 5,
        name: 'Thomas Bernard',
        age: 41,
        gender: 'M',
        condition: 'Asthme',
        lastVisit: '05/04/2024'),
    Patient(
        id: 1,
        name: 'Jean Dupont',
        age: 45,
        gender: 'M',
        condition: 'Hypertension',
        lastVisit: '15/03/2024'),
    Patient(
        id: 2,
        name: 'Marie Laurent',
        age: 32,
        gender: 'F',
        condition: 'Diabète',
        lastVisit: '22/03/2024'),
    Patient(
        id: 3,
        name: 'Pierre Martin',
        age: 58,
        gender: 'M',
        condition: 'Arthrite',
        lastVisit: '10/03/2024'),
    Patient(
        id: 4,
        name: 'Sophie Petit',
        age: 27,
        gender: 'F',
        condition: 'Migraine',
        lastVisit: '28/03/2024'),
    Patient(
        id: 5,
        name: 'Thomas Bernard',
        age: 41,
        gender: 'M',
        condition: 'Asthme',
        lastVisit: '05/04/2024'),
    Patient(
        id: 1,
        name: 'Jean Dupont',
        age: 45,
        gender: 'M',
        condition: 'Hypertension',
        lastVisit: '15/03/2024'),
    Patient(
        id: 2,
        name: 'Marie Laurent',
        age: 32,
        gender: 'F',
        condition: 'Diabète',
        lastVisit: '22/03/2024'),
    Patient(
        id: 3,
        name: 'Pierre Martin',
        age: 58,
        gender: 'M',
        condition: 'Arthrite',
        lastVisit: '10/03/2024'),
    Patient(
        id: 4,
        name: 'Sophie Petit',
        age: 27,
        gender: 'F',
        condition: 'Migraine',
        lastVisit: '28/03/2024'),
    Patient(
        id: 5,
        name: 'Thomas Bernard',
        age: 41,
        gender: 'M',
        condition: 'Asthme',
        lastVisit: '05/04/2024'),
  ];

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    final double screen = MediaQuery.of(context).size.width;
    debugPrint('Largeur de l\'écran: $screen');

    return Scaffold(
      body: Row(
        children: [
          Sidebar(
            isOpen: _isSidebarOpen,
            onToggle: _toggleSidebar,
          ),
          Expanded(
            // 🟢 Garde Expanded ici car Row a déjà une largeur définie
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  _buildAppBar(themeService),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: _buildSearchBar(),
                  ),
                  const SizedBox(height: 40),

                  // Liste des Patient: ✅ Correction de Row contenant Expanded
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            const Icon(Icons.list),
                            const SizedBox(width: 8),
                            const Text(
                              'Listes des Patients : ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                              ),
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            // bar de recherche List: 🔄 Remplacement de `Expanded` par `Flexible`
                            Flexible(
                              child: SizedBox(
                                width: (screen > 900) ? 447 : screen - 250,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Rechercher un patient...',
                                    hintStyle: const TextStyle(
                                        fontWeight: FontWeight.w100),
                                    prefixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 5),

                            // ✅ Fixe le bouton "Nouveau Patient"
                            Container(
                              width: 200,
                              height: 43,
                              decoration: BoxDecoration(
                                color: themeService.isDarkMode
                                    ? const Color(0xFFFFFFFF)
                                    : const Color.fromARGB(255, 100, 147, 255),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      size: 28,
                                    ),
                                    SizedBox(width: 13),
                                    Text(
                                      'Nouveau Patient',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 1),

                  // ✅ Fixe le tableau des patients
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 60),
                        PatientTable(patients: _patients),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(ThemeService themeService) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: themeService.isDarkMode
                ? const Color(0xFFFFFFFF).withOpacity(0.0)
                : const Color.fromARGB(255, 0, 48, 158).withOpacity(0.0),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.people),
          const SizedBox(width: 8),
          const Text(
            'Gestion des Patients',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins"),
          ),
          const Spacer(),
          // Bouton thème
          IconButton(
            icon: Icon(
                themeService.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeService.toggleTheme(),
            tooltip: 'Changer de thème',
          ),
          // Bouton profil
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
            tooltip: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Flexible(
          child: SizedBox(
            width: MediaQuery.of(context).size.width > 900
                ? 900
                : MediaQuery.of(context).size.width, // Spécifiez la largeur ici
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher un patient , group...',
                hintStyle: const TextStyle(fontWeight: FontWeight.w100),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
