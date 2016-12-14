package teamphony.service.facade;

import java.util.List;

import teamphony.domain.Place;

public interface PlaceService {

	void registerPlace(Place place) throws Exception;
	void modifyPlace(Place place) throws Exception;
	void removePlace(int placeId) throws Exception;
	Place findPlaceByPlaceId(int placeId);
	List<Place> findAllPlace();
	List<Place> findPlaceByPlaceName(String placeName);
	List<Place> findPlaceByPlaceAddress(String placeAddress);
	
	List<String> getFile(int placeId) throws Exception;
}
