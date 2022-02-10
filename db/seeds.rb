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
                         password: '$2a$12$VDlnnAtwwYnzk3xvvl2/ReecvDh9INT7ZKABzWW4HzXbFNtgpEsFG',
                         email: 'admin@gmail.com',
                         first_name: 'Sofya',
                         second_name: 'Popova'
                       },
                       {
                         username: 'userr1',
                         password: '$2a$12$1wS5wv/iy5j/UBQqLV.RtOYS68ME4o4lKU2ss44fAcO9nPOCWlXYq',
                         email: 'user@gmail.com',
                         first_name: 'Ivan',
                         second_name: 'Ivanov'
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
                         author: users[0],
                         time_limit: DateTime.strptime('00:02:00', '%H:%M:%S')
                       },
                       {
                         title: 'Advanced Rails',
                         category: categories[0],
                         author: users[0],
                         level: 3,
                         time_limit: DateTime.strptime('00:02:00', '%H:%M:%S')
                       },
                       {
                         title: 'CSS Basics',
                         category: categories[1],
                         author: users[0],
                         time_limit: DateTime.strptime('00:02:00', '%H:%M:%S')
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
                   title: 'postgresql',
                   correct: false,
                   question: questions[1]
                 },
                 {
                   title: 'mysql',
                   correct: false,
                   question: questions[1]
                 },
                 {
                   title: 'ApplicationRecord',
                   correct: true,
                   question: questions[2]
                 },
                 {
                   title: 'AciveRecord',
                   correct: false,
                   question: questions[2]
                 }
               ])

Badge.create!([
                {
                  title: 'Level 1 Test Guru',
                  image_url: 'https://i.ya-webdesign.com/images/quality-seal-png-8.png',
                  description: 'All Tests with Level 1',
                  criteria: 'passed_all_tests_for_level',
                  criteria_value: '1',
                  creator: User.first
                },
                {
                  title: 'Backend Guru',
                  image_url: 'https://i.ya-webdesign.com/images/badge-transparent-clip-art-2.png',
                  description: 'All Tests with Backend Category',
                  criteria: 'passed_all_tests_for_category',
                  criteria_value: 'Backend',
                  creator: User.first
                },
                {
                  title: '1st Try Guru',
                  image_url: 'https://i.ya-webdesign.com/images/red-seal-png-13.png',
                  description: 'Test was Passed with the 1st try',
                  criteria: 'test_passed_by_try',
                  criteria_value: '1',
                  creator: User.first
                }
              ])
