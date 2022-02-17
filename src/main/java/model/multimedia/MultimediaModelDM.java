package model.multimedia;

import model.DriverManagerConnectionPool;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MultimediaModelDM implements MultimediaModel {
    private DriverManagerConnectionPool dmcp = null;

    public MultimediaModelDM() {
    }

    public MultimediaModelDM(DriverManagerConnectionPool dmcp) {
        this.dmcp = dmcp;
    }

    @Override
    public void doSaveFoto(MultimediaBean multi) throws SQLException, IOException {
        Connection connection=null;
        PreparedStatement ps=null;
        InputStream in = null;
        String insertSql=null;
        try{
            if (multi instanceof MultimediaBean){
                int i=multi.getFoto().size();
                if(i>0){
                    connection=dmcp.getConnection();
                    for(int k=1;k<i;k++){
                        System.out.println("SIUM1");
                        insertSql="INSERT INTO multimedia(foto, Appartamento_idAppartamento) VALUES(?, ?)";
                        ps=connection.prepareStatement(insertSql);
                        in=multi.getFoto().get(k).getInputStream();
                        ps.setBlob(1, in);
                        ps.setInt(2, multi.getIdAppartamento());
                        System.out.println("doSaveFoto:" + ps.toString());
                        ps.executeUpdate();
                        connection.commit();
                    }
                }
            }
            if(in!=null){
                in.close();
            }
        }finally {
            try{
                if(ps!=null){
                    ps.close();
                }
            }finally {
                dmcp.releaseConnection(connection);
            }
        }
    }

	@Override
	public void doSaveVideo(MultimediaBean multi) throws SQLException, IOException {
		Connection connection=null;
        PreparedStatement ps=null;
        InputStream in = null;
        String insertSql=null;
        try{
            if (multi instanceof MultimediaBean){
                int i=multi.getVideo().size();
                if(i>0){
                    connection=dmcp.getConnection();
                    for(int k=1;k<i;k++){
                        insertSql="INSERT INTO multimedia(video, Appartamento_idAppartamento) VALUES(?, ?)";
                        ps=connection.prepareStatement(insertSql);
                        in=multi.getVideo().get(k).getInputStream();
                        ps.setBlob(1, in);
                        ps.setInt(2, multi.getIdAppartamento());
                        System.out.println("doSaveFoto:" + ps.toString());
                        ps.executeUpdate();
                        connection.commit();
                    }
                }
            }
            if(in!=null){
                in.close();
            }
        }finally {
            try{
                if(ps!=null){
                    ps.close();
                }
            }finally {
                dmcp.releaseConnection(connection);
            }
        }
		
	}
}
