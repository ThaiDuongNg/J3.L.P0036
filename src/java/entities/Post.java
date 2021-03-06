package entities;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author ThaiDuongNg
 */
public class Post {

    private int post_id;
    private String author_name;
    private Date date_time;
    private String content;
    private String post_title;
    private ArrayList<Comment> comments;
    private int numberOfComment;

    public Post() {
    }

    public Post(int post_id, String author_name, Date date_time, String content, String post_title) {
        this.post_id = post_id;
        this.author_name = author_name;
        this.date_time = date_time;
        this.content = content;
        this.post_title = post_title;
    }

    public String getPost_title() {
        return post_title;
    }

    public void setPost_title(String post_title) {
        this.post_title = post_title;
    }

    public ArrayList<Comment> getComments() {
        return comments;
    }

    public void setComments(ArrayList<Comment> comments) {
        this.comments = comments;
    }

    public int getNumberOfComment() {
        return numberOfComment;
    }

    public void setNumberOfComment(int numberOfComment) {
        this.numberOfComment = numberOfComment;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public String getAuthor_name() {
        return author_name;
    }

    public void setAuthor_name(String author_name) {
        this.author_name = author_name;
    }

    public Date getDate_time() {
        return date_time;
    }

    public void setDate_time(Date date_time) {
        this.date_time = date_time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDateFormat() {
        return new SimpleDateFormat("MMMM dd yyy '-' HH:mmaaa")
                .format(this.date_time).toLowerCase();
    }

}
