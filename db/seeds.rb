# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# юзеры

users = User.create!([
                       {
                         username: 'alexsp',
                         password: '123abc',
                         email: 'admin@gmail.com',
                         first_name: 'Sofya',
                         second_name: 'Popova',
                         role: 'admin'
                       },
                       {
                         username: 'userr1',
                         password: '123335',
                         email: 'user@gmail.com',
                         first_name: 'Ivan',
                         second_name: 'Ivanov',
                         role: 'user'
                       }
                     ])

# категории

categories = Category.create!([
                                {
                                  title: 'Backend'
                                },
                                {
                                  title: 'Frontend'
                                },
                                {
                                  title: 'Machine Learning'
                                }
                              ])

# тесты

tests = Test.create!([
                       {
                         title: 'Rails Basics',
                         category: categories[0],
                         author: users[0]
                       },
                       {
                         title: 'Advanced Rails',
                         category: categories[0],
                         author: users[0],
                         level: 3
                       },
                       {
                         title: 'CSS Basics',
                         category: categories[1],
                         author: users[0]
                       }
                     ])

# вопросы

questions = Question.create!([
                               {
                                 title: 'Где в Rails приложении создаются классы моделей?',
                                 test: tests[0]
                               },
                               {
                                 title: 'Какая СУБД используется по умолчанию?',
                                 test: tests[0]
                               },
                               {
                                 title: 'От какого класса наследуются классы сущностей?',
                                 test: tests[0]
                               }
                             ])

# ответы

Answer.create!([
                 {
                   title: 'app/models',
                   correct: true,
                   question: questions[0]
                 },
                 {
                   title: 'config',
                   correct: false,
                   question: questions[0]
                 },
                 {
                   title: 'views',
                   correct: false,
                   question: questions[0]
                 },
                 {
                   title: 'app',
                   correct: false,
                   question: questions[0]
                 },
                 {
                   title: 'sqlite',
                   correct: true,
                   question: questions[1]
                 },
                 {
                   title: 'ApplicationRecord',
                   correct: true,
                   question: questions[2]
                 }
               ])
