package shop.admin;

public class CommandFactory {
	private CommandFactory() {}
	private static CommandFactory instance = new CommandFactory();
	public static CommandFactory getInstance() {
		return instance;
	}
	
	public CommandIf createCommand(String cmd) {
		CommandIf cmdIf = null;
		if (cmd.equals("/main.shop")) {
			cmdIf = new MainShopCommand();
		}else if (cmd.equals("/cate_input.shop")) {
			cmdIf = new CateInputCommand();
		}else if (cmd.equals("/cate_input_ok.shop")) {
			cmdIf = new CateInputOkCommand();
		}else if (cmd.equals("/cate_list.shop")) {
			cmdIf = new CateListCommand();
		}else if (cmd.equals("/cate_delete.shop")) {
			cmdIf = new CateDeleteCommand();
		}else if (cmd.equals("/prod_input.shop")) {
			cmdIf = new ProdInputCommand();
		}else if (cmd.equals("/prod_input_ok.shop")) {
			cmdIf = new ProdInputOkCommand();
		}else if (cmd.equals("/prod_list.shop")) {
			cmdIf = new ProdListCommand();
		}else if (cmd.equals("/prod_view.shop")) {
			cmdIf = new ProdViewCommand();
		}else if (cmd.equals("/prod_delete.shop")) {
			cmdIf = new ProdDeleteCommand();
		}else if (cmd.equals("/prod_update.shop")) {
			cmdIf = new ProdUpdateCommand();
		}else if (cmd.equals("/prod_update_ok.shop")) {
			cmdIf = new ProdUpdateOkCommand();
		}
		return cmdIf;
	}
}












