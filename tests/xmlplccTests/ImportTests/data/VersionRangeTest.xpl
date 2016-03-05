import test.hello <= 0.0.1 as hello1;
import test.hello < 0.0.3 as hello2;
import test.hello 0.0.2 - 0.0.3 as hello3;
import test.hello >= 0.0.3 as hello4;

node[] main() {
  hello1.hello();
  hello2.hello();
  hello3.hello();
  hello4.hello();
}
