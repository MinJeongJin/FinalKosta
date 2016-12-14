package teamphony.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import teamphony.domain.Place;

public interface PlaceMapper {

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
	void replaceFile(@Param("fullName") String fullName, @Param("placeId") int placeId) throws Exception;
}
