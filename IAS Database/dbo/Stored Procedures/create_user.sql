  CREATE procedure [dbo].[create_user](
  @login varchar(128),
  @password varchar(128),
  @first_name varchar(128),
  @last_name varchar(128),
  @id_group int
  )
  as
  begin
	
		insert into core.users (login, password, first_name, last_name, id_group, status)
		values (@login , @password, @first_name, @last_name, @id_group, 'A')

  end

