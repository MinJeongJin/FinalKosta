package teamphony.store.facade;

import java.util.List;

import teamphony.domain.Place;

public interface PlaceStore {

	void insertPlace(Place place);
	void updatePlace(Place place);
	void deletePlace(int placeId);
	List<Place> selectAllPlace();
	Place selectPlaceByPlaceId(int placeId);
	List<Place> selectPlaceByPlaceName(String placeName);
	List<Place> selectPlaceByPlaceAddress(String placeAddress);
	
	void addFile(String fullName) throws Exception;
	List<String> getFile(int placeId) throws Exception;
	
	void deleteFile(int placeId) throws Exception;
	void replaceFile(String fullName, int placeId) throws Exception;
}
