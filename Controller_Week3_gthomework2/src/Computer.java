public class Computer extends Device {

    public Computer(String deviceName) {
        super(deviceName);
    }

    //bilgisayara kontrol cihazı ekler
    @Override
    public void addController(GameController gameController) {
        this.gameController = gameController;
        System.out.println(deviceName + " has a controller");
    }
}
