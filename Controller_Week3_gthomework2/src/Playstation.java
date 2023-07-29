public class Playstation extends Device {

    public Playstation(String deviceName) {
        super(deviceName);
    }

    //instanceof sayesinde
    //controller ve bağlanılan cihazın uyumlu olup olmadığı kontrol ediliyor
    @Override
    public void addController(GameController gameController) {
        if (!(gameController instanceof PlaystationController)) {
            throw new IllegalArgumentException("You can only add Playstation controllers to a Playstation");
        }
        this.gameController = gameController;
        System.out.println(deviceName + " has a Playstation controller");
    }
}
