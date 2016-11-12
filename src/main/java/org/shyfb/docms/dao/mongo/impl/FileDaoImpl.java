package org.shyfb.docms.dao.mongo.impl;


import org.shyfb.docms.dao.impl.MongoBaseDaoImpl;
import org.shyfb.docms.dao.mongo.FileDao;
import org.shyfb.docms.entity.mongo.File;
import org.springframework.stereotype.Repository;
@Repository
public class FileDaoImpl extends MongoBaseDaoImpl<File, String> implements FileDao {

}
