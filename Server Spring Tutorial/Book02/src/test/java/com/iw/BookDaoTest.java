package com.iw;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.iw.dao.BookDao;
import com.iw.entity.Book;

import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertThat;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Book01Application.class)
@WebAppConfiguration
public class BookDaoTest {

	@Autowired
	private BookDao bookDao;
	
	
	@Test
	public void findAll() {
		
		List<Book> bookList = bookDao.findAll();
		assertThat(bookList.size(), is(0));
	}

}
