package login;

public class CommandFactory {
	private CommandFactory() {}
	private static CommandFactory instance = new CommandFactory();
	public static CommandFactory getInstance() {
		return instance;
	}
	
	public CommandIf createCommand(String cmd) {
		CommandIf cmdIf = null;
		if (cmd.equals("/login.log")) {
			cmdIf = new LoginCommand();
		}else if (cmd.equals("/search.log")) {
			cmdIf = new SearchLoginCommand();
		}else if (cmd.equals("/searchCheck.log")) {
			cmdIf = new SearchCheckLoginCommand();
		}else if (cmd.equals("/login_ok.log")) {
			cmdIf = new LoginOkCommand();
		}else if (cmd.equals("/logout.log")) {
			cmdIf = new LoginOutCommand();
		}
		return cmdIf;
	}
}












