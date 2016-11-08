package org.shyfb.docms.dao.mongo.impl;


import org.shyfb.docms.dao.impl.MongoBaseDaoImpl;
import org.shyfb.docms.dao.mongo.DocDao;
import org.shyfb.docms.entity.mongo.Doc;
import org.springframework.stereotype.Repository;
@Repository
public class DocDaoImpl extends MongoBaseDaoImpl<Doc, String> implements DocDao {

}
