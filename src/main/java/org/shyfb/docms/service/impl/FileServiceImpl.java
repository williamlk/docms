package org.shyfb.docms.service.impl;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.shyfb.docms.common.util.StringHandler;
import org.shyfb.docms.dao.mongo.DocDao;
import org.shyfb.docms.dao.mongo.FileDao;
import org.shyfb.docms.entity.mongo.Doc;
import org.shyfb.docms.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	private FileDao fileDao;
	
	@Autowired
	private DocDao docDao;

	@Override
	public int addFile(File docFile, String fileName, String description, String type, String uploadUser,
			String folderId, String ownerId) {
		System.out.println("=========fileService====== addFile()======");
		// 把文件存到mongo gridfs里 ， 得到该文件的id
		String fileId = fileDao.save(docFile, fileName);

		Doc doc = new Doc();
		doc.setFileId(fileId);
		doc.setName(fileName);
		doc.setDescription(description);
		doc.setOwnerId(ownerId);
		doc.setUploadUser(uploadUser);
		doc.setCreatedTime(StringHandler.timeTostr(new Date()));
		doc.setFolderId(folderId);
		doc.setStatus(1);
		doc.setType(type);

		System.out.println(doc.toString());
		System.out.println("=========fileService====== docFile.existFile()======");
		if(docFile.exists()){
			docFile.delete();
		}
		
		try {
			docDao.save(doc);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		return 0;
	}

	@Override
	public int editFile() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getFileNum() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Doc findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Doc> findByFolder(String folderId) {
		// TODO Auto-generated method stub
		return null;
	}

}
