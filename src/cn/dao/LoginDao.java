package cn.dao;

import java.util.List;

import cn.model.Employee;

public interface LoginDao 
{
	//����û���¼
	public Employee checkUser(Employee user);
	//������ע�Ჿ��
	public List getDepartment();
	//������ע���ɫ
	public List getRole();
	//�������ݿ�
	public boolean getUser(Employee user);
	
	public List getDepartment_single(Employee user);
}
