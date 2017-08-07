note
	description: "Summary description for {USER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	USER
inherit
	ANY
		redefine
			default_create
		end
create
	default_create,
	make

feature {NONE} -- Initializaton

	default_create
		do
			set_name ("default_user")
			set_email ("default_email@email.org")
		end

	make (a_name, a_email: STRING_32)
		do
			set_name (a_name)
			set_email (a_email)
		end

feature -- Access

	name: STRING_32
			-- user name.

	email: STRING_32
			-- user email.

feature -- Element Change

	set_name (a_name: like name)
			-- Set `name` with `a_name'.
		do
			name := a_name
		end

	set_email (a_email: like email)
			-- Set `email' with `a_email'.
		do
			email := a_email
		end
end
