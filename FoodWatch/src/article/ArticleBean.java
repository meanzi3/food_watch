package article;

public class ArticleBean {
	
	private int articleId;
	private String articleTitle;
	private String articleContent;
	private String storeName;
	private String storeAddress;
	private int price;
	private int newPrice;
	private String category; 
	private String ownerId;
	private Integer sold; // 팔렸는지 체크 -> 팔렸으면 1
	
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}
	public String getArticleContent() {
		return articleContent;
	}
	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreAddress() {
		return storeAddress;
	}
	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getNewPrice() {
		return newPrice;
	}
	public void setNewPrice(int newPrice) {
		this.newPrice = newPrice;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}
	public Integer getSold() {
		return sold;
	}
	public void setSold(Integer sold) {
		this.sold = sold;
	}
	
	
	public ArticleBean(int articleId, String articleTitle, String articleContent, String storeName, String storeAddress, int price,
			int newPrice, String category, String ownerId, Integer sold) {
		super();
		this.articleId = articleId;
		this.articleTitle = articleTitle;
		this.articleContent = articleContent;
		this.storeName = storeName;
		this.storeAddress = storeAddress;
		this.price = price;
		this.newPrice = newPrice;
		this.category = category;
		this.ownerId = ownerId;
		this.sold = sold;
	}
	
	public ArticleBean() {
		
	}
	
}
