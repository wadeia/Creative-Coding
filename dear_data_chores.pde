import processing.sound.*;

String[][] chores = {
  {"cooking", "dishes", "vacuuming", "clean room"}, //mon
  {"dishes", "vacuuming", "cooking"}, //tues
  {"cooking", "dishes", "laundry", "clean room"}, //wed
  {"dishes", "groceries"}, //thurs
  {"vacuuming", "dishes", "clean room"}, //fri
  {"dishes", "clean room"}, //sat
  {"dishes", "taking out rubbish", "vacuuming"} //sun
};

int[][] duration = {
  {75, 10, 15, 10}, //mon
  {20, 5, 30}, //tues
  {60, 15, 40, 10}, //wed
  {10, 90}, //thurs
  {5, 15, 5}, //fri
  {5, 5}, //sat
  {15, 10, 5}, //sun
};

SoundFile happySound, annoyedSound, neutralSound;


void setup() {

  size(400, 700);
  noStroke();
  textSize(12);
  textAlign(CENTER, CENTER);

  happySound = new SoundFile(this, "yay.wav");
  annoyedSound = new SoundFile(this, "scream.wav");
  neutralSound = new SoundFile(this, "okay.wav");
}

void draw() {
  background(255);

  int xSpacing = 100;
  int ySpacing = 100;
  int circlePos = 50;

  for (int day = 0; day < chores.length; day++) {
    for (int chore = 0; chore < chores[day].length; chore++) {

      float x = circlePos + chore * xSpacing;
      float y = circlePos + day * ySpacing;
      float radius = duration[day][chore] * 1.25;



      color c = ChoreColor(chores[day][chore]);

      fill(c);
      ellipse(x, y, radius, radius);


      if (dist(mouseX, mouseY, x, y) < radius / 2) {
        fill(0);
        String choreName = chores[day][chore];
        int choreDuration = duration[day][chore];
        text(choreName + ": " + choreDuration + " mins", x, y + radius / 2 + 10);
        playSound(chores[day][chore]);
      }
    }
  }
}




color ChoreColor(String chore) {
  if (chore.equals("cooking")) {
    return color(255, 0, 0);  //
  } else if (chore.equals("dishes")) {
    return color(0, 0, 255);  //
  } else if (chore.equals("vacuuming")) {
    return color(128, 0, 128);  // Purple
  } else if (chore.equals("clean room")) {
    return color(255, 165, 0);  //
  } else if (chore.equals("laundry")) {
    return color(255, 255, 0);  // Yellow
  } else if (chore.equals("taking out rubbish")) {
    return color(169, 169, 169);  // Grey
  } else if (chore.equals("groceries")) {
    return color(255, 20, 147);  // Pink
  } else {
    return color(255);
  }
}

void playSound(String chore) {
  if (chore.equals("cooking")) {
    happySound.play();
  } else if (chore.equals("dishes")) {
    annoyedSound.play();
  } else if (chore.equals("vacuuming")) {
    neutralSound.play();
  } else if (chore.equals("clean room")) {
    neutralSound.play();
  } else if (chore.equals("laundry")) {
    happySound.play();
  } else if (chore.equals("taking out rubbish")) {
    annoyedSound.play();
  } else if (chore.equals("groceries")) {
    happySound.play();
  }
}
