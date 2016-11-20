package teamphony.store.mapper;

import java.util.List;

import teamphony.domain.Place;

public interface PlaceMapper {

	void insertPlace(Place place);
	void updatePlace(Place place);
	void deletePlace(int placeId);
	List<Place> selectAllPlace();
	Place selectPlaceByPlaceId(int placeId);
	List<Place> selectPlaceByPlaceName(String placeName);
	List<Place> selectPlaceByPlaceAddress(String placeAddress);
}
