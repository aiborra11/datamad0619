
#Challenge1
SELECT authors.au_id AS 'AUTHOR ID', 
	authors.au_fname AS 'AUTHOR NAME', 
	authors.au_lname AS 'AUTHOR LASTNAME', 
	titles.title AS 'TITLE', 
	publishers.pub_name AS 'PUBLISHER',
	COUNT(titles.title_id) AS 'TITLE COUNT'
#how many titles each author has published at each publisher

	FROM authors
	INNER JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	INNER JOIN titles
		ON  titleauthor.title_id= titles.title_id
	INNER JOIN publishers
		ON titles.pub_name = publishers.pub_id
		GROUP BY authors.au_id, publishers.pub_name;

#Challenge2
SELECT authors.au_id AS 'Author ID', 
authors.au_fname AS 'AUTHOR NAME', 
authors.au_lname AS 'AUTHOR LASTNAME', 
publishers.pub_name AS 'PUBLISHER',
COUNT(titles.title_id) AS 'TITLE COUNT'

FROM authors
INNER JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
INNER JOIN titles
	ON  titleauthor.title_id= titles.title_id
INNER JOIN publishers
	ON titles.pub_id = publishers.pub_id
    GROUP BY authors.au_id, publishers.pub_name;
      
#Challenge3
SELECT authors.au_id AS 'AUTHOR ID', 
	authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    sum(sales.qty) AS 'TOTAL SALES'
    
    FROM authors
    INNER JOIN titleauthor
		ON 	authors.au_id = titleauthor.au_id
	INNER JOIN sales
		ON titleauthor.title_id = sales.title_id
        GROUP BY authors.au_id
        ORDER BY sum(sales.qty) DESC
        LIMIT 3;

#Challenge4
SELECT authors.au_id AS 'AUTHOR ID', 
	authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    sum(sales.qty) AS 'TOTAL SALES',
    IFNULL (SUM(sales.qty), 0) AS 'TOTAL SALES'
    
    FROM authors
    INNER JOIN titleauthor
		ON 	authors.au_id = titleauthor.au_id
	INNER JOIN sales
		ON titleauthor.title_id = sales.title_id
        GROUP BY authors.au_id
        ORDER BY sum(sales.qty) DESC
        LIMIT 23;