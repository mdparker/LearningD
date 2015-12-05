module mmweb.sql;

package:
    enum byIDSQL = "SELECT * FROM movie WHERE movieID=?1";
    enum byTitleSQL = "SELECT * FROM movie WHERE title=?1 ORDER BY caseNum, pageNum;";
    enum byCaseSQL = "SELECT * FROM movie WHERE caseNum=?1 ORDER BY pageNum";
    enum byCasePageSQL = "SELECT * FROM movie WHERE caseNum=?1 AND pageNum=$2 ORDER BY pageNum;";
    enum byTitleCaseSQL = "SELECT * FROM movie WHERE title=?1 AND caseNum=?2 ORDER BY caseNum, pageNum;";
    enum byAllSQL = "SELECT * FROM movie WHERE title=?1 AND caseNum=?2 AND pageNum=?3";
    enum listSQL = "SELECT * FROM movie LIMIT ?1 OFFSET ?2;";
    enum deleteSQL = "DELETE FROM movie WHERE movieID=?1;";
    enum insertSQL = "INSERT INTO movie(title, caseNum, pageNum, discNum, seasonNum) VALUES(?1, ?2, ?3, ?4, ?5);";
    enum updateSQL =
`UPDATE movie
SET title = ?1, caseNum=?2, pageNum=?3, discNum=?4, seasonNum=?5
WHERE movieID=?6;`;
    enum createTableSQL =
`CREATE TABLE IF NOT EXISTS movie (
    movieID INTEGER NOT NULL PRIMARY KEY,
    title TEXT NOT NULL,
    caseNum INTEGER NOT NULL,
    pageNum INTEGER NOT NULL,
    discNum INTEGER,
    seasonNum INTEGER
);`;