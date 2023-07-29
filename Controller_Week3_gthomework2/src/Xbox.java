public class Xbox extends Device {

    public Xbox(String deviceName) {
        super(deviceName);
    }

    //instanceof sayesinde
    //controller ve bağlanılan cihazın uyumlu olup olmadığı kontrol ediliyor
    @Override
    public void addController(GameController gameController) {
        if (!(gameController instanceof XboxController)) {
            throw new IllegalArgumentException("You can only add Xbox controllers to an Xbox");
        }
        this.gameController = gameController;
        System.out.println(deviceName + " has a Xbox controller");
    }
}
