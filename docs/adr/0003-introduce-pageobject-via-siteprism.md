# 3. Introduce PageObject via SitePrism for Testing

Date: 2023-06-09

## Status

Accepted

## Context

This application consists on a high number of sequential questions and answers.
The current implementation is making the tests a bit difficult to read and
maintain.

We would like to clearly express the steps that the user is taking like:

- The user landed on the gender page
- The user transitioned to the contract detail page
- The user filled in his email address

While we can do that with the current implementation, we would need to rely
on modules, shared steps, and many other things that are not really necessary.

As a side note, page objects are used across Dfe. These are some of the 
projects:

- [DFE-Digital/publish-teacher-training](https://github.
com/DFE-Digital/publish-teacher-training)
- [DFE-Digital/early-careers-framework](https://github.
com/DFE-Digital/early-careers-framework)
- [DFE-Digital/early-years-foundation-recovery](https://github.
com/DFE-Digital/early-years-foundation-recovery)
- [DFE-Digital/npq-registration](https://github.
  com/DFE-Digital/npq-registration)
- [DFE-Digital/register-trainee-teachers](https://github.
com/DFE-Digital/register-trainee-teachers)
- [DFE-Digital/apply-for-qualified-teacher-status](https://github.
com/DFE-Digital/apply-for-qualified-teacher-status)
- [DFE-Digital/get-help-with-tech](https://github.
com/DFE-Digital/get-help-with-tech)

## Decision

Adopt PageObject pattern via [SitePrism](https://github.com/site-prism/site_prism) for testing purposes. This pattern will
provide a structured and modular way to organize our test
code, improving readability, reusability, and maintainability of our tests.

## Consequences

We will need to introduce a new dependency to our project, and we will need 
to refactor the existing code to use PageObjects. This won't require much 
time because our test suite is small as it is an early stage project at the 
moment. 
