
public abstract class Device {
    protected String deviceName;
    protected boolean isDeviceOn = false;
    protected GameController gameController;

    public Device(String deviceName) {
        this.deviceName = deviceName;
    }


    //cihazı açar zaten açıksa exception
    public void startDevice() {
        if (isDeviceOn) {
            throw new IllegalStateException("Device is already on");
        } else {
            System.out.println(deviceName + " is starting up...");
            isDeviceOn = true;
        }
    }

    //cihazı kapatır zaten kapalıysa exception
    public void shutdownDevice() {
        if (!isDeviceOn) {
            throw new IllegalStateException("Device is already off");
        } else {
            System.out.println(deviceName + " is shutting down...");
            isDeviceOn = false;
        }
    }

    public abstract void addController(GameController gameController);

    //oyunu başlatır, cihaz kapalıysa exception
    public void playGame() {
        if (!isDeviceOn) {
            throw new IllegalStateException("Device is off. Cannot play game");
        } else {
            System.out.println("Starting game on " + deviceName + "...");
        }
    }
}
