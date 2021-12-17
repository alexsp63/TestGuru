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
                         first_name: 'Sofya',
                         second_name: 'Popova',
                         role: 'admin'
                       },
                       {
                         username: 'userr1',
                         password: '123335',
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
                         category_id: categories[0].id,
                         author_id: users[0].id
                       },
                       {
                         title: 'Advanced Rails',
                         category_id: categories[0].id,
                         author_id: users[0].id,
                         level: 3
                       },
                       {
                         title: 'CSS Basics',
                         category_id: categories[1].id,
                         author_id: users[0].id
                       }
                     ])

# вопросы

questions = Question.create!([
                               {
                                 title: 'Где в Rails приложении создаются классы моделей?',
                                 test_id: tests[0].id
                               },
                               {
                                 title: 'Какая СУБД используется по умолчанию?',
                                 test_id: tests[0].id
                               },
                               {
                                 title: 'От какого класса наследуются классы сущностей?',
                                 test_id: tests[0].id
                               }
                             ])

# ответы

Answer.create!([
                 {
                   title: 'app/models',
                   correct: true,
                   question_id: questions[0].id
                 },
                 {
                   title: 'sqlite',
                   correct: true,
                   question_id: questions[1].id
                 },
                 {
                   title: 'ApplicationRecord',
                   correct: true,
                   question_id: questions[2].id
                 }
               ])

# результаты тестирования

users[1].tests.push([tests[0], tests[2]])
