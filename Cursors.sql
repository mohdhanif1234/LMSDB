-- CURSOR IN SQL SERVER
select * from User_Details;

-- Using a cursor without cursor variables
-- declaring a cursor
declare myCursor cursor scroll for select * from User_Details
-- opening a cursor
open myCursor
-- methods of cursors
fetch first from myCursor
fetch next from myCursor
fetch last from myCursor
fetch prior from myCursor
fetch absolute 3 from myCursor
fetch relative 1 from myCursor 
fetch relative -1 from myCursor
-- closing a cursor
close myCursor
-- de-allocating a cursor
deallocate myCursor

