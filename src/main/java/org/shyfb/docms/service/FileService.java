package org.shyfb.docms.service;

import java.io.File;
import java.util.List;

import org.shyfb.docms.entity.mongo.Doc;

/**
 * 文件service层接口
 * @desp
 * @author huyinghao@abchina.com
 * @date 2016年11月8日
 */
public interface FileService {
	
	
	public int addFile(File docFile,String fileName,String description,String type,String uploadUser,String folderId,String ownerId);
	
	
	public int editFile();
	
	/**
	 * 获取文件总数量
	 * @return
	 */
	public int getFileNum();
	
	
	/**
	 * 通过文件id查找文件
	 * @param id 文件id
	 * @return
	 */
	public Doc findById(String id);
	
	/**
	 * 通过文件Id删除文件
	 * @param id 文件id
	 * @return
	 */
	public int delete(String id);
	
	/**
	 * 通过文件夹id查找文件
	 * @param folderId 目录id
	 * @return
	 */
	public List<Doc> findByFolder(String folderId);
}
