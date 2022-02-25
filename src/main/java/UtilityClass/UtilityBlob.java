package UtilityClass;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;

public interface UtilityBlob {
    public static byte[] blobToBytes(Blob element) throws SQLException {
        byte[] array = element.getBytes(1, (int) element.length());
        return array;
    }

    public static String base64ImageString(byte[] src) {
        String encoded = Base64.getEncoder().encodeToString(src);
        return encoded;
    }
}
