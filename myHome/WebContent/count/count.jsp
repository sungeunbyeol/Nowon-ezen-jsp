<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<!-- count.jsp -->
<%--
		jsp life cycle(jsp �����ֱ�)
		1. jspInit() : jsp������ ����ɶ� ���� ���� �ҷ����� ����Ǵ� �޼ҵ�
		2. _jspService() : jspInit()�޼ҵ� ���� ��(������ �ٷ� �� �޼ҵ� ����) ����
		3. jspDestroy() : ���� ����� �ҷ����� ����Ǵ� �޼ҵ�
		
		jspInit() �� jspDestroy()�� �������̵��ؼ� ����Ѵ�
		_jspService() �� �������̵尡 �ȵȴ�
--%>

<%! 
		int count = 0;
		String path = "";
		public void jspInit(){
			path = this.getServletContext().getRealPath("count/count.txt");
			FileReader fr = null;
			BufferedReader br = null;
			try{
				fr = new FileReader(path);
				br = new BufferedReader(fr);
				String line = br.readLine();
				if (line != null){
					count = Integer.parseInt(line.trim());
				}
				br.close();
			}catch(FileNotFoundException e){
				System.err.println(e.getMessage());
				countSaveFile();
			}catch(IOException e){
				System.err.println(e.getMessage());
				countSaveFile();
			}
		}
		
		public void countSaveFile(){
			FileWriter fw = null;
			PrintWriter pw = null;
			try{
				fw = new FileWriter(path);
				pw = new PrintWriter(fw, true);
				pw.println(count);
				pw.close();
			}catch(IOException e){
				System.err.println(e.getMessage());
			}
		}
		
		public void jspDestroy(){
			countSaveFile();
		}
%>
<%
		if (session.isNew()){
			count++;
		}

		if (count%10 == 0){
			countSaveFile();
		}
%>
<b>�湮Ƚ�� : </b>
<%
		String countStr = String.valueOf(count);
		String upPath = request.getContextPath()+"/img/no";
		for(int i=0; i<countStr.length(); ++i){
			String filename = upPath +countStr.charAt(i)+".gif";%>
			<img src="<%=filename%>">
<%	}%>








