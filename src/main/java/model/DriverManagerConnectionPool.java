package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;


public class DriverManagerConnectionPool {
    private static List<Connection> freeDbConnections;

    static {
        freeDbConnections = new LinkedList<Connection>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private static synchronized Connection createDbConnection() throws SQLException {
        Connection newConnection = null;
        String ip = "localhost";
        String port = "3306";
        String db = "gabetti";
        String username = "root";
        String password = "123456Aa/";
        String url = "jdbc:mysql://localhost:3306/mydb";
        newConnection = DriverManager.getConnection(url,username,password);
        newConnection.setAutoCommit(false);
        return newConnection;
    }

    /**
     * Creazione di una connessione.
     */
    public static synchronized Connection getConnection() throws SQLException {
        Connection connection;
        if (!freeDbConnections.isEmpty()) {
            connection = (Connection) freeDbConnections.get(0);
            freeDbConnections.remove(0);
            if (connection.isClosed()) {
                connection = getConnection();
            }

        } else {
            connection = createDbConnection();
        }
        return connection;
    }

    /**
     * Rilascio connessione.
     */
    public static synchronized void releaseConnection(Connection connection) throws SQLException {
        if (connection != null) {
            freeDbConnections.add(connection);
        }
    }

}
