# Survey Gorilla

## Learning Competencies

* Use form controls to pass data into a server application
* Use the MVC pattern in web applications with proper allocation of code and
  responsibilities to each layer
* Implement CRUD in an MVC application
* Use jQuery

## Summary

We're going to build a survey application that lets users create their own
multiple-choice polls and other users to vote in them.

This is going to use a combination of pure JavaScript and AJAX to achieve the
desired effects.

A survey will have many questions.  Each question will have many possible
responses.  A voter will select one (and only one) response for each question
in a survey.

## Releases

### Release 0: Design

Spend a solid design period with your team developing your design and team
approach.

#### Wireframes

Create a solid set of wireframes of the pages/ states of pages of your
application.  Use a tool like [Balsamiq][Balsamiq] or sketch them on paper.

Discuss what your core pages are and what your core user flows are.  There
should be two core flows: survey creation and survey completion.

#### User Stories

Create a solid set of user stories for your application.  Use your wireframes
to guide stories (ie what happens when a user clicks here?).

You have two types of users in this application, survey creators and survey
takers; build stories for both.

List your user stories in Trello.

#### MVP

Decide what your MVP will be.  Make sure you have wireframes and user stories for all parts of your MVP.

Create a repository for your project. In your repository README include
  * Team name and team members
  * A brief description of your MVP
  * A link to your team Trello board
  * A link to your wireframes
  * A brief description of your team dynamic and git workflow.


### Release 1 : Models

This schema will be fairly complex
and it will help to think in terms of survey-creators versus survey-voters. (You may want to refer back to the polling challenges)

There should be at least 6 core models/tables.  You'll need a table to hold
rows that represent the following sort of facts:

1. User A exists
2. User A created Survey X
3. Question Y belongs to Survey X
4. Possible Choice Z belongs to Question Y
5. User B completed Survey X
6. User B chose Possible Choice Z for Question Y

Each of these should correspond to a single table in your database and a single model in your app.

Users need to be signed in to create a survey and vote in a survey.

Make sure your models support all of your user stories.

### Release 2: Survey Creation

Users will want to create their surveys "in one go" by adding multiple
questions and choices per question on a single page.  This is an opportunity to
create some fun dynamic forms.  Check these out:

* [Adding Form Fields Dynamically with jQuery][]
* [Dynamically Add Input Fields To Form Using jQuery][]
* Google "jquery dynamic form fields" to find more

To start, and for your own sanity, consider limiting each survey to a single
question.  Create a version with a single question per survey working first and
add support for multiple questions later.

Surveys should also have an optional image associated with them.
[CarrierWave][CarrierWave] is your friend; you'll come to love it with time.

### Release 3: Add Testing

This is a large application and is possibly the first application whose
complexity will wallop you into stasis mid-stream.  Testing is your friend and
will help you make sure you and  your team-mates all have the same expectations
and that code you wrote a few hours ago is still reliable.

You should implement controller tests in [RSpec][] that exercise many of
the primary actions associated with your application.  Can you `POST` the right
data to the right controller and create a new `Survey`.  Can you `GET` to a
certain URL and view a certain `Survey`?   Perhaps you want some assurance that
when you `GET` a certain `User` you can see all of his/her votes, all of
his/her votes for a given survey?

Controller tests are particularly important as you start making use of AJAX.
It will not be as obvious when things break (no redirect, no big screen of
stack trace) therefore having controller tests in place to back you up is
important.

As you work hard to keep application logic in models and not in controllers,
you might want to add **unit** tests for the new methods / capabilities that
you are adding on these models.

Remember:  Testing in like [gauze][], you keep adding layers and layers of it
and, in aggregate, it can be a *very* effective means of care.

Below find some resources to get you started.  Most guides on using RSpec for
controller testing assume you're running Rails (which you're not, quite yet
;)), you're going to have to read between the lines to find out which tips and
examples port correctly into your application.  You won't be able to be a
[copy-and-paste ninja][] and expect things to work, you're going to have to
analyze, hypothesize, test, and interpret.

* [Testing with Sinatra and Rack][]
* [RSpec Guide on Controller Testing][]
* [Testing Rspec Controllers][]: *Look in the "Testing $METHOD_TYPE Methods" section*
* [Handy Gist][]: *Sinatra Gist*

We will evaluate your success in this based on which routes you test
(controller tests) and which interfaces (unit tests) you test.

### Release 4: Survey Taking

For now, a user has to answer every question in a survey.  You should be able
to implement this constraint using a single custom validation on a single
model.

### Release 5: Survey Results

Create a nice page that shows the survey creator the results of a survey.  If
you want to do something fancy, try using [d3.js][].  This is
very advanced.

There are other charting libraries like [Flot][] or [Highcharts][].

At the very least, create some simple HTML bar charts by having
percentage-width divs with a fixed height and solid background color so that we
can see how people responded for each question in a particular survey.

### Release 6: Advanced Features

If you're looking for more advanced features, how about something that lets a
user view a survey without logging in but pops up a [modal dialog][] to prompt
a user to sign in/sign up right before they vote?

How about more advanced visualizations, like time series?

How about focusing on making the user interface really nice?

How about multiple question types?

<!-- ## Optimize Your Learning -->

## Resources

* [CarrierWave][]
* [Adding Form Fields Dynamically with jQuery][]
* [Dynamically Add Input Fields To Form Using jQuery][]
* [d3.js][]
* [Flot][]
* [Highcharts][]
* [modal dialog][]

[Balsamiq]: http://balsamiq.com
[CarrierWave]: https://github.com/jnicklas/carrierwave
[Adding Form Fields Dynamically with jQuery]: http://www.mustbebuilt.co.uk/2012/07/27/adding-form-fields-dynamically-with-jquery/
[Dynamically Add Input Fields To Form Using jQuery]: http://www.infotuts.com/dynamically-add-input-fields-to-form-jquery/
[d3.js]: http://d3js.org/)
[Flot]: http://www.flotcharts.org/
[Highcharts]: http://www.highcharts.com/
[modal dialog]: http://www.ericmmartin.com/projects/simplemodal/
[copy-and-paste ninja]: http://sourcemaking.com/antipatterns/cut-and-paste-programming
[Testing Rspec Controllers]: http://everydayrails.com/2012/04/07/testing-series-rspec-controllers.html
[RSpec Guide on Controller Testing]: https://www.relishapp.com/rspec/rspec-rails/docs/controller-specs
[gauze]: http://www.ehow.com/how_5128414_apply-dressing-wound.html
[controller test in Rails]: http://railscasts.com/episodes/71-testing-controllers-with-rspec
[Testing with Sinatra and Rack]: http://www.sinatrarb.com/testing.html
[Handy Gist]: https://gist.github.com/mikeebert/2960172
