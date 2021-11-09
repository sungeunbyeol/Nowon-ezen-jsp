<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<%!
		int count = 0;
		String path = "";
		public void jspInit(){ 
			path = this.getServletContext().getRealPath("count/count.txt");
			FileReader fr = null;
			BufferedReader br = null;
			try{
				File file = new File(path);
				fr = new FileReader(file);
				br = new BufferedReader(fr);
				String line = br.readLine();
				if(line == null){
					count = Integer.parseInt(line.trim());
				}
				br.close();
			}catch(FileNotFoundException e){
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
				//File file = new File(path);
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
		if(session.isNew()){ //session�� ���Ӱ� ���������? 
			count++; //�׷��� count�� ������
		}
		
		if(count%10 == 0){
			countSaveFile();
		}
%>

<b>�湮�ڼ� : </b>
<%
		String countStr = String.valueOf(count);
		String upPath = request.getContextPath()+"/img/no";
		for(int i=0; i<countStr.length(); ++i){
			String filename = upPath + countStr.charAt(i)+".gif";%>
			<img src="<%=filename %>">
<%} %>
