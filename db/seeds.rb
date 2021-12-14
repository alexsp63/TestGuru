# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# юзеры

users_hash = {}

User.create!([
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
]).each { |u| users_hash[u.username] = u.id}

# категории

categories_hash = {}

Category.create!([
  {
    title: 'Backend'
  },
  {
    title: 'Frontend'
  },
  {
    title: 'Machine Learning'
  }
]).each { |c| categories_hash[c.title] = c.id}

# тесты

tests_hash = {}

Test.create!([
  {
    title: 'Rails Basics',
    category_id: categories_hash['Backend'],
    author_id: users_hash['alexsp']
  },
  {
    title: 'Advanced Rails',
    category_id: categories_hash['Backend'],
    author_id: users_hash['alexsp'],
    level: 3
  },
  {
    title: 'CSS Basics',
    category_id: categories_hash['Frontend'],
    author_id: users_hash['alexsp']
  }
]).each { |t| tests_hash[t.title] = t.id}

# вопросы

questions_id_arr = []

Question.create!([
  {
    title: 'Где в Rails приложении создаются классы моделей?',
    test_id: tests_hash['Rails Basics']
  },
  {
    title: 'Какая СУБД используется по умолчанию?',
    test_id: tests_hash['Rails Basics']
  },
  {
    title: 'От какого класса наследуются классы сущностей?',
    test_id: tests_hash['Rails Basics']
  }
]).each { |q| questions_id_arr.push(q.id) }

# ответы

Answer.create!([
  {
    title: 'app/models',
    correct: true,
    question_id: questions_id_arr[0]
  },
  {
    title: 'sqlite',
    correct: true,
    question_id: questions_id_arr[1]
  },
  {
    title: 'ApplicationRecord',
    correct: true,
    question_id: questions_id_arr[2]
  }
])

# результаты тестирования

Score.create!([
  {
    test_id: tests_hash['Rails Basics'],
    user_id: users_hash['userr1']
  },
  {
    test_id: tests_hash['CSS Basics'],
    user_id: users_hash['userr1']
  }
])