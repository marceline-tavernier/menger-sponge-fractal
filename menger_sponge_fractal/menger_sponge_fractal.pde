
// Variables
float angle = 0;
ArrayList<Box> boxes;
ArrayList<ArrayList<Box>> previous;
int index = 0;

//////////////////////

// Setup
void setup() {

  // Set the size of the screen to 512x512 (and display in 3D)
  size(512, 512, P3D);

  // Change the title of the window
  surface.setTitle("The coding train challenge #2 : Menger sponge fractal");

  // Initialize the list of boxes and add the first one and add it to the list of fractals
  boxes = new ArrayList<Box>();
  boxes.add(new Box(0, 0, 0, 200));
  previous = new ArrayList<ArrayList<Box>>();
  previous.add(boxes);
}

// When a key is released
void keyReleased() {

  // If up arrow
  if (key == CODED && keyCode == UP) {

    // If the next fractal exists in the list, display it
    index += 1;
    if (previous.size() > index && previous.get(index) != null) {
      boxes = previous.get(index);
    }

    // Else create it and add it to the list
    else {

      // Initialize the next generation of boxes list
      ArrayList<Box> next = new ArrayList<Box>();

      // For each existing box, generate the next generation of boxes
      for (Box b : boxes) {
        ArrayList<Box> newBoxes = b.generate();

        // Add each generated box to the list
        next.addAll(newBoxes);
      }

      // Set the list of boxes to the new one and add it to the list of fractals
      boxes = next;
      previous.add(boxes);
    }
  }

  // If down arrow
  else if (key == CODED && keyCode == DOWN && index > 0) {

    // The box displayed is the previous one
    index -= 1;
    boxes = previous.get(index);
  }
}

// Draw everything
void draw() {

  // Put the background color to black
  background(0);

  // Add lights
  lights();

  // Move to the middle of the screen
  translate(width / 2, height / 2);

  // Rotate the cube in the x and y coordinates
  rotateX(angle);
  rotateY(angle);

  // Draw all the boxes
  for (Box b : boxes) {
    b.show();
  }

  // Add 0.01 to the angle of x and y
  angle += 0.01;
}
