package shop.display;

public class CommandFactory {
	private CommandFactory() {}
	private static CommandFactory instance = new CommandFactory();
	public static CommandFactory getInstance() {
		return instance;
	}
	
	public CommandIf createCommand(String cmd) {
		CommandIf cmdIf = null;
		if (cmd.equals("/main.mall")) {
			cmdIf = new ShopMainMallCommand();
		}else if (cmd.equals("/mall_cgProdList.mall")){
			cmdIf = new CgProdListMallCommand();
		}else if (cmd.equals("/mall_prodView.mall")) {
			cmdIf = new ProdViewMallCommand();
		}else if (cmd.equals("/cartAdd.mall")) {
			cmdIf = new CartAddMallCommand();
		}else if (cmd.equals("/cartList.mall")) {
			cmdIf = new CartListMallCommand();
		}else if (cmd.equals("/cartDel.mall")) {
			cmdIf = new CartDelMallCommand();
		}else if (cmd.equals("/cartEdit.mall")) {
			cmdIf = new CartEditMallCommand();
		}else if (cmd.equals("/order.mall")) {
			cmdIf = new OrderMallCommand();
		}
		return cmdIf;
	}
}












