# 3. Introduce PageObject via SitePrism for Testing

Date: 2023-06-09

## Status

Rejected

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

- [DFE-Digital/publish-teacher-training](https://github.com/DFE-Digital/publish-teacher-training)
- [DFE-Digital/early-careers-framework](https://github.com/DFE-Digital/early-careers-framework)
- [DFE-Digital/early-years-foundation-recovery](https://github.com/DFE-Digital/early-years-foundation-recovery)
- [DFE-Digital/npq-registration](https://github.com/DFE-Digital/npq-registration)
- [DFE-Digital/register-trainee-teachers](https://github.com/DFE-Digital/register-trainee-teachers)
- [DFE-Digital/apply-for-qualified-teacher-status](https://github.com/DFE-Digital/apply-for-qualified-teacher-status)
- [DFE-Digital/get-help-with-tech](https://github.com/DFE-Digital/get-help-with-tech)

## Decision

As [described on this PR comment](https://github.com/DFE-Digital/international-teacher-relocation-payment/pull/49#issuecomment-1588086368), we explored the [testing guidelines](https://tech-docs.teacherservices.cloud/services/apply-for-teacher-training/testing-styleguide.html#lasjd) for 
`apply-for-teacher-training` and it looked good: simple, easy to read and 
maintain. There is no big benefit of introducing a new library (Site Prism) 
that needs to be learnt by new developers.

We have decided to stick to what apply-for-teacher-training is doing and use 
this opportunity to extend this practice to new projects.

