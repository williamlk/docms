package org.shyfb.docms.entity;

import java.util.Date;

public class User {
	
	private Integer id;
	
	private String name;
	
	private String password;
	
	private String email;
	
	private String phone;
	
	private Integer status;
	
	private Integer del;
	
	private Date createdTime;
	
	private Date updatedTime;
	
	private Integer roleId;
	
	private Role role;
	
	/*********view**********/
	//状态描述
	private String statusDescription;
	
	//角色名称
	private String roleName;

	
	
	
	/**********getter and setter*************/
	public String getStatusDescription() {
		return statusDescription;
	}

	public void setStatusDescription(String statusDescription) {
		this.statusDescription = statusDescription;
	}


	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	

	public Integer getDel() {
		return del;
	}

	public void setDel(Integer del) {
		this.del = del;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public Date getUpdatedTime() {
		return updatedTime;
	}

	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}

	
	
	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", email=" + email + ", phone=" + phone
				+ ", status=" + status + ", del=" + del + ", createdTime=" + createdTime + ", updatedTime="
				+ updatedTime + ", roleId=" + roleId + ", role=" + role + ", statusDescription=" + statusDescription
				+ ", roleName=" + roleName + "]";
	}

	
	
	
}
