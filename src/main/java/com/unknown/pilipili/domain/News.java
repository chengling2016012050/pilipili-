package com.unknown.pilipili.domain;

import com.unknown.pilipili.config.orm.IdEntity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.time.LocalDateTime;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/24 23:40
 */
@Entity
@Table(name = "T_NEWS")
public class News extends IdEntity {
    @Column(nullable = false)
    private String title;
    @Column(nullable = false)
    private String content;
    @ManyToOne(cascade= CascadeType.ALL,fetch= FetchType.EAGER)
    @JoinColumn(name="author",referencedColumnName="id")
    private User author;
    @ManyToOne(cascade= CascadeType.ALL,fetch= FetchType.EAGER)
    @JoinColumn(name="type",referencedColumnName="id")
    @Column(nullable = false)
    private Type type;
    private String imgAddr;
    private LocalDateTime createAt = LocalDateTime.now();


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public String getImgAddr() {
        return imgAddr;
    }

    public void setImgAddr(String imgAddr) {
        this.imgAddr = imgAddr;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }
}
