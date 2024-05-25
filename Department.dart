class Department
{
  int? id;
  String label;
  String mission;

  /* Constructeur avec arguments */
  Department({this.id, required this.label, required this.mission});

  /* Constructeur à partir de données Json */
  /*  jsonData : les données json sont stockées dans un Map<clé,valeur>
                  la clé : nom attributs
                  la valeur : la valeur de l'attribut
   */
  factory Department.fromJson( Map<String,dynamic>jsonData)
  {
    //récupération des données du Department à partir du Map
    int id = jsonData['id'];
    String label = jsonData['label'];
    String mission = jsonData['mission'];

    //retourner un objet Department en fonction des données récupérées
    return Department(id:id,label:label, mission:mission);
  }

  /*
    convertir de objet à Map
   */

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'mission': mission,
    };
  }



  @override
  String toString() {
    return 'Department{id: $id, label: $label, mission: $mission}';
  }


}