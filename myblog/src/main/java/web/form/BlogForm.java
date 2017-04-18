package web.form;

import java.util.Date;

public class BlogForm {

	private String ids;// 要remove的blog的 id数组

	private String id; // 编号
	private String title; // 博客标题
	private String summary; // 摘要
	private String releaseDate; // 发布日期
	private String clickHit; // 查看次数
	private String replyHit; // 回复次数
	private String content; // 博客内容
	private String contentNoTag; // 博客内容 无网页标签 Lucene分词用
	private String typeId; // 博客类型
	private String typeName;
	private String blogCount; // 博客数量 非博客实际属性，主要是 根据发布日期归档查询博客数量用
	private String releaseDateStr; // 发布日期字符串 只取年和月
	private String keyWord; // 关键字 空格隔开
	private String author;
	
	private String page;
	private String rows;

	private String sort;
	private String order;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getClickHit() {
		return clickHit;
	}

	public void setClickHit(String clickHit) {
		this.clickHit = clickHit;
	}

	public String getReplyHit() {
		return replyHit;
	}

	public void setReplyHit(String replyHit) {
		this.replyHit = replyHit;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContentNoTag() {
		return contentNoTag;
	}

	public void setContentNoTag(String contentNoTag) {
		this.contentNoTag = contentNoTag;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getBlogCount() {
		return blogCount;
	}

	public void setBlogCount(String blogCount) {
		this.blogCount = blogCount;
	}

	public String getReleaseDateStr() {
		return releaseDateStr;
	}

	public void setReleaseDateStr(String releaseDateStr) {
		this.releaseDateStr = releaseDateStr;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
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

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

}
