# Documentation Language and Code Comment Policy

## Mandatory language

All repository-facing technical documentation must be written in clear, professional English unless the project profile explicitly declares another language. This applies to README files, architecture documents, API documentation, changelogs, migration notes, runbooks, ADRs, work items, audit reports, release notes, examples and user-facing technical guides.

English is also the default language for source-code comments, docstrings, TODO items, FIXME items, deprecation notices, test descriptions, fixture explanations, configuration comments, scripts and CI messages.

## Required documentation structure

Every README must use a predictable structure when relevant: purpose, scope, prerequisites, installation, configuration, usage, project structure, commands, testing, troubleshooting, security, contribution rules, versioning and license.

Every substantial document must include a title, scope, status, last-updated date, owner or responsible agent, assumptions, verified facts, limitations, validation evidence and references when applicable.

## Section separators

Long source files and scripts must use consistent English section separators. Use the project style consistently, for example:

```text
# -----------------------------------------------------------------------------
# Configuration
# -----------------------------------------------------------------------------
```

Do not use decorative, ambiguous or language-mixed separators. A separator must describe the section that follows it.

## Comment quality

Comments must explain intent, constraints, security considerations or non-obvious tradeoffs. Do not narrate obvious syntax, leave stale comments, duplicate the code or hide unfinished work. Every TODO or FIXME must include an owner, a reason, a reference to a work item and a clear completion condition.

## Synchronization rule

After every meaningful code, architecture, security, API, CI or deployment change, the Documentation agent must inspect and update every affected README, comment, example, changelog, ADR, work item and release note. A change is not complete while the documentation contradicts the implementation.

## Validation

Before a commit or pull request, the Documentation agent must verify English consistency, headings, links, code examples, commands, separators, stale references, version references, TODO metadata and generated documentation. The Coordinateur must reject incomplete or contradictory documentation.

If the product requires another language, keep technical repository documentation in English and create explicitly named localized documents. Never mix languages silently in the same technical document.
