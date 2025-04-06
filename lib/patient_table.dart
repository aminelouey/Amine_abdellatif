import 'package:flutter/material.dart';
import 'patient.dart';

class PatientTable extends StatelessWidget {
  final List<Patient> patients;

  const PatientTable({
    super.key,
    required this.patients,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: MediaQuery.of(context).size.width > 900
            ? 900
            : MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          //height: MediaQuery.of(context).size.height * 0.6,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Nom')),
                DataColumn(label: Text('Âge')),
                DataColumn(label: Text('Genre')),
                DataColumn(label: Text('Condition')),
                DataColumn(label: Text('Dernière Visite')),
                DataColumn(label: Text('Actions')),
              ],
              rows: patients.map((patient) {
                return DataRow(
                  cells: [
                    DataCell(Text(patient.id.toString())),
                    DataCell(Text(patient.name)),
                    DataCell(Text(patient.age.toString())),
                    DataCell(Text(patient.gender)),
                    DataCell(Text(patient.condition)),
                    DataCell(Text(patient.lastVisit)),
                    DataCell(
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('Éditer'),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.red,
                            ),
                            child: const Text('Supprimer'),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
