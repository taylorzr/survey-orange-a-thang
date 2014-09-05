zach = User.create(email: "taylorzr@gmail.com", password: "password")

survey1 = Survey.create(name: "Survey 1", creator: zach)

question1 = Question.create(text: "What is 1 + 1?", survey: survey1)
choice1 = Choice.create(text: "1", question: question1)
choice2 = Choice.create(text: "2", question: question1)
choice3 = Choice.create(text: "3", question: question1)

answer1 = Answer.create(question: question1, choice: choice2)
answer2 = Answer.create(question: question1, choice: choice2)
answer3 = Answer.create(question: question1, choice: choice2)
answer4 = Answer.create(question: question1, choice: choice3)

question2 = Question.create(text: "What is 2 + 2", survey: survey1)
choice1 = Choice.create(text: "3", question: question2)
choice2 = Choice.create(text: "4", question: question2)
choice3 = Choice.create(text: "5", question: question2)

answer1 = Answer.create(question: question2, choice: choice2)
answer2 = Answer.create(question: question2, choice: choice2)
answer3 = Answer.create(question: question2, choice: choice2)
answer4 = Answer.create(question: question2, choice: choice3)
