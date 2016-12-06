package teamphony.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import teamphony.domain.Place;
import teamphony.service.facade.PlaceService;

@Controller
@RequestMapping("place")
public class PlaceController {

	@Autowired
	private PlaceService placeService;
	
	
	@RequestMapping("erase.do")
	public String erasePlace(int placeId){
		placeService.removePlace(placeId);
		return "redirect:/place/searchAll.do";
	}
	
	@RequestMapping("searchAll.do")
	public String searchAllPlace(Model model){
		List<Place> list = placeService.findAllPlace();
		List<Place> places = new ArrayList<>();
		
		for(Place place : list){
			String [] array = place.getAddress().split(" ");
			place.setAddress(array[0] + " " + array[1]);
			places.add(place);
		}
		model.addAttribute("places", places);
		return "place/placeList";
	}
	
	@RequestMapping("detail.do")
	public String searchPlaceByPlaceId(int placeId, Model model){
		Place place = placeService.findPlaceByPlaceId(placeId);
		model.addAttribute("place", place);
		return "place/placeDetail";
	}
	
	@RequestMapping("searchByName.do")
	public String searchPlaceByPlaceName(String placeName, Model model){
		List<Place> list = placeService.findPlaceByPlaceName(placeName);
		List<Place> places = new ArrayList<>();
		
		for(Place place : list){
			String [] array = place.getAddress().split(" ");
			place.setAddress(array[0] + " " + array[1]);
			places.add(place);
		}
		model.addAttribute("places", places);
		return "place/placeList";
	}
	
	@RequestMapping("searchByAddress.do")
	public String searchPlaceByPlaceAddress(String placeAddress, Model model){
		List<Place> list = placeService.findPlaceByPlaceAddress(placeAddress);
		List<Place> places = new ArrayList<>();
		
		for(Place place : list){
			String [] array = place.getAddress().split(" ");
			place.setAddress(array[0] + " " + array[1]);
			places.add(place);
		}
		model.addAttribute("places", places);
		return "place/placeList";
	}
	
}
