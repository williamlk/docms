package org.shyfb.docms.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
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
	
	
//	@RequestMapping(value="/",method = RequestMethod.GET)
//	public String home(/*Model model*/) {
//		model.addAttribute("recommends",recommendService.getRecommendImage());
//		return "user/login";
//	}
//	
}
