package cn.services.impl;

import java.util.List;

import cn.dao.EmployeeDao;
import cn.dao.EmployeeDaoFactory;
import cn.model.Employee;
import cn.services.EmployeeServices;

public class EmployeeServicesImpl implements EmployeeServices
{
	public List getAllSingleDepartmentList(String dept_id)
	{
		EmployeeDao empDao = EmployeeDaoFactory.getEmployeeDao();
		List list = empDao.getAllSingleDepartmentList(dept_id);
		return list;
	}
	
	public Employee amendUser(String user_id)
	{
		EmployeeDao empDao = EmployeeDaoFactory.getEmployeeDao();
		Employee emp = empDao.amendUser(user_id);
		return emp;
	}
	
	public String getUpdateUser(Employee user)
	{
		EmployeeDao empDao = EmployeeDaoFactory.getEmployeeDao();
		boolean temp = empDao.getUpdateUser(user);
		String path="";
		if(temp)
		{
			System.out.println("�������ݳɹ�");
			path="admin";
		}else
		{
			System.out.println("����ʧ��");
			path="updateEmployee";
		}
		return path;
	}
	
	public String getDeleteUser(Employee user)
	{
		EmployeeDao empDao = EmployeeDaoFactory.getEmployeeDao();
		boolean temp = empDao.getDeleteUser(user);
		String path="";
		if(temp)
		{
			System.out.println("ɾ�����ݳɹ�");
			path="admin";
		}else
		{
			System.out.println("ɾ������ʧ��");
		}
		return path;
	}
}