package org.shyfb.docms.dao.mongo.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.shyfb.docms.dao.mongo.FileDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.gridfs.GridFsOperations;
import org.springframework.stereotype.Repository;

import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSFile;

/**
 * 文件存储 MongoGridFS实现
 * @desp
 * @author huyinghao@abchina.com
 * @date 2016年11月8日
 */
@Repository
public class FileDaoImpl implements FileDao{
	
	private static Logger logger = LoggerFactory.getLogger(FileDaoImpl.class);
	
	@Autowired
	private GridFsOperations operations;

	@Override
	public String save(File file, String fileName) {
		try {
			InputStream ins = new FileInputStream(file);
			GridFSFile gfs = operations.store(ins, fileName);
			
			ins.close();
			return gfs.getId().toString();
		} catch (Exception e) {
			logger.info("保存文件失败");
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public String save(File file, String fileName, Object object) {
		try {
			InputStream ins = new FileInputStream(file);
			GridFSFile gfs = operations.store(ins, fileName, object);
			
			ins.close();
			return gfs.getId().toString();
		} catch (Exception e) {
			logger.info("保存文件失败"+fileName);
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public String save(FileInputStream fis, String fileName) {
		try {
			GridFSFile gfs = operations.store(fis, fileName);
			return gfs.getId().toString();
		} catch (Exception e) {
			logger.info("保存文件失败"+fileName);
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public String save(FileInputStream fis, String fileName, Object object) {
		try {
			GridFSFile gfs = operations.store(fis, fileName, object);
			return gfs.getId().toString();
		} catch (Exception e) {
			logger.info("保存文件失败"+fileName);
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public GridFSDBFile findById(String id) {
		Query query = new Query();
		Criteria criteria = Criteria.where("_id").is(id);
		query.addCriteria(criteria);
		GridFSDBFile dbfile = operations.findOne(query);
		
		return dbfile;
	}

	@Override
	public void delete(String id) {
		Query query = new Query();
		Criteria criteria = Criteria.where("_id").is(id);
		query.addCriteria(criteria);
		operations.delete(query);
	}

}
