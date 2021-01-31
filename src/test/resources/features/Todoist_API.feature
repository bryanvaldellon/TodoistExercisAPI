@api
Feature: Todoist Exercise Features for API
  Background:
    * def token = "Bearer 2164d9864a8037366a25100ac39c12fa973cff1a"
    * def uri = 'https://api.todoist.com/rest/v1/'

    @getAllProjects
  Scenario: Get all projects
    Given url uri + 'projects'
    And header Authorization = token
    When method get
    Then status 200

    @newTask
  Scenario: Create new task
    Given url uri + 'tasks'
    And request '{"content": "Appointment with Maria", "due_string": "tomorrow at 12:00", "due_lang": "en", "priority": 4}'
    And header Authorization = token
    And header Content-Type = "application/json"
    When method post
    Then status 200

  @updateTask
  Scenario: Update task
    Given url uri + 'tasks'
    And request '{"content": "Appointment with Maria", "due_string": "tomorrow at 12:00", "due_lang": "en", "priority": 4}'
    And header Authorization = token
    And header Content-Type = "application/json"
    When method post
    Then status 200
    Given def id = karate.jsonPath(response, "$.id")
    And url uri + 'tasks/' + id
    And request '{"content": "Movies to watch"}'
    And header Authorization = token
    And header Content-Type = "application/json"
    When method post
    Then status 204

  @closeTask
  Scenario: Close task
    Given url uri + 'tasks'
    And request '{"content": "Close task", "due_string": "tomorrow at 12:00", "due_lang": "en", "priority": 4}'
    And header Authorization = token
    And header Content-Type = "application/json"
    When method post
    Then status 200
    Given def id = karate.jsonPath(response, "$.id")
    And url uri + 'tasks/' + id + '/close'
    And request ''
    And header Authorization = token
    When method post
    Then status 204