package org.shyfb.docms.service.impl;

import java.util.Date;
import java.util.List;

import org.shyfb.docms.common.Constants;
import org.shyfb.docms.common.util.StringHandler;
import org.shyfb.docms.dao.mongo.FileDao;
import org.shyfb.docms.dao.mongo.MongoGridfsFileDao;
import org.shyfb.docms.entity.mongo.File;
import org.shyfb.docms.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mongodb.gridfs.GridFSDBFile;

/**
 * 文件模块服务层
 * 
 * @desp
 * @author huyinghao@abchina.com
 * @date 2016年11月8日
 */
@Service
public class FileServiceImpl implements FileService {

	@Autowired
	private MongoGridfsFileDao mongoGridfsFileDao;
	
	@Autowired
	private FileDao fileDao;

	@Override
	public int addFile(java.io.File mongoGridfsFile, String fileName, String description, String type, String uploadUser,
			String folderId, String ownerId) {
		// 把文件存到mongo gridfs里 ， 得到该文件的id
		String fileId = mongoGridfsFileDao.save(mongoGridfsFile, fileName);
		org.shyfb.docms.entity.mongo.File file = new File();
		file.setFileId(fileId);
		file.setName(fileName);
		file.setDescription(description);
		file.setOwnerId(ownerId);
		file.setUploadUser(uploadUser);
		file.setCreatedTime(StringHandler.timeTostr(new Date()));
		file.setFolderId(folderId);
		file.setStatus(Constants.FileConstants.COMMON.getCode());
		file.setType(type);
		if(mongoGridfsFile.exists()){
			mongoGridfsFile.delete();
		}
		try {
			fileDao.save(file);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 0;
	}


	@Override
	public int editFile(String id, String description, String folderId, String ownerId) {
		File file = fileDao.findById(id);
		if(description!=null){
			file.setDescription(description);
		}
		if(folderId!=null){
			file.setFolderId(folderId);
		}
		if(ownerId!=null){
			file.setOwnerId(ownerId);
		}
		try{
			fileDao.save(file);
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 0;
	}
	
	@Override
	public int getFileNum() {
		List<File> fileList = fileDao.findAll();
		return fileList.size();
	}

	@Override
	public File findById(String id) {
		return fileDao.findById(id);
	}

	@Override
	public int delete(String id) {
		File file = fileDao.findById(id);
		try{
			mongoGridfsFileDao.delete(file.getFileId());
			fileDao.delete(file);
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

	@Override
	public List<File> findByFolder(String folderId) {
		String queryString ="{'folderId':'"+folderId+"'}";
		List<File> list = fileDao.findByQuery(queryString);
		return list;
	}


	@Override
	public GridFSDBFile getGridFSDBFile(String id) {
		return mongoGridfsFileDao.findById(id);
	}
	
	
}
