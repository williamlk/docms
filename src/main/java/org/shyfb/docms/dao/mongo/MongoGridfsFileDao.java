package org.shyfb.docms.dao.mongo;

import java.io.File;
import java.io.FileInputStream;

import com.mongodb.gridfs.GridFSDBFile;

/**
 * @desp MongoDB 文件存储接口，通过MongoDB GridFS对文件进行存储，提供存储与调用的各个接口
 * @author liulichao <liulichao@ruc.edu.cn>
 *
 */
public interface MongoGridfsFileDao {

	/**
	 * @desp 保存文件
	 * @param file
	 * @param fileName
	 * @return
	 */
	public String save(File file,String fileName);
	
	/**
	 * @desp 保存文件
	 * @param file 
	 * @param fileName
	 * @param object 元数据Object
	 * @return
	 */
	public String save(File file,String fileName,Object object);
	
	/**
	 * @desp 保存文件
	 * @param fis
	 * @param fileName
	 * @return
	 */
	public String save(FileInputStream fis,String fileName);
	
	/**
	 * @desp 保存文件
	 * @param fis
	 * @param fileName
	 * @param object 元数据Object
	 * @return
	 */
	public String save(FileInputStream fis,String fileName,Object object);
	
	/**
	 * @desp 删除文件
	 * @param id
	 */
	public void delete(String id);
	
	/**
	 * @desp 根据id查找文件
	 * @param id
	 * @return
	 */
	public GridFSDBFile findById(String id);

}
