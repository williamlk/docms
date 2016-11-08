package org.shyfb.docms.dao.impl;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.shyfb.docms.dao.BaseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

/**
 * @desp MongoDB baseDao实现
 * @author liulichao
 * 
 * @param <T>
 */
public abstract class MongoBaseDaoImpl<T, ID extends Serializable> implements BaseDao<T, ID>{
	
	@Autowired
	protected MongoTemplate mongoTemplate;
	
	private Class<T> persistentClass;
	
	@SuppressWarnings("unchecked")
	public MongoBaseDaoImpl(){
		this.persistentClass = (Class<T>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}
	
	public Class<T> getPersistentClass() {
		return persistentClass;
	}
	
	public void save(T transientInstance) throws Exception{
		try {
			this.mongoTemplate.save(transientInstance);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(T persistentInstance) throws Exception{
		try {
			mongoTemplate.remove(persistentInstance);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @desp 利用反射遍历值后执行更新，主键必须为id
	 * 
	 */
	public void update(T instance) throws Exception{
		try {
			Update update = new Update();
			Query query = new Query();
			Field[] fields = instance.getClass().getDeclaredFields();
			Criteria criteria = new Criteria();
			for(Field f:fields){
				f.setAccessible(true);
				if(f.getName().equals("id")){
					criteria=Criteria.where("_id").is(f.get(instance));
				}
				update.set(f.getName(), f.get(instance));
			}
			
			query.addCriteria(criteria);
			mongoTemplate.updateFirst(query, update, this.getPersistentClass());
		} catch (Exception e) {
			throw e;
		}
	}
	
	public List<T> findAll() {
		List<T> list = mongoTemplate.findAll(this.getPersistentClass());
		return list;
	}
	
	public T findById(ID id) {
		Query query = new Query();
		Criteria criteria = Criteria.where("_id").is(id);
		query.addCriteria(criteria);
		T instance = (T) mongoTemplate.findOne(query, this.getPersistentClass());
		return instance;
	}

	public int updateByQuery(String hql){
		return 0;
	}

	public List<T> findByQuery(String queryString) {
		BasicQuery query = new BasicQuery(queryString);
		List<T> list = mongoTemplate.find(query, persistentClass);
		return list;
	}
	
	public List<T> findByQueryASC(String queryString,Object...params){
		BasicQuery query = new BasicQuery(queryString);
		for(int i=0,len=params.length;i<len;i++){
			query.with(new Sort(Sort.Direction.ASC, params[i].toString()));
		}
		List<T> list = mongoTemplate.find(query, persistentClass);
		return list;
	}
	  
	public List<T> findByQueryDESC(String queryString,Object...params){
		BasicQuery query = new BasicQuery(queryString);
		for(int i=0,len=params.length;i<len;i++){
			query.with(new Sort(Sort.Direction.DESC, params[i].toString()));
		}
		List<T> list = mongoTemplate.find(query, persistentClass);
		return list;
	}
	
	public List<T> queryForPage(String queryString, int offset, int length) {
		return null;
	}
	
	public long count(String queryString){
		BasicQuery query = new BasicQuery(queryString);
		return mongoTemplate.count(query, persistentClass);
	}
	
	/**
	 * 该方法非MongoDB需要实现
	 */
	public List<T> findByHql(String hql, Object... params) {
		return null;
	}
	
	public void setPersistentClass(Class<T> persistentClass) {
		this.persistentClass = persistentClass;
	}

	public MongoTemplate getMongoTemplate() {
		return mongoTemplate;
	}

	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}
	
}
