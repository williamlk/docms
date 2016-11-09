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
	
	/**
	 * 添加文件
	 * @param docFile 持久化文件对象
	 * @param fileName 文件名
	 * @param description 文件描述
	 * @param type 文件类型
	 * @param uploadUser 上传人（名称）
	 * @param folderId 文件夹id
	 * @param ownerId 所有者id
	 * @return
	 */
	public int addFile(File docFile,String fileName,String description,String type,String uploadUser,String folderId,String ownerId);
	
	/**
	 * 修改文件元数据
	 * @param id 文件的id，通过该id查找出该doc
	 * @param description 描述
	 * @param folderId 所属文件夹
	 * @param ownerId 所有者id
	 * @return
	 */
	public int editFile(String id,String description,String folderId,String ownerId);
	
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
	 * @return 0 正常 -1 出错
	 */
	public int delete(String id);
	
	/**
	 * 通过文件夹id查找文件
	 * @param folderId 目录id
	 * @return
	 */
	public List<Doc> findByFolder(String folderId);
}
