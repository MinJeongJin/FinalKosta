package teamphony.store.logic;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import teamphony.domain.Place;
import teamphony.store.facade.PlaceStore;
import teamphony.store.mapper.PlaceMapper;

@Repository
public class PlaceStoreLogic implements PlaceStore {
	
	private static final String resource = "config.xml";
	
	private SqlSessionFactory getSessionFactory() {
		Reader reader = null;
		
		try {
			reader = Resources.getResourceAsReader(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new SqlSessionFactoryBuilder().build(reader);
	}

	@Override
	public void insertPlace(Place place) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatePlace(Place place) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePlace(int placeId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Place> selectAllPlace() {
		SqlSession session = getSessionFactory().openSession();
		List<Place> list = new ArrayList<>();
		
		try{
			PlaceMapper mapper = session.getMapper(PlaceMapper.class);
			list = mapper.selectAllPlace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public Place selectPlaceByPlaceId(int placeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Place> selectPlaceByPlaceName(String placeName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Place> selectPlaceByPlaceAddress(String placeAddress) {
		// TODO Auto-generated method stub
		return null;
	}

}
