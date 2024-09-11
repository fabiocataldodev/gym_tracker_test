class GetImagePath {
  String getImagePath(String exercise) {
    switch (exercise) {
      case 'Barbell row':
        return 'assets/barbellrow.png';
      case 'Bench press':
        return 'assets/benchpress.png';
      case 'Shoulder press':
        return 'assets/shoulderpress.png';
      case 'Deadlift':
        return 'assets/deadlift.png';
      case 'Squat':
        return 'assets/squat.png';
      default:
        return 'assets/barbellrow.png';
    }
  }
}
