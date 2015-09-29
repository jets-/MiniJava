package if688.lexer;

public class Delimiter extends Token {
	public final String del;
	public Delimiter(String del) {
		super(Tag.DEL);
		// TODO Auto-generated constructor stub
		this.del=new String(del);
	}
	public String getDel() {
		return del;
	}
	@Override
	public String toString() {
		return "Delimiter [del=" + del + "]";
	}

}
