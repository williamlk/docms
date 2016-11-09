package org.shyfb.docms.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.shyfb.docms.aop.annotation.LoginCheck;
import org.shyfb.docms.common.util.EncoderHandler;
import org.shyfb.docms.common.util.StringHandler;
import org.shyfb.docms.entity.User;
import org.shyfb.docms.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@Scope("prototype")
public class FileController extends BaseController{
	
	@Autowired
	private FileService fileService;
	

//	@Autowired
//	private ImageService imageService;
//	@Autowired
//	private SubjectService subjectService;
//	@Autowired
//	private MapService mapService;
//	@Autowired
//	private UserService userService;
//	
	
	
	/**
	 * @desp 跳转到上传文件页面
	 * @return
	 */
	// TODO
//	@RequestMapping(value="/file/page/add/{subjectId}/{locationId}")
//	@LoginCheck
//	public String addFilePage(@PathVariable(value="subjectId")String subjectId,@PathVariable(value="locationId")String locationId,Model model){
////		MapLocation location = mapService.findLocationById(locationId);
////		Subject subject = subjectService.findById(subjectId);
////		
////		model.addAttribute("location",location);
////		model.addAttribute("subject",subject);
//		
//		return "file/addFile";
//	}
	
	/**
	 * @desp 跳转到上传文件页面
	 * @return
	 */
	@RequestMapping(value="/file/page/add")
	@LoginCheck
	public String addFilePage(){
//		MapLocation location = mapService.findLocationById(locationId);
//		Subject subject = subjectService.findById(subjectId);
//		
//		model.addAttribute("location",location);
//		model.addAttribute("subject",subject);
		
		return "file/addFile";
	}
	
	/**
	 * @desp 上传新的照片资源
	 * @param image
	 * @param session
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value="/file/add",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addImage(@RequestParam(value="file",required=false) MultipartFile file,HttpSession session,HttpServletRequest request) throws IllegalStateException, IOException{
		resMap = new HashMap<String, Object>();
		//获取当前 用户用户名
		String userName = ((User)session.getAttribute("user")).getName();
		//获取当前 用户ID
		String userId = ((User)session.getAttribute("user")).getId().toString();
		
		/*
		 * MultipartFile类中两个方法区别：
		 *	getName : 获取表单中文件组件的名字
		 *	getOriginalFilename : 获取上传文件的原名
		 * 获取上传文件的原名
		 */
		String fileName = file.getOriginalFilename();
		String prefix=fileName.substring(fileName.lastIndexOf(".")+1);
		//获取所属目录id
		String folderId = request.getParameter("folderId");
		//获取文件描述
		String description = request.getParameter("description");
		String uploadUser = userName;
		// 文件的后缀
		String type = prefix;
		String ownerId = userId;
		
		String path = request.getSession().getServletContext().getRealPath("/files/");
//		File docFile = new File(path+EncoderHandler.encodeBySHA1(StringHandler.getSerial(new Date())+file.getOriginalFilename())+"."+prefix);
		File docFile = new File(EncoderHandler.encodeBySHA1(StringHandler.getSerial(new Date())+file.getOriginalFilename())+"."+prefix);
		file.transferTo(docFile);
		int status = fileService.addFile(docFile, fileName, description, type, uploadUser, folderId, ownerId);
		if(status == 0){
			resMap.put("status", 1000);
		}else{
			resMap.put("error", INTERNAL_SERVER_ERROR);
		}
		return resMap;
	}
	
