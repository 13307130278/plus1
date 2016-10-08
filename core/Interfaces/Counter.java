package Interfaces;

/**
 * Created by billlai on 08/Oct/2016.
 */
public interface Counter {
    const double DEFAULT_VALUE = 0.0;
    const double DEFAULT_STEP = 1.0;
    const String DEFAULT_UNIT = "";

    // setter
    public int setCounterInfo
    (String counterName, double value, double step, String unit, String creator);

    // when looking for some counter
    public boolean isThisCounter(String counterName, String creatorName);

    // getters
    public String getCounterName();
    public double getValue();
    public double getStep();
    public String getUnit();
    public String getCreator();

    // count
    public count();
    public count(boolean isMinus);

    // others
    public boolean isSingleUserMode();
}
