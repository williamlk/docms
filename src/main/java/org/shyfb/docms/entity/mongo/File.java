package org.shyfb.docms.entity.mongo;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;

/**
 * 文件实体
 * @desp
 * @author huyinghao@abchina.com
 * @date 2016年11月8日
 */
@org.springframework.data.mongodb.core.mapping.Document(collection="t_file")
public class File {
	@Id
	private ObjectId id;
	
	/**
	 * MongoDB GRIDFS 存储文件的ID
	 */
	private String fileId;
	
	/**
	 * 文件名
	 */
	private String name;
	
	/**
	 * 所属文件夹ID
	 */
	private String folderId;
	
	/**
	 * 文件描述
	 */
	private String description;
	
	/**
	 * 上传人
	 */
	private String uploadUser;
	
	/**
	 * 所有者
	 */
	private String ownerId;

	
	/**
	 * 上传时间
	 */
	private String createdTime;
	
	/**
	 * 文件类型
	 * excel，word，jpg....
	 */
	private String type;
	
	/**
	 * 状态
	 */
	private Integer status;
	

	/*********getters and setters************/
	public ObjectId getId() {
		return id;
	}


	public void setId(ObjectId id) {
		this.id = id;
	}


	public String getFileId() {
		return fileId;
	}


	public void setFileId(String fileId) {
		this.fileId = fileId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	
	public String getFolderId() {
		return folderId;
	}


	public void setFolderId(String folderId) {
		this.folderId = folderId;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getUploadUser() {
		return uploadUser;
	}


	public void setUploadUser(String uploadUser) {
		this.uploadUser = uploadUser;
	}



	public String getCreatedTime() {
		return createdTime;
	}


	public void setCreatedTime(String createdTime) {
		this.createdTime = createdTime;
	}


	public Integer getStatus() {
		return status;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}


	public String getOwnerId() {
		return ownerId;
	}


	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}

	
	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	@Override
	public String toString() {
		return "Doc [id=" + id + ", fileId=" + fileId + ", name=" + name + ", folderId=" + folderId + ", description="
				+ description + ", uploadUser=" + uploadUser + ", ownerId=" + ownerId + ", createdTime=" + createdTime
				+ ", type=" + type + ", status=" + status + "]";
	}
	
	/************toString()***************/
	
}
