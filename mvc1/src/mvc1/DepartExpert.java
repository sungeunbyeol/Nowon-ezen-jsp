package mvc1;

import java.util.*;

public class DepartExpert {
	public List<String> getAdvice(String depart){
		List<String> list = new ArrayList<>();
		switch(depart.trim()) {
		case "c" :
			list.add("1971�� �� �����ҿ� ���� ���ߵ� �ý��� ���α׷��� ���");
			list.add("���α׷� ���� �� �������� ���α׷� �����Ҷ� ���� ���");
			list.add("����� C++���� ���� ����� �ǰ� �ִ�.");
			break;
		case "java" :
			list.add("��ü�������̴�.");
			list.add("������ �����ϴ�.");
			list.add("���ȿ� ���ϴ�.");
			list.add("��Ű��ó�� �߸����̴�.");
			list.add("�̽ļ��� ����");
			break;
		case "python" :
			list.add("�͵� �� �μ��� ���� ���");
			list.add("c�� ����� ���� �� ���� ���");
			list.add("�̸��� ���� �ڹ̵����� �ձ��ڸ� ���� ���� ���");
			break;
		case "go" :
			list.add("���ۿ��� ������ ���");
			list.add("���� �������α׷����� �αⰡ ����.");
			list.add("������ �ڹٸ� ����� ���� ���� ���");
			break;
		}
		return list;
	}
}
