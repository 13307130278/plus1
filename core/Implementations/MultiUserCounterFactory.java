package Implementations;
import Interfaces.AbstractMultiUserCounterFactory;
/**
 * Created by billlai on 08/Oct/2016.
 */
public class MultiUserCounterFactory implements AbstractMultiUserCounterFactory {
    private static MultiUserCounterFactory ourInstance = new MultiUserCounterFactory();

    public static MultiUserCounterFactory getInstance() {
        return ourInstance;
    }

    private MultiUserCounterFactory() {
    }
}
