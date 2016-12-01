package teamphony.controller;

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
	
	@RequestMapping("searchAll.do")
	public String searchAllPlace(Model model){
		List<Place> places = placeService.findAllPlace();
		model.addAttribute("places", places);
		return "place/placeList";
	}
	
}
