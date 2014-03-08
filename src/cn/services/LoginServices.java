package cn.services;

import java.util.List;

import cn.model.Employee;

public interface LoginServices 
{
	//����û�
	public String checkUser(Employee user);
	//��ѯ����
	public List getDepartment();
	public List getRole();
	//�������DAO�Ĳ������ݿⷽ���Ƿ���ȷ���������ȷ��ҳ��
	public String getUser(Employee user);
	public String DepartmentListEntrance();
	public String DutyListEntrance();
	public List getDepartment_single(Employee user);
}
