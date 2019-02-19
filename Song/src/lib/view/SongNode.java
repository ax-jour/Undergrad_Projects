//Xiang Ao
package lib.view;

public class SongNode {
	private String name;
	private String artist;
	private String album;
	private String year;
	
	public SongNode(String name, String artist, String album, String year) {
		this.name = name;
		this.artist = artist;
		this.album = album;
		this.year = year;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof SongNode) {
			return this.name.equalsIgnoreCase(((SongNode) obj).name);
		}
		return false;
	}
	
//	@Override
//	public boolean equalsIgnoreCase(Object obj) {
//		if(obj instanceof SongNode) {
//			return this.name.equalsIgnoreCase(((SongNode) obj).name);
//		}
//		return false;
//	}
	
	@Override
	public int hashCode() {
		return this.name.hashCode();
	}
	
}
