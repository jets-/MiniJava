package if688.lexer;

public class Operator extends Token {
	public final String op;
	
	public Operator(String op) {
		super(Tag.OP);
		// TODO Auto-generated constructor stub
		this.op=op;
		
	}

	public String getOp() {
		return op;
	}

	@Override
	public String toString() {
		return "Operator [op=" + op + "]";
	}

	
}
