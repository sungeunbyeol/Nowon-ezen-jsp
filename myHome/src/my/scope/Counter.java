package my.scope;

public class Counter {
	private int num;
	
	public Counter() {
		System.out.println("Counter ��ü�� �����Ǿ����ϴ�.");
	}
	
	public void setCount(int i) {
		num += i;
	}
	
	public int getCount() {
		return num;
	}
}
