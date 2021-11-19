package mvc1;

import java.util.*;

public class DepartExpert {
	public List<String> getAdvice(String depart){
		List<String> list = new ArrayList<>();
		switch(depart.trim()) {
		case "c" :
			list.add("1971년 벨 연구소에 의해 개발된 시스템 프로그래밍 언어");
			list.add("프로그램 기초 및 절차지향 프로그램 공부할때 많이 사용");
			list.add("현재는 C++언어와 같이 사용이 되고 있다.");
			break;
		case "java" :
			list.add("객체지향언어이다.");
			list.add("문법이 간단하다.");
			list.add("보안에 강하다.");
			list.add("아키텍처가 중립적이다.");
			list.add("이식성이 높다");
			break;
		case "python" :
			list.add("귀도 반 로섬이 만든 언어");
			list.add("c언어가 어려워 쉬운 언어를 만든 언어");
			list.add("이름은 영국 코미디프로 앞글자를 따서 만든 언어");
			break;
		case "go" :
			list.add("구글에서 개발한 언어");
			list.add("현재 서버프로그램으로 인기가 많다.");
			list.add("구글이 자바를 벗어나기 위해 만든 언어");
			break;
		}
		return list;
	}
}
