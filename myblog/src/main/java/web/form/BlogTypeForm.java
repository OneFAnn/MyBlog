package web.form;

public class BlogTypeForm {
	private String id; // 编号
	private String typeName; // 博客类型名称
	private String blogCount; // 数量
	private String orderNo; // 排序 从小到大排序显示
	private String ids;

	private String page;
	private String rows;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getBlogCount() {
		return blogCount;
	}

	public void setBlogCount(String blogCount) {
		this.blogCount = blogCount;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

}
