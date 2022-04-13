import java.util.concurrent.ThreadLocalRandom;

public class AccountHolder {
    protected int ID;
    protected String address;

    public AccountHolder(int ID, String address) {
        this.ID = ID;
        this.address = address;
    }

    public int getNextID() {
        return ThreadLocalRandom.current().nextInt(1, 1000000 + 1);
    }
}