package Test

import Implementations.Plus1System
import Interfaces.Counter
import com.sun.source.tree.AssertTree
import junit.framework.TestCase
import org.junit.Test
import org.junit.Assert

/**
 * Created by billlai on 09/Oct/2016.
 */
class Plus1SystemTest extends TestCase {
    private Plus1System system;
    void setUp() {
        super.setUp()
        system = Plus1System.getInstance();
        system.signIn("Lai Wenxing", "No password");
    }

    void tearDown() {

    }

    @Test
    void testAll() {
        testIsCounterIdLegal();

        testCreateSingleUserCounter();
    }


    void testCreateSingleUserCounter() {
        for (int i = 0; i < 1000; i++) {
            system.createSingleUserCounter("name" + i, i, i, "");
        }

        List<Counter> counters = system.getCounters();
        assertEquals(1000, counters.size());
        for (int i = 0; i < 1000; i++) {
            Counter counter = counters.get(i);
            assertNotNull(counter.getCounterId());
            assertEquals("name" + i, counter.getCounterName());
            assertEquals(i, counter.getValue());
            assertEquals(i, counter.getStep());
            assertEquals("", counter.getUnit());
        }
    }

    void testIsCounterIdLegal() {
        assertTrue(system.isCounterIdLegal("abcd_1234"));
        assertTrue(system.isCounterIdLegal("abcd"));
        assertTrue(system.isCounterIdLegal("1234"));
        assertTrue(system.isCounterIdLegal("abcd_"));

        assertFalse(system.isCounterIdLegal(""));
        assertFalse(system.isCounterIdLegal("a:1"));
        assertFalse(system.isCounterIdLegal(":"));
        assertFalse(system.isCounterIdLegal("abcd1234-"));
        assertFalse(system.isCounterIdLegal("_"));
        assertFalse(system.isCounterIdLegal("_abcd"));
    }

    void testCount() {
        List<Counter> counters = system.getCounters();
        for (Counter counter : counters) {
            double originValue = counter.getValue();
            system.count(counter.getCounterId());
            assertEquals(counter.getValue(), counter.step + originValue);
        }
    }

    void testCount1() {
        List<Counter> counters = system.getCounters();
        for (Counter counter : counters) {
            double originValue = counter.getValue();
            system.count(counter.getCounterId(), true);
            assertEquals(counter.getValue(), originValue - counter.step);
        }
    }

    void testDeleteCounter() {

    }

    void testChangeCounterInfo() {

    }

    void testGetCounters() {

    }

    void testGetUsername() {

    }

    void testIsCounterCreatedByMe() {

    }
}
