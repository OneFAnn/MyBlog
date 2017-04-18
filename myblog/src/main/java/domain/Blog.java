package domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity  
@Table(name="t_blog") 
public class Blog implements Serializable{
   /*
    * CREATE TABLE `t_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `summary` varchar(400) DEFAULT NULL,
  `releaseDate` datetime DEFAULT NULL,
  `clickHit` int(11) DEFAULT NULL,
  `replyHit` int(11) DEFAULT NULL,
  `content` text,
  `typeId` int(11) DEFAULT NULL,
  `keyWord` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `t_blog_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `t_blogtype` (`id`)
)
    */
	
	private Integer id; // 编号
	private String title; // 博客标题
	private String summary; // 摘要
	private Date releaseDate; // 发布日期
 	private Integer clickHit; // 查看次数
	private Integer replyHit; // 回复次数
	private String content; // 博客内容
	private String contentNoTag; // 博客内容 无网页标签 Lucene分词用
	private BlogType blogType; // 博客类型
	
	private Integer blogCount; // 博客数量 非博客实际属性，主要是 根据发布日期归档查询博客数量用
	private String releaseDateStr; // 发布日期字符串 只取年和月
	private String keyWord; // 关键字 空格隔开
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name = "title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Column(name = "summary")
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	@Column(name = "releaseDate")
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	@Column(name = "clickHit")
	public Integer getClickHit() {
		return clickHit;
	}
	public void setClickHit(Integer clickHit) {
		this.clickHit = clickHit;
	}
	@Column(name = "replyHit")
	public Integer getReplyHit() {
		return replyHit;
	}
	public void setReplyHit(Integer replyHit) {
		this.replyHit = replyHit;
	}
	@Column(name = "content")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Column(name = "contentNoTag")
	public String getContentNoTag() {
		return contentNoTag;
	}
	public void setContentNoTag(String contentNoTag) {
		this.contentNoTag = contentNoTag;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "typeId")
	public BlogType getBlogType() {
		return blogType;
	}
	public void setBlogType(BlogType blogType) {
		this.blogType = blogType;
	}
	@Column(name = "blogCount")
	public Integer getBlogCount() {
		return blogCount;
	}
	public void setBlogCount(Integer blogCount) {
		this.blogCount = blogCount;
	}
	@Column(name = "releaseDateStr")
	public String getReleaseDateStr() {
		return releaseDateStr;
	}
	public void setReleaseDateStr(String releaseDateStr) {
		this.releaseDateStr = releaseDateStr;
	}
	@Column(name = "keyWord")
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

}
