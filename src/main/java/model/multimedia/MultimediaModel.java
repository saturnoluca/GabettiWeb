package model.multimedia;

import java.io.IOException;
import java.sql.SQLException;

public interface MultimediaModel<T> {
    public void doSaveFoto(MultimediaBean multi) throws SQLException, IOException;
    
    public void doSaveVideo(MultimediaBean multi) throws SQLException, IOException;

}
