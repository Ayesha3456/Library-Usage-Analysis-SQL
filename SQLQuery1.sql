USE librarydb;
GO

SELECT * FROM dbo.library_data

/* KPI REQUIREMENTS */
/* Total Books */
SELECT COUNT(*) AS TOTAL_BOOK_COUNT FROM dbo.library_data;

/* Books Available */
SELECT COUNT(*) AS BOOKS_AVAILABLE FROM dbo.library_data WHERE Status = 'Present';

/* Books Missing */
SELECT COUNT(*) AS BOOKS_MISSING FROM dbo.library_data WHERE Status = 'Missing';

/* Average Signal Strength */
SELECT AVG(Signal_Strength) AS AVG_SIGNAL_STRENGTH FROM dbo.library_data;

/* Book Count by Category */
SELECT Category, COUNT(*) AS BOOK_COUNT FROM dbo.library_data GROUP BY Category ORDER BY BOOK_COUNT DESC;



/* Granular Requirements */
/* Book Count by Category and Status */
SELECT Category, Status, COUNT(*) AS BOOK_COUNT
FROM dbo.library_data
GROUP BY Category, Status
ORDER BY Category, Status;

/* Books by Physical Location (Cabinet, Rack, Row) */
SELECT Cabinet, Rack, Row, COUNT(*) AS BOOK_COUNT
FROM dbo.library_data
GROUP BY Cabinet, Rack, Row
ORDER BY Cabinet, Rack, Row;

/* Signal Strength by Location */
SELECT Cabinet, Rack, Row, AVG(Signal_Strength) AS AVG_SIGNAL_STRENGTH, COUNT(*) AS BOOK_COUNT
FROM dbo.library_data
GROUP BY Cabinet, Rack, Row
ORDER BY Cabinet, Rack, Row;

/* Top Authors by Book Count */
SELECT Author, COUNT(*) AS BOOK_COUNT
FROM dbo.library_data
GROUP BY Author
ORDER BY BOOK_COUNT DESC;

