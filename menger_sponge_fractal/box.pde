
// The Box class
class Box {

  // Variables for position and radius
  PVector pos;
  float r;

  // Initialize the box with position and radius
  Box( float x, float y, float z, float r_) {
    pos = new PVector(x, y, z);
    r = r_;
  }

  // Generate the next generation of boxes
  ArrayList<Box> generate() {

    // Initialize the list of boxes for the next generation
    ArrayList<Box> boxes = new ArrayList<Box>();

    // For x, y and z
    for (int x = -1; x < 2; x++) {
      for (int y = -1; y < 2; y++) {
        for (int z = -1; z < 2; z++) {

          // If the box is in the next generation (not in the middle)
          if (abs(x) + abs(y) + abs(z) > 1) {

            // Divide it's radius, create the box with the right place and size
            float newR = r / 3;
            Box b = new Box(pos.x + x * newR, pos.y + y * newR, pos.z + z * newR, newR);

            // Add the box to the list
            boxes.add(b);
          }
        }
      }
    }

    // return the list of boxes
    return boxes;
  }

  // Draw the box
  void show() {

    // No stroke and fill white
    noStroke();
    fill(255);

    // Draw a box with the right position and size and go back to the previous position
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    box(r);
    popMatrix();
  }
}
