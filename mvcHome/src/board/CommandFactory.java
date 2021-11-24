package board;

public class CommandFactory {
	private CommandFactory() {}
	private static CommandFactory instance = new CommandFactory();
	public static CommandFactory getInstance() {
		return instance;
	}
	
	public CommandIf createCommand(String cmd) {
		CommandIf cmdIf = null;
		if (cmd.equals("/list.board")) {
			cmdIf = new ListBoardCommand();
		}else if (cmd.equals("/writeForm.board")) {
			cmdIf = new WriteFormBoardCommand();
		}else if (cmd.equals("/writePro.board")) {
			cmdIf = new WriteProBoardCommand();
		}else if (cmd.equals("/content.board")) {
			cmdIf = new ContentBoardCommand();
		}else if (cmd.equals("/deleteForm.board")) {
			cmdIf = new DeleteFormBoardCommand();
		}else if (cmd.equals("/deletePro.board")) {
			cmdIf = new DeleteProBoardCommand();
		}else if (cmd.equals("/updateForm.board")) {
			cmdIf = new UpdateFormBoardCommand();
		}else if (cmd.equals("/updatePro.board")) {
			cmdIf = new UpdateProBoardCommand();
		}
		return cmdIf;
	}
}












