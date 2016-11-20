package teamphony.service.facade;

import java.util.List;

import teamphony.domain.Place;

public interface PlaceService {

	void registerPlace(Place place);
	void modifyPlace(Place place);
	void removePlace(int placeId);
	Place findPlaceByPlaceId(int placeId);
	List<Place> findAllPlace();
	List<Place> findPlaceByPlaceName(String placeName);
	List<Place> findPlaceByPlaceAddress(String placeAddress);
	
}
