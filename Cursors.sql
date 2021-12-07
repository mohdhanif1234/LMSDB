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

-- Using a cursor with cursor variables
-- declaring a cursor
declare myCursor cursor scroll for select id, email from User_Details
-- declaring a cursor variable
declare @user_id int, @user_email varchar(50)
-- opening a cursor
open myCursor
-- methods of cursors
fetch first from myCursor into @user_id, @user_email
print 'User is:' + cast(@user_id as varchar(50)) + ' ' + @user_email
fetch next from myCursor into @user_id, @user_email
print 'User is:' + cast(@user_id as varchar(50)) + ' ' + @user_email
fetch last from myCursor into @user_id, @user_email
print 'User is:' + cast(@user_id as varchar(50)) + ' ' + @user_email
fetch prior from myCursor into @user_id, @user_email
print 'User is:' + cast(@user_id as varchar(50)) + ' ' + @user_email
fetch absolute 3 from myCursor into @user_id, @user_email
print 'User is:' + cast(@user_id as varchar(50)) + ' ' + @user_email
fetch relative 1 from myCursor into @user_id, @user_email
print 'User is:' + cast(@user_id as varchar(50)) + ' ' + @user_email
fetch relative -1 from myCursor into @user_id, @user_email
print 'User is:' + cast(@user_id as varchar(50)) + ' ' + @user_email
-- closing a cursor
close myCursor
-- de-allocating a cursor
deallocate myCursor