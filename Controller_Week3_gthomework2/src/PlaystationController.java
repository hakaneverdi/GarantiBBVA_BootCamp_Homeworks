public class PlaystationController implements GameController {
    @Override
    public void pressButton() {
        System.out.println("button pressed");
    }

    @Override
    public void moveJoystick() {
        System.out.println("joystick moved");
    }
}
