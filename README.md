# backend-code-test
Code test for the backend position

## Requirements for the task:
- If everything is setup correctly, you should be able to run `bin/setup` and get a green RSpec run.
  - If you are running an older version of PostgreSQL, and aren't able to get the structure to the database, check db/structure.sql:12-15
- Remember that you are building an API for the frontend to consume.
- Use Rails 6
- Use jsonapi-serializer for json serialization (https://github.com/jsonapi-serializer/jsonapi-serializer)
  - Responses should be JSON:API-compliant (https://jsonapi.org)
  - No need to create includes or sparse fieldsets to be configurable from the client-side, if you don't want to.
  - Meaning you have to have includes in the response, but you can configure them directly in the controller via static string when you call a serializer.
  - No need to have links, if you don't want to.
- Use RSpec request specs for testing.
- Use the authentication found in this repo, it's there to give you a quick start on this test.
  - See welcome_spec.rb & base_controller.rb for examples.
- A couple of lines of sql is included so that you don't have to create the database structure completely by yourself. See db/structure.sql.


## Task 1:
Create 1 endpoint which returns data in a way that a frontend can show:
- Client needs to show all the time slots in an event.
- Client needs to show all the time slots in an event, with the current user's active meetings.
  - If status is cancelled or rejected meetings shouldn't be shown, check Meeting-model for enum.
- Client needs to show all the time slots in an event, with the related users who have bookmarked timeslots.
  Use-case:
    To show a schedule for an event, to see if there are any meetings booked for me,
    and to see users who participate in timeslots, so I could book meetings with them.
## Task 2:
- With the endpoint you created, list out what kind of problems you ran into and foresee in the future.
- List out solutions that you would do for the endpoint that would make it better.
    (For example from the view of scalability, readability, architecture)
- If you would have one week to implement some of those solutions, which would you pick and why?
  - Remember: This task is quite abstract, and there's no right answer.



## Task 2 (Answer):
- With the endpoint you created, list out what kind of problems you ran into and foresee in the future.
  I ran into the following problems:
    ### Composing the data needed for the endpoints. 
  
  Solutions:
    ### I would add a caching layer for the data retrievals as they can be large and frequent and not changing that much
    ### I would take into use, Service Object to better compose the data being retrieved
    ### I would add API Documentation either with OpenAPI 3 or similar tool

  If I had one week to implement these, I would refactor the code with Service Objects for cleaner and more maintable code
  and add the caching layer for better through put of the service.
