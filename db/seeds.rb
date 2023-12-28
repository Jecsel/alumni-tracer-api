UserRole.create([{name:'alumnus'},{name: 'admin'},{name:'super admin'}])
UserType.create([{name:'regular'},{name:'admin'}])

User.create(username: 'admin@gmail.com', password: '123123123', user_role_id: 3, user_type_id: 2, is_active: true)
User.create(username: 'user@gmail.com', password: '123123123', user_role_id: 1, user_type_id: 1, is_active: true)