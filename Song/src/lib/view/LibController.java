//Xiang Ao
package lib.view;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.beans.value.ChangeListener;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ListCell;

import java.io.*;
import java.util.Comparator;
//import java.util.ArrayList;
import java.util.Scanner;

public class LibController {
	public static final int ADD = 1;
	public static final int DELETE = 2;
	public static final int EDIT = 3;
	@FXML
	Button add;
	@FXML
	Button delete;
	@FXML
	Button edit;
	@FXML
	Button apply;
	@FXML
	Button cancel;
	@FXML
	Label nameLabel;
	@FXML
	Label artistLabel;
	@FXML
	Label albumLabel;
	@FXML
	Label yearLabel;
	@FXML
	TextField nameAdd;
	@FXML
	TextField artistAdd;
	@FXML
	TextField albumAdd;
	@FXML
	TextField yearAdd;
	@FXML
	TextField nameEdit;
	@FXML
	TextField artistEdit;
	@FXML
	TextField albumEdit;
	@FXML
	TextField yearEdit;
	@FXML
	ListView<SongNode> listView;
	@FXML
	GridPane addDisplay;
	@FXML
	GridPane editDisplay;
	@FXML
	Label warningLabel;
	@FXML
	Label duplicatedLabel;

	ObservableList<SongNode> songList;
	ChangeListener<SongNode> listener = (obs, oldValue, newValue) -> {
		if (newValue != null) {
			nameLabel.setText(newValue.getName());
			artistLabel.setText(newValue.getArtist());
			albumLabel.setText(newValue.getAlbum());
			yearLabel.setText(newValue.getYear());
			nameEdit.setText(newValue.getName());
			artistEdit.setText(newValue.getArtist());
			albumEdit.setText(newValue.getAlbum());
			yearEdit.setText(newValue.getYear());
		}
	};
	int operationIndex;

	public ObservableList<SongNode> getList() {
		return songList;
	}

	public void readFile() throws FileNotFoundException {
		Scanner sc = new Scanner(new File("src/lib/view/SongList.txt"));
		sc.useDelimiter(System.getProperty("line.separator"));
		while (sc.hasNext()) {
			SongNode node = new SongNode(sc.next(), sc.next(), sc.next(), sc.next());
			songList.add(node);
		}
		sc.close();
	}

	public void hideAdd() {
		addDisplay.setVisible(false);
	}

	public void hideEdit() {
		editDisplay.setVisible(false);
	}
	
	public void hideWarn() {
		warningLabel.setVisible(false);
	}
	
//	public void hideDuplicated() {
//		duplicatedLabel.setVisible(false);
//	}

	public void clickButton(ActionEvent e) throws IOException {
		Button b = (Button) e.getSource();
		if (b == add) {
			addDisplay.setVisible(true);
			operationIndex = ADD;
		}
		if (b == delete) {
			warningLabel.setVisible(true);
			operationIndex = DELETE;
		}
		if (b == edit) {
			editDisplay.setVisible(true);
			operationIndex = EDIT;
		}
	}

	public void applyButton(ActionEvent e) throws IOException {
		switch (operationIndex) {
		case ADD:
			addApply();
			hideAdd();
			nameAdd.setText("");
			albumAdd.setText("");
			artistAdd.setText("");
			yearAdd.setText("");
			break;
		case DELETE:
			deleteApply();
			break;
		case EDIT:
			editApply();
			hideEdit();
			break;
		}
		operationIndex = 0;
		hideAdd();
		hideEdit();
		hideWarn();
		//hideDuplicated();
	}

	public void cancelButton(ActionEvent e) throws IOException {
		switch (operationIndex) {
		case ADD:
			addDisplay.setVisible(false);
			nameAdd.setText("");
			albumAdd.setText("");
			artistAdd.setText("");
			yearAdd.setText("");
			break;
		case DELETE:
			break;
		case EDIT:
			editDisplay.setVisible(false);
			break;
		}
		operationIndex = 0;
		hideWarn();
//		hideDuplicated();
		editDisplay.setVisible(false);
		addDisplay.setVisible(false);
	}

	public void addApply() {

		String name = nameAdd.getText();
		String artist = artistAdd.getText();
		String album = albumAdd.getText();
		String year = yearAdd.getText();
		SongNode newSong = new SongNode(name, artist, album, year);
		if (songList.contains(newSong)) {
//			duplicatedLabel.setVisible(true);
//			addApply();
		} else {
			songList.add(newSong);
			listView.getSelectionModel().select(songList.size() - 1);
			sortList();
		}

	}

	public void deleteApply() {
		int index = lvInt();
		if (index == -1) {
			return;
		}
		songList.remove(index);
		if (index == songList.size()) {
			select(index - 1);
		} else {
			select(index);
		}

	}

	public void editApply() {
		String name = nameEdit.getText();
		String artist = artistEdit.getText();
		String album = albumEdit.getText();
		String year = yearEdit.getText();
		SongNode newSong = new SongNode(name, album, artist, year);
		if (songList.contains(newSong) && songList.indexOf(newSong) != lvInt()) {
//			duplicatedLabel.setVisible(true);
		} else {
			songList.set(lvInt(), newSong);
			nameLabel.setText(name);
			albumLabel.setText(album);
			artistLabel.setText(artist);
			yearLabel.setText(year);
			sortList();
		}

	}

	private void sortList() {
		listView.getSelectionModel().selectedItemProperty().removeListener(listener);
		if (songList != null || songList.size() > 0) {
			//songList.sort(Comparator.comparing(songNode -> songNode.getName()));
			songList.sort(Comparator.comparing(songNode -> songNode.getName(), String.CASE_INSENSITIVE_ORDER));
		}
		listView.getSelectionModel().selectedItemProperty().addListener(listener);

	}

	public void obsL() throws IOException {
		songList = FXCollections.observableArrayList();
		readFile();
		listView.setItems(songList);
		listView.setCellFactory(param -> new ListCell<SongNode>() {
			@Override
			protected void updateItem(SongNode item, boolean empty) {
				super.updateItem(item, empty);
				if (empty || item == null) {
					setText(null);
					setGraphic(null);
				} else {
					setText(item.getName());
				}
			}
		});

		listView.getSelectionModel().selectedItemProperty().addListener(listener);
		sortList();
		select(0);
	}

	private int lvInt() {
		return listView.getSelectionModel().getSelectedIndex();

	}

	private void select(int n) {
		if (songList.size() > 0) {
			listView.getSelectionModel().select(n);
		}
	}

}
