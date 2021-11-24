package shop;


public class CommandFactory {
	private CommandFactory() {}
	private static CommandFactory instance = new CommandFactory();
	public static CommandFactory getInstance() {
		return instance;
	}
	
	public CommandIf createCommand(String cmd) {
		CommandIf cmdIf = null;
		if(cmd.equals("/shop.shop")) {
			cmdIf = new ShopCommand();
		}else if(cmd.equals("/input.shop")) {
			cmdIf = new CategoryInputCommand();
		}else if(cmd.equals("/inputok.shop")) {
			cmdIf = new CategoryInputOkCommand();
		}else if(cmd.equals("/list.shop")) {
			cmdIf = new CategoryListCommand();
		}else if(cmd.equals("/delete.shop")) {
			cmdIf = new CategoryDeleteCommand();
		}
		return cmdIf;
	}
}












