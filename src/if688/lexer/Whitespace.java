package if688.lexer;

public class Whitespace extends Token {
	public final String wp;
	
	public Whitespace(String wp) {
		super(Tag.WP);
		// TODO Auto-generated constructor stub
	this.wp=new String(wp);
	}

	public String getWp() {
		return wp;
	}

	@Override
	public String toString() {
		return "Whitespace [wp=" + wp + "]";
	}

}
