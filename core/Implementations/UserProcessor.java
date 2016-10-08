package Implementations;

import Interfaces.AbstractUserProcessor;

/**
 * Created by billlai on 08/Oct/2016.
 */
class UserProcessor implements AbstractUserProcessor {
    public static final int SIGN_IN_SECCEEDED = 0;
    private static UserProcessor ourInstance = new UserProcessor();

    static UserProcessor getInstance() {
        return ourInstance;
    }

    private UserProcessor() {
    }

    @Override
    public boolean isUsernameAvailable(String username) {
        // TODO
        return false;
    }

    @Override
    public int signIn(String username, String password) {
        // TODO
        return 0;
    }

    @Override
    public int createUser(String username, String password) {
        // TODO
        return 0;
    }
}
