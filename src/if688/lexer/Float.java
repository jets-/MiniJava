package if688.lexer;

public class Float extends Token {
	private final double value;
	
	public Float(double value) {
		super(Tag.DOUBLE);
		// TODO Auto-generated constructor stub
		this.value=value;
	}
	public double getValue() {
		return value;
	}

	@Override
	public String toString() {
		return "Float [value=" + value + "]";
	}

}