//	/**
//	 * @desp 修改照片资源元数据信息页面
//	 * @param imageId
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="image/page/edit/{imageId}",method=RequestMethod.GET)
//	@LoginCheck
//	public String editImagePage(@PathVariable(value="imageId")String imageId,Model model){
//		Image image = imageService.findById(imageId);
//		MapLocation location = mapService.findLocationById(image.getLocationId());
//		
//		model.addAttribute("image",image);
//		model.addAttribute("location",location);
//		
//		return "image/editImage";
//	}
//	
//	/**
//	 * @desp 修改照片资源元数据信息
//	 * @return
//	 */
//	@RequestMapping(value="image/edit",method = RequestMethod.POST)
//	@ResponseBody
//	public Map<String, Object> editImage(HttpServletRequest request){
//		resMap = new HashMap<String, Object>();
//		
//		String title = request.getParameter("title");
//		String subject = request.getParameter("subject");
//		String description = request.getParameter("description");
//		String source = request.getParameter("source");
//		String tag = request.getParameter("tag");
//		String creator = request.getParameter("creator");
//		String publisher = request.getParameter("publisher");
//		String contributor = request.getParameter("contributor");
//		String date = request.getParameter("date");
//		String type = request.getParameter("type");
//		String imageId = request.getParameter("imageId");
//		String address = request.getParameter("address");
//		
//		int status = imageService.editImage(imageId, title, subject, description, source, tag, creator, publisher, contributor, date, type,address);
//		
//		if(status == 0){
//			resMap.put("status", 1000);
//		}else{
//			resMap.put("error", INTERNAL_SERVER_ERROR);
//		}
//		
//		return resMap;
//	}
//	
//	/**
//	 * @desp 照片详情
//	 * @return
//	 */
//	@RequestMapping(value="image/info/{imageId}",method = RequestMethod.GET)
//	@LoginCheck
//	public String imageInfo(@PathVariable(value="imageId")String imageId,Model model){
//		Image image = imageService.findById(imageId);
//		MapLocation location = mapService.findLocationById(image.getLocationId());
//		User user = userService.findById(image.getUploadUser());
//		
//		model.addAttribute("user",user);
//		model.addAttribute("image",image);
//		model.addAttribute("location",location);
//		model.addAttribute("subject",subjectService.findById(image.getSubjectId()));
//		
//		return "image/imageInfo";
//	}
//	
//	/**
//	 * @desp 查看照片
//	 * @return
//	 */
//	@RequestMapping(value="/image/view/{locationId}",method=RequestMethod.GET)
//	@LoginCheck
//	public String view(@PathVariable(value="locationId")String locationId,Model model){
//		List<Image> imageList = imageService.findByLocOrderByTime(locationId);
//		
//		model.addAttribute("imageList",imageList);
//		model.addAttribute("locationId",locationId);
//		return "image/viewImage";
//	}
//	
//	/**
//	 * @desp 时间轴查看照片
//	 * @param locationId
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="image/view/timeline/{locationId}",method = RequestMethod.GET)
//	@LoginCheck
//	public String viewTimeline(@PathVariable(value="locationId")String locationId,Model model){
//		List<Image> imageList = imageService.findByLocOrderByTime(locationId);
//		
//		model.addAttribute("imageList",imageList);
//		model.addAttribute("locationId",locationId);
//		return "image/viewImageTimeline";
//	}
//	
//	/**
//	 * @desp 删除照片
//	 * @param imageId
//	 * @return
//	 */
//	@RequestMapping(value="image/delete/{imageId}",method = RequestMethod.GET)
//	@ResponseBody
//	@LoginCheck
//	public Map<String, Object> deleteImage(@PathVariable(value="imageId")String imageId){
//		resMap = new HashMap<String, Object>();
//		int status = imageService.delete(imageId);
//		if(status==0){
//			resMap.put("status", 1000);
//		}else{
//			resMap.put("error", INTERNAL_SERVER_ERROR);
//		}
//		return resMap;
//	}
//	
//	/**
//	 * @desp 更改照片专题
//	 * @return
//	 */
//	@RequestMapping(value="image/changeSubject",method = RequestMethod.POST)
//	@ResponseBody
//	public Map<String, Object> changeSubject(HttpServletRequest request){
//		resMap = new HashMap<String, Object>();
//		String imageId = request.getParameter("imageId");
//		String subjectId = request.getParameter("subjectId");
//		int status = imageService.changeSubject(imageId,subjectId);
//		if(status == 0){
//			resMap.put("status", 1000);
//		}else{
//			resMap.put("error", INTERNAL_SERVER_ERROR);
//		}
//		return resMap;
//	}
//	
//	/**
//	 * @desp 更改照片位置页面
//	 * @return
//	 */
//	@RequestMapping(value="image/page/changeLocation/{imageId}",method = RequestMethod.GET)
//	@LoginCheck
//	public String changeLocation(@PathVariable(value="imageId")String imageId,Model model){
//		Image image = imageService.findById(imageId);
//		MapLocation location = mapService.findLocationById(image.getLocationId());
//		model.addAttribute("image",image);
//		model.addAttribute("location",location);
//		return "mapResource/changeImgLocation";
//	}
//	
//	/**
//	 * @desp 更改照片所属位置
//	 * @return
//	 */
//	@RequestMapping(value="image/changeLocation",method = RequestMethod.POST)
//	@ResponseBody
//	public Map<String, Object> changeLocation(HttpServletRequest request){
//		resMap = new HashMap<String, Object>();
//		String imageId = request.getParameter("imageId");
//		String locationId = request.getParameter("locationId");
//		int status = imageService.changeLocation(imageId,locationId);
//		if(status == 0){
//			resMap.put("status", 1000);
//		}else{
//			resMap.put("error", INTERNAL_SERVER_ERROR);
//		}
//		return resMap;
//	}
//	

}
