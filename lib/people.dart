class Type {
  String name;
  String bloodtype;
  String email;
  int number;

  Type(this.name, this.bloodtype, this.email, this.number);
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}

List<Type> Types = [
  Type('Ahmad', 'O+', 'Ahmad@gmail.com', 1511154),
  Type('Khaled', 'O-', 'Ahmad@gmail.com', 2232255),
  Type('Mohamad', ' AB-', 'Ahmad@gmail.com', 3333355),
  Type('Samer', 'B+', 'Ahmad@gmail.com', 4442455),
  Type('Omar', 'A+', 'Ahmad@gmail.com', 5525535),
];
