package teamphony.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamphony.domain.Place;
import teamphony.service.facade.PlaceService;
import teamphony.store.facade.PlaceStore;

@Service
public class PlaceServiceLogic implements PlaceService {

	@Autowired
	private PlaceStore placeStore;
	
	@Override
	public void registerPlace(Place place) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyPlace(Place place) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removePlace(int placeId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Place findPlaceByPlaceId(int placeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Place> findAllPlace() {
		return placeStore.selectAllPlace();
	}

	@Override
	public List<Place> findPlaceByPlaceName(String placeName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Place> findPlaceByPlaceAddress(String placeAddress) {
		// TODO Auto-generated method stub
		return null;
	}

}
