package com.iw.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iw.entity.Book;

public interface BookDao extends JpaRepository<Book, Integer> {}
