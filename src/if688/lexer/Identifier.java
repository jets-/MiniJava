package if688.lexer;

public class Identifier extends Token {
	public final String id;
	public Identifier(String id) {
		super(Tag.ID);
		// TODO Auto-generated constructor stub
		this.id=id;
	}
	public String getId() {
		return id;
	}
	@Override
	public String toString() {
		return "Identifier [id=" + id + "]";
	}
	

}
