package Implementations;
import Interfaces.AbstractSingleUserCounterFactory;
/**
 * Created by billlai on 08/Oct/2016.
 */
public class SingleUserCounterFactory implements AbstractSingleUserCounterFactory {
    private static SingleUserCounterFactory ourInstance = new SingleUserCounterFactory();

    public static SingleUserCounterFactory getInstance() {
        return ourInstance;
    }

    private SingleUserCounterFactory() {
    }
}
