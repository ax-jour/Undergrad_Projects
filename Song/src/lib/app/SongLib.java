//Xiang Ao
package lib.app;
	
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import javafx.application.Application;
import javafx.collections.ObservableList;
import javafx.fxml.FXMLLoader;
import javafx.stage.Stage;
import lib.view.LibController;
import lib.view.SongNode;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;



public class SongLib extends Application {
	@Override
	public void start(Stage primaryStage) {
		try {
			FXMLLoader loader = new FXMLLoader();
			loader.setLocation(getClass().getResource("/lib/view/SongLib.fxml"));
			AnchorPane root = (AnchorPane)loader.load();
			Scene scene = new Scene(root);
			LibController libController = loader.getController();
			libController.hideAdd();
			libController.hideEdit();
			libController.hideWarn();
//			libController.hideDuplicated();
			libController.obsL();
			primaryStage.setScene(scene);
			primaryStage.setTitle("Song Library");
			primaryStage.setResizable(false);
			primaryStage.setOnCloseRequest(event -> {
				ObservableList<SongNode> songList = libController.getList();
				try {
					saveFile(songList);
				} catch (IOException e) {
					e.printStackTrace();
				}
			});
			primaryStage.show();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void saveFile(List<SongNode> l) throws IOException {
		File file = new File("src/lib/view/SongList.txt");
		FileWriter fw = new FileWriter(file);
		for(SongNode songNode:l) {
			fw.write(songNode.getName()
					+"\n"+songNode.getArtist()
					+"\n"+songNode.getAlbum()
					+"\n"+songNode.getYear()+"\n");
		}
		fw.close();
		
	}
	
	public static void main(String[] args) {
		launch(args);
	}
}
