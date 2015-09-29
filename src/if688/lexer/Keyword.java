package if688.lexer;

public class Keyword extends Token{
	public final String key;
	public Keyword (String key) {
		super(Tag.KEYWORD);
		// TODO Auto-generated constructor stub
		this.key=key;
	}
	public String getKey() {
		return key;
	}
	@Override
	public String toString() {
		return "Keyword [key=" + key + "]";
	}
	

}
