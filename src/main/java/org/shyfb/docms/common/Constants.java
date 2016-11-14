package org.shyfb.docms.common;

/**
 * 常量类
 * @desp
 * @author huyinghao@abchina.com
 * @date 2016年11月12日
 */
public class Constants {
	
	
	
	
	private Constants() {
	}

	public enum UserConstants{
		NORMAL(1),FORBIDDEN(2);
		private Integer code;
		
		private UserConstants(Integer code){
			this.code=code;
		}
		
		public Integer getCode(){
			return code;
		}
	}
	
	public enum ControllerConstants{
		OK(1000),FAIL(0);
		private Integer code;
		private ControllerConstants(Integer code){
			this.code=code;
		}
		
		public Integer getCode(){
			return code;
		}
	}
	
	public enum FileConstants{
		COMMON(1,"普通文件"),TMP(2,"临时文件");
		
		private Integer code;
		private String description;
		
		private FileConstants(Integer code,String description){
			this.code=code;
			this.description=description;
		}
	
		
		public static String getDescription(Integer code){
			for(FileConstants fileConstants : FileConstants.values()){
				if(fileConstants.code==code){
					return fileConstants.description;
				}
			}
			return null;
		}
		
		public Integer getCode(){
			return code;
		}
		public String getDescription() {
			return description;
		}
	}
}
