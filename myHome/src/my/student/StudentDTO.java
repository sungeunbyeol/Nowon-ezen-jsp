package my.student;

public class StudentDTO {
	//DTOŬ���� �����
	//1.���̺��� �÷������� ����ʵ带 ����� �ش�
	private String id;
	private String name;
	private String cname;
	//2.�ش� ����ʵ��� setter, getter �޼ҵ带 ������ش�
	//���콺 ������ ������ �ҽ� ������ ���ʸ� ���� ���� �����ְ� �ü���Ʈ ������ Ȯ��
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
}
