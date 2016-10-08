import java.util.list;
package Interfaces;

/**
 * Created by billlai on 08/Oct/2016.
 */
public interface AbstractSystem {

    // user
    public int createUser(String username, String password);
    public boolean isUsernameAvailable(String username);
    public int signIn(String username, String password);

    // create counter
        // single user
    public int createSingleUserCounter(String counterName, double value, double step, String unit);

        // multi user
    private int createMultiUserCounter(String counterId, String counterPassword);
    public boolean isCounterIdAvailable(String counterId);
    public boolean isCounterIdLegal(String counterId);
    public int createMultiUserCounter(String counterName, double value, double step, String unit);

    public boolean isAbleToAddMultiUserCounter(String counterId, String counterPassword);
    public int addMultiUserCounter(String counterId, String counterPassword);

    // count
    public int count(String counterId);
    public int count(String counterId, boolean isMinus);

    // delete
    public int deleteCounter(String counterId);

    // backup
    public int backup();

    // change counter info
    public int changeCounterInfo(String counterId, String newCounterName, double value, double step, String unit);

    // getter of Counters
    public List<Counter> getCounters();

    // gettor of username
    public String getUsername();

    // others
}
