package org.shyfb.docms.dao;

import org.shyfb.docms.entity.SuccessKilled;

public interface SuccessKilledDao {
	
	/**
	 * 插入购买明细，可过滤重复
	 * @param seckillId
	 * @param userPhone
	 * @return 插入的行数 返回0代表插入失败
	 */
	int insertSuccessKilled(long seckillId,long userPhone);
	
	/**
	 * 查询SuccessKilled并携带秒杀产品对象实体
	 * @param seckillId
	 * @return
	 */
	SuccessKilled queryByIdWithSeckill(long seckillId);
	
}
