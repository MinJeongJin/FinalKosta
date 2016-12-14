package teamphony.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import teamphony.domain.Place;
import teamphony.service.facade.PlaceService;
import teamphony.store.facade.PlaceStore;

@Service
public class PlaceServiceLogic implements PlaceService {

	@Autowired
	private PlaceStore placeStore;
	
	@Override
	public void registerPlace(Place place) throws Exception {
		placeStore.insertPlace(place);
		
		String[] files = place.getFiles();
		
		if(files == null) {
			return;
		} 
		
		for (String fileName : files) {
			placeStore.addFile(fileName);
		}
	}

	@Transactional
	@Override
	public void modifyPlace(Place place) throws Exception {
		placeStore.updatePlace(place);
		
		int placeId = place.getPlaceId();
		placeStore.deleteFile(placeId);
		String[] files = place.getFiles();
		
		if(files == null){
			return;
		}
		
		for(String fileName : files){
			placeStore.replaceFile(fileName, placeId);
		}
		
	}

	@Override
	public void removePlace(int placeId) throws Exception {
		// placeFile_tb이 place_tb을 참조하기 때문에 반드시 첨부파일과 관련 정보를 삭제하고 게시글을 삭제해야 함.
		placeStore.deleteFile(placeId);
		placeStore.deletePlace(placeId);
	}

	@Override
	public Place findPlaceByPlaceId(int placeId) {
		return placeStore.selectPlaceByPlaceId(placeId);
	}

	@Override
	public List<Place> findAllPlace() {
		return placeStore.selectAllPlace();
	}

	@Override
	public List<Place> findPlaceByPlaceName(String placeName) {
		return placeStore.selectPlaceByPlaceName(placeName);
	}

	@Override
	public List<Place> findPlaceByPlaceAddress(String placeAddress) {
		return placeStore.selectPlaceByPlaceAddress(placeAddress);
	}

	@Override
	public List<String> getFile(int placeId) throws Exception {
		return placeStore.getFile(placeId);
	}

}
