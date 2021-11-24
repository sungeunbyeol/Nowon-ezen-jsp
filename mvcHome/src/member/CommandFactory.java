package member;

public class CommandFactory {
	private CommandFactory() {}
	private static CommandFactory instance = new CommandFactory();
	public static CommandFactory getInstance() {
		return instance;
	}
	
	public CommandIf createCommand(String cmd) {
		CommandIf cmdIf = null;
		if (cmd.equals("/index.mem")) {
			cmdIf = new IndexMemberCommand();
		}else if (cmd.equals("/memberAll.mem")) {
			cmdIf = new ListMemberCommand();
		}else if (cmd.equals("/memberSsn.mem")) {
			cmdIf = new MemberSsnCommand();
		}else if (cmd.equals("/checkMember.mem")) {
			cmdIf = new CheckMemberCommand();
		}else if (cmd.equals("/insertMember.mem")) {
			cmdIf = new InsertMemberCommand();
		}else if (cmd.equals("/insertMemberOk.mem")) {
			cmdIf = new InsertMemberOkCommand();
		}else if (cmd.equals("/deleteMember.mem")) {
			cmdIf = new DeleteMemberCommand();
		}else if (cmd.equals("/editMember.mem")) {
			cmdIf = new EditMemberCommand();
		}else if (cmd.equals("/editMemberOk.mem")) {
			cmdIf = new EditMemberOkCommand();
		}
		return cmdIf;
	}
}












