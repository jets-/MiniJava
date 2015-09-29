package if688.lexer;

public class Float extends Token {
	private final double value;
	
	public Float(int value) {
		super(Tag.DOUBLE);
		// TODO Auto-generated constructor stub
		this.value=value;
	}
	public Float(String yytext) {
		super(Tag.NUM);
		this.value=Double.parseDouble(yytext);
	}
	public double getValue() {
		return value;
	}

	@Override
	public String toString() {
		return "Float [value=" + value + "]";
	}

}
