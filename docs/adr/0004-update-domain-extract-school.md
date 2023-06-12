# 3. Update domain: extract school

Date: 2023-06-12

## Status

Accepted

## Context

The information about the school: `name`, `postcode` and `headteacher name` is 
currently stored in the `Applicant`. As we are adding more functionality and 
validations to the Applicant journey, we are finding ourselves with code 
that does not look easy to read and reason about.

For example, the applicant domain class has two postcodes:

1. Postcode for his address (postcode)
2. Postcode for the school (school_postcode)

This also happens for the `name`, and will happen for more attributes as we 
have been requested to also add the school `address`.

## Decision

Extract the School domain class that stores:

- name
- postcode
- headteacher name

School will have a FK to Applicant in a one-to-one association. If the 
applicant is removed then the school will be removed as well.

Although column names will change over time, the eventual table structure will look something like this:

![data model](0004-data-model-update.png)

## Consequences

This will make the Applicant domain class easier to read and reason about, 
although the domain will be a bit more complex.
