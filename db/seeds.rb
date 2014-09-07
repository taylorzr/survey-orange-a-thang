zach = User.create(email: "taylorzr@gmail.com", password: "password")


math = Survey.create(name: "Math Test", creator: zach)

  one_plus_one = Question.create(text: "What is 1 + 1?", survey: math)

    one = Choice.create(text: "1", question: one_plus_one)
    two = Choice.create(text: "2", question: one_plus_one)
    three = Choice.create(text: "3", question: one_plus_one)

    1.times{ Answer.create(question: one_plus_one, choice: one) }
    6.times{ Answer.create(question: one_plus_one, choice: two) }
    3.times{ Answer.create(question: one_plus_one, choice: three) }


  two_plus_two = Question.create(text: "What is 2 + 2?", survey: math)

    choice1 = Choice.create(text: "3", question: two_plus_two)
    choice2 = Choice.create(text: "4", question: two_plus_two)
    choice3 = Choice.create(text: "5", question: two_plus_two)

    1.times{ Answer.create(question: two_plus_two, choice: choice1) }
    6.times{ Answer.create(question: two_plus_two, choice: choice2) }
    3.times{ Answer.create(question: two_plus_two, choice: choice3) }


philosophy = Survey.create(name: "Philosophy Survey", creator: zach)

  existence_question = Question.create(text: "To be or not to be?", survey: philosophy)

    to_be = Choice.create(text: "To be", question: existence_question)
    not_to_be = Choice.create(text: "Not to be", question: existence_question)

    9.times{ Answer.create(question: existence_question, choice: to_be) }
    1.times{ Answer.create(question: existence_question, choice: not_to_be) }

  god_question = Question.create(text: "Does god exist?", survey: philosophy)

    yes = Choice.create(text: "Yes", question: god_question)
    no = Choice.create(text: "No", question: god_question)
    nonsense = Choice.create(text: "The concept of god is nonsensical", question: god_question)

    4.times{ Answer.create(question: god_question, choice: yes) }
    4.times{ Answer.create(question: god_question, choice: no ) }
    1.times{ Answer.create(question: god_question, choice: nonsense) }
    1.times{ Answer.create(question: god_question, choice: nonsense) }

  answer_question = Question.create(text: "What is the answer to life the universe and everything?", survey: philosophy)

    fourty_two = Choice.create(text: "42", question: answer_question)

    42.times{ Answer.create(question: answer_question, choice: fourty_two) }


devbootcamp = Survey.create(name: "Devbootcamp Survey", creator: zach)

  cohort_question = Question.create(text: "Which cohort is the best?", survey: devbootcamp)

    mantis = Choice.create(text: "Matises: Amen", question: cohort_question)
    bobo = Choice.create(text: "Bobo-Links: Tweet Tweet", question: cohort_question)
    heron = Choice.create(text: "Herons: Rawr", question: cohort_question)

    30.times{ Answer.create(question: cohort_question, choice: mantis) }
    2.times{ Answer.create(question: cohort_question, choice: bobo) }
    2.times{ Answer.create(question: cohort_question, choice: heron) }

