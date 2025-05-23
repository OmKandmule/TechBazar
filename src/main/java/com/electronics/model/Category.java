package com.electronics.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="category")
public class Category {

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name="id")
	    private int id;

	    @Column(name="name")
	    private String name;

	    @Column(name="description")
	    private String description;

	    @Column(name="img_url")
	    private String imgUrl;

		public Category() {
			super();
		}

		public Category(int id, String name, String description, String imgUrl) {
			super();
			this.id = id;
			this.name = name;
			this.description = description;
			this.imgUrl = imgUrl;
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getImgUrl() {
			return imgUrl;
		}

		public void setImgUrl(String imgUrl) {
			this.imgUrl = imgUrl;
		}

		@Override
		public String toString() {
			return id + "  " + name + "  " + description + "  " + imgUrl;
		}

	    
	    
}
