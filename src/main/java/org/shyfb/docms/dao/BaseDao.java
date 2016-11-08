package org.shyfb.docms.dao;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T,ID extends Serializable>  {
	  public void save(T transientInstance) throws Exception;

	  public void delete(T persistentInstance) throws Exception;

	  public void update(T instance) throws Exception;

	  public int updateByQuery(String hql);

	  public T findById(ID id);

	  public List<T> findAll();

	  public List<T> queryForPage(String queryString, int offset, int length);
	  
	  /**
	   * Mongo专用查询
	   * @param queryString
	   * @return
	   */
	  public List<T> findByQuery(String queryString);
	  
	  /**
	   * @desp Mongo查询并排序
	   * @param queryString 查询语句
	   * @param params 需要指定排序的字段
	   * @return
	   */
	  public List<T> findByQueryASC(String queryString,Object...params);
	  
	  /**
	   * @desp Mongo查询并排序
	   * @param querString 查询语句
	   * @param params 需要指定排序的字段
	   * @return
	   */
	  public List<T> findByQueryDESC(String queryString,Object...params);
	  
	  /**
	   * @desp: 通过hql语句进行查询
	   * @param hql hql语句
	   * @param params 参数占位	   
	   * * @return
	   */
	  public List<T> findByHql(String hql,Object... params);
	  
	  /**
	   * @desp 获取集合数量，该方法速度较快
	   * @param instance
	   * @return
	   */
	  public long count(String queryString);
}
