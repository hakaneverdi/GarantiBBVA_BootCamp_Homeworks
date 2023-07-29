import java.util.Scanner;

public class Operations {
    private Scanner scanner = new Scanner(System.in);
    private Device device;

    //cihaz seçimi
    public void chooseDevice() {
        while (true) {
            System.out.println("Please choose a device: \n1-Computer \n2-Playstation \n3-Xbox");
            int input = scanner.nextInt();
            switch (input) {
                case 1:
                    device = new Computer("Computer");
                    return;
                case 2:
                    device = new Playstation("Playstation");
                    return;
                case 3:
                    device = new Xbox("Xbox");
                    return;
                default:
                    System.out.println("Invalid choice. Please enter 1, 2, or 3.");
            }
        }
    }


    //cihazı açıp kapatma
    public void manageDevice() {
        while (true) {
            System.out.println("1-Start device \n2-Shutdown device");
            int input = scanner.nextInt();
            switch (input) {
                case 1:
                    device.startDevice();
                    return;
                case 2:
                    device.shutdownDevice();
                    return;
                default:
                    System.out.println("Invalid choice. Please enter 1 or 2.");
            }
        }
    }

    // cihaza kontrol cihazı ekler
    //kol uyumsuzsa exception
    public void addControllerToDevice() {
        while (true) {
            System.out.println("Please choose a controller: \n1-Playstation Controller \n2-Xbox Controller");
            int input = scanner.nextInt();
            try {
                switch (input) {
                    case 1:
                        device.addController(new PlaystationController());
                        return;
                    case 2:
                        device.addController(new XboxController());
                        return;
                    default:
                        System.out.println("Invalid choice. Please enter 1 or 2.");
                }
            } catch (IllegalArgumentException e) {
                System.out.println(e.getMessage());
            }
        }
    }

    public void startGame() {
        device.playGame();
    }
}
