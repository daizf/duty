package cn.dao;

import java.util.List;

import cn.model.Employee;

public interface EmployeeDao 
{
	//ɸѡ���е�������
	public List getAllSingleDepartmentList(String dept_id);
	
	public Employee amendUser(String user_id);
	
	public boolean getUpdateUser(Employee user);
	public boolean getDeleteUser(Employee user);
}
