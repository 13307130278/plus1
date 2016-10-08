package Implementations;
import Interfaces.AbstractBackupManager;
/**
 * Created by billlai on 08/Oct/2016.
 */
public class BackupManager implements AbstractBackupManager {
    private static BackupManager ourInstance = new BackupManager();

    public static BackupManager getInstance() {
        return ourInstance;
    }

    private BackupManager() {
    }
}
