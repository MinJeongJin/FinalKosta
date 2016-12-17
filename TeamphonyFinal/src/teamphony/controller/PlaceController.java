package teamphony.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import teamphony.domain.Place;
import teamphony.domain.Places;
import teamphony.service.facade.PlaceService;
import teamphony.util.MediaUtils;
import teamphony.util.UploadFileUtils;

@Controller
@RequestMapping("place")
public class PlaceController {

	@Autowired
	private PlaceService placeService;
	
	
	@RequestMapping("create.do")
	public String createPlace(Place place) throws Exception{
		placeService.registerPlace(place);
		return "redirect:/place/searchAll.do";
	}

	@RequestMapping(value = "revise.do", method = RequestMethod.GET)
	public String revisePlace(int placeId, Model model){
		Place place = placeService.findPlaceByPlaceId(placeId);
		model.addAttribute("place", place);
		return "place/placeModify";
	}
	
	@RequestMapping(value = "revise.do", method = RequestMethod.POST)
	public String revisePlace(Place place, Model model) throws Exception{
		placeService.modifyPlace(place);
		return "redirect:/place/detail.do?placeId="+place.getPlaceId();
	}
	
	@RequestMapping("erase.do")
	public String erasePlace(int placeId) throws Exception{
		placeService.removePlace(placeId);
		return "redirect:/place/searchAll.do";
	}
	
	@RequestMapping("detail.do")
	public String searchPlaceByPlaceId(int placeId, Model model){
		Place place = placeService.findPlaceByPlaceId(placeId);
		model.addAttribute("place", place);
		return "place/placeDetail";
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
	
	@RequestMapping("adminSearchAll.do")
	public String searchAdminAllPlace(Model model){
		List<Place> list = placeService.findAllPlace();
		List<Place> places = new ArrayList<>();
		
		for(Place place : list){
			String [] array = place.getAddress().split(" ");
			place.setAddress(array[0] + " " + array[1]);
			places.add(place);
		}
		model.addAttribute("places", places);
		return "place/placeListAdmin";
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
	
	
	
	// File 관련 method
	
	@RequestMapping(value = "uploadAjax.do", method = RequestMethod.GET)
	public void uploadAjax(){
	}
	
	@RequestMapping(value = "uploadAjax.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file, HttpServletRequest request) throws Exception {
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/") + "resources\\place\\img\\";
		
		return new ResponseEntity<>(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
	}
	
	// 등록화면에서 이미지이름 누르면 새창으로 연결하여 크게 보는 기능이였으나
	// ajax 뒤로가기 하면 이미지가 사라짐. 그러나 폴더안에는 존재하는 문제발생
	// popup으로 보여주기로 변경.
	@ResponseBody
	@RequestMapping("displayFile.do")
	public ResponseEntity<byte[]> displayFile(String fileName, HttpServletRequest request) throws Exception{
		String uploadPath = request.getSession().getServletContext().getRealPath("/") + "resources\\place\\img\\";
		
		InputStream in = null; 
	    ResponseEntity<byte[]> entity = null;
	    
	    try{
	      
	      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	      
	      MediaType mType = MediaUtils.getMediaType(formatName);
	      
	      HttpHeaders headers = new HttpHeaders();
	      
	      in = new FileInputStream(uploadPath+fileName);
	      
	      if(mType != null){
	        headers.setContentType(mType);
	      }else{
	        
	        fileName = fileName.substring(fileName.indexOf("_")+1);       
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.add("Content-Disposition", "attachment; filename=\""+ 
	          new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	      }

	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
	          headers, 
	          HttpStatus.CREATED);
	    }catch(Exception e){
	      e.printStackTrace();
	      entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally{
	      in.close();
	    }
	      return entity;    
	}
	
	// 업로드되었던 file delete
	@RequestMapping(value="deleteFile.do", method=RequestMethod.POST)
	  public ResponseEntity<String> deleteFile(String fileName, HttpServletRequest request){
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/") + "resources\\place\\img\\";
	    
	    String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	    
	    MediaType mType = MediaUtils.getMediaType(formatName);
	    
	    if(mType != null){      
	      
	      String front = fileName.substring(0,12);
	      String end = fileName.substring(14);
	      new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
	    }
	    
	    new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
	    
	    
	    return new ResponseEntity<String>("deleted", HttpStatus.OK);
	  }  
	
	// 수정화면에 파일 가져오기
	@ResponseBody
	@RequestMapping("getFile.do")
	public List<String> getFile(int placeId) throws Exception{
		return placeService.getFile(placeId);
		
	}
	
	@ResponseBody
	@RequestMapping("getThumnailFile.do")
	public List<String> getFileOne(int placeId) throws Exception{
		return placeService.getFile(placeId).subList(0, 1);
		
	}
	
	@ResponseBody
	@RequestMapping(value="deleteAllFiles.do", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files, HttpServletRequest request){
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/") + "resources\\place\\img\\";
		
		if(files == null || files.length == 0){
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		for(String fileName : files){
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null){
				
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
			}
			
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	@RequestMapping(value = "xml.do", produces = "application/xml")
	public @ResponseBody Places getMembersToXml() {

		List<Place> list = new ArrayList<>();
		Places places = new Places();

		list = placeService.findAllPlace();

		places.setPlaces(list);

		return places;
	}
	
}
