package my.student;

public class StudentDTO {
	//DTO클래스 만들기
	//1.테이블의 컬럼값으로 멤버필드를 만들어 준다
	private String id;
	private String name;
	private String cname;
	//2.해당 멤버필드의 setter, getter 메소드를 만들어준다
	//마우스 오른쪽 눌러서 소스 눌러서 제너릭 게터 세터 눌러주고 올셀렉트 눌러서 확인
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
