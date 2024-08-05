class PlanetModel {
  String? position;
  String?  name;
  String?  image;
  String?  velocity;
  String?  distance;
  String?   gravity;
  String?   distance_from_Sun;
  String?   orbital_period;
  String?   length_of_day;
  String?   radius;
  String?   description;

  PlanetModel(
      {this.position,
      this.name,
      this.image,
      this.velocity,
      this.distance,
      this.gravity,
      this.distance_from_Sun,
      this.orbital_period,
      this.length_of_day,
      this.radius,
      this.description});

  factory PlanetModel.mapToModel(Map m1)
  {
    return PlanetModel
      (
      description: m1['description'],
      distance: m1['distance'],
      distance_from_Sun: m1['distance_from_Sun'] ,
      gravity: m1['gravity'],
      image: m1['image'],
      length_of_day: m1['length_of_day'],
      name: m1['name'],
      orbital_period: m1['orbital_period'],
      position: m1['position'],
      radius: m1['radius'],
      velocity: m1['velocity'],
    );
  }
}
