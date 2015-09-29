package if688.lexer;

public class Int extends Token {
	private final int value;
	public Int(int value) {
		super(Tag.NUM);
		this.value=value;
	}
	public Int(String yytext) {
		super(Tag.NUM);
		this.value=Integer.parseInt(yytext);
	}
	public int getvalue(){
		return this.value;
	}
	@Override
	public String toString() {
		return "Num [value=" + value + "]";
	}

}
