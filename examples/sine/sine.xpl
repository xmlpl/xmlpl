import xmlpl.process;
import xmlpl.unistd;
import xmlpl.stdio;
import xmlpl.string;
import xmlpl.math;

integer dim = 47;
real xScale = 3.74;
real tolerance = 0.5;

string[] clear() {"\033[H\033[2J";}

boolean near(real x, real t) {
  return t - tolerance < x && x < t + tolerance;
}

boolean wave(integer t, real x, real y, real speed, integer orientation, real period, real width) {
  real target;

  if (orientation == 0) {
    target = cos(x / (dim / 6.48) * period + t * -speed / 6.48) * dim / 2 * width;
    return near(y, target) || near(-y, target);

  } else {
    target = cos(y / (dim / 6.48) * period + t * -speed / 6.48) * dim / 2 * width;
    return near(x, target) || near(-x, target);
  }
}

boolean f(integer page, real x, real y) {
  if (wave(page, x, y, 1.5, 0, 5, 1.0 / 5) ||
      wave(page, x, y, 1, 0, 1, 1) ||
      wave(page, x, y, 1, 1, 1, 0.5) ||
      wave(page, x, y, -2, 1, 1, 0.33)) return true;

  return false;
}

string[] page(integer p) {
  real x;
  real y;
  boolean b = true;

  clear();
  for (y = -dim / 2; y < dim / 2; y = y + 1) {
    for (x = -dim / 2 * xScale; x < dim / 2 * xScale; x = x + 1)
      if (f(p, x / xScale, y)) {
        if (b) "0";
        else "1";
        b = !b;
      } else " ";
    
    if (y + 1 < dim) "\n";
  }
}

node[] main() {
  integer i;

  while (true) {
    for (i = 0; i < 360; i++) {
      page(i);
      flush();
      usleep(100000);
    }
  }

  clear();
}
