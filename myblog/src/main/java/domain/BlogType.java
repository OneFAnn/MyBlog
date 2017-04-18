package domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity  
@Table(name="t_blogtype") 
public class BlogType implements Serializable{

	private Integer id; // 编号
	private String typeName; // 博客类型名称
	//private Integer blogCount; // 数量
	private Integer orderNo; // 排序 从小到大排序显示
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name = "typeName")
	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
//	@Column(name = "blogCount")
//	public Integer getBlogCount() {
//		return blogCount;
//	}
//
//	public void setBlogCount(Integer blogCount) {
//		this.blogCount = blogCount;
//	}
	@Column(name = "orderNo")
	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

}
