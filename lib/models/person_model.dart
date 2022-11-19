class PersonModel {
  final String fname, mname, lname, occupation, gender;
  final int id, age;

  PersonModel(
      {required this.age,
      required this.fname,
      required this.id,
      required this.lname,
      required this.mname,
      required this.occupation,
      required this.gender});
}
