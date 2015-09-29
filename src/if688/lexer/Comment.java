package if688.lexer;

public class Comment extends Token {
	public final String com;
	
	public Comment(String com) {
		super(Tag.COM);
		// TODO Auto-generated constructor stub
		this.com=new String(com);
	}

	public String getCom() {
		return com;
	}

	@Override
	public String toString() {
		return "Comment [com=" + com + "]";
	}

}
