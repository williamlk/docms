package org.shyfb.docms.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 跳转控制类
 * @desp
 * @author huyinghao@abchina.com
 * @date 2016年10月11日
 */
@Controller
@Scope("prototype")
public class DispatcherController extends BaseController{
	
	
	@RequestMapping(value="/",method = RequestMethod.GET)
	public String home(/*Model model*/) {
//		model.addAttribute("recommends",recommendService.getRecommendImage());
		return "user/login";
	}
	
	@RequestMapping(value="/dashboard",method=RequestMethod.GET)
	public String dashboard(Model model){
		//TODO 可以加入些统计信息，统计信息可以用缓存，redis的使用契机，找机会整合进去
		model.addAttribute("key", new Object());
		model.addAttribute("keys",new List<Object>());
		return "dashboard";
	}
	
	
	/**
	 * @desp 页面header
	 * @return
	 */
	@RequestMapping(value="/page/header",method=RequestMethod.GET)
	public String header(){
		return "frame/header";
	}
	
	/**
	 * @desp 页面bottom
	 * @return
	 */
	@RequestMapping(value="/page/bottom",method=RequestMethod.GET)
	public String bottom(){
		return "frame/bottom";
	}
	
	/**
	 * @desp 页面顶部navbar
	 * @return
	 */
	@RequestMapping(value="/page/topNavBar",method=RequestMethod.GET)
	public String topNavbar(){
		return "frame/topNavBar";
	}
	
	/**
	 * @desp 页面左边菜单栏sideBar
	 * @return
	 */
	@RequestMapping(value="/page/sideBar",method=RequestMethod.GET)
	public String sideBar(Model model){
//		model.addAttribute("unCheckNum",visitorService.getunCorrectionNum());
//		model.addAttribute("unHandleContributionNum",contributionService.getUnHandleContributionNum());
//		model.addAttribute("unhandleFeedbackNum",visitorService.getUnHandleFeedbacksNum());
		return "frame/sideBar";
	}
	
	
}
