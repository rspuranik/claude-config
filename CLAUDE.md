# Global Claude Guidelines

> **Note:** This file is the canonical source of truth for global guidelines.
> It lives in the `claude-config` repo and is loaded automatically at session
> start via a SessionStart hook. When editing this file, commit the change to
> this repo — the hook will pick up the new content on the next session.

## Working Style

### Plan Before Implementing
- For any non-trivial feature, change, or architectural decision: **stop and present options with trade-offs first**. Wait for explicit approval before writing code.
- "Non-trivial" means: new files, new data models, new dependencies, changes to auth/security, or anything that affects more than one component.
- If I'm heading down a path and a better alternative exists that I might not know to ask about, **proactively flag it**. Don't let me commit to a suboptimal approach just because I didn't think to ask.

### Clarify Before Assuming
- If requirements are ambiguous, ask — don't guess and build.
- State what you're about to do in one sentence before doing it.

### Done Means Working
- A task is not complete until it's been tested and confirmed to work, not just written.

---

## Design Principles

### DRY — Don't Repeat Yourself
- Before writing new code, look for existing implementations, utilities, and patterns in the codebase that can be reused.
- If similar logic exists in more than one place, flag it and propose consolidation.

### YAGNI — You Ain't Gonna Need It
- Don't add features, abstractions, or flexibility beyond what the current task requires.
- No hypothetical future-proofing. Three similar lines is better than a premature abstraction.

### Simple Over Clever
- Prefer readable, obvious code over elegant or clever solutions.

### Prefer Established Frameworks
- Default to well-supported, modern frameworks and libraries over building from scratch.
- Before adding a new dependency, check whether the existing stack already handles the need.

### Minimal Surface Area
- Don't add error handling, fallbacks, or validation for scenarios that can't happen.
- Only validate at system boundaries (user input, external APIs).

---

## Code Style

### Comments
- Write concise section-level comments so a reader can skim a file and quickly understand its structure and intent.
- Expand comments when logic is non-obvious, has hidden constraints, or would surprise a reader.
- Don't comment every line — orient the reader, don't narrate to them.

### No Unnecessary Scaffolding
- Don't create helper files, abstractions, or wrapper functions unless the task clearly requires them.
- Don't add backwards-compatibility shims for code you're deleting.

---

## UI / UX Philosophy

These projects are productivity software for people trying to get things done. Design accordingly.

### Efficiency First
- **Minimal clicks**: The shortest path to completing a task is always preferred.
- **Inline actions**: Surface common actions where the data is, not behind menus or separate pages.
- **Optimize for common use cases**: Design the primary flow for what users do 80% of the time. Edge cases can have more friction.
- **Progressive disclosure**: Show only what's needed now; reveal complexity on demand via hover, expand, or modal. Keep surfaces clean without hiding power.

### Feedback & Responsiveness
- Every action should produce immediate visual feedback — toast, spinner, state change. Users should never wonder if something worked.
- Controls should stay where users expect them. Don't move things based on state changes (preserve spatial memory).

### Accessibility Ready
- Full accessibility may not be implemented immediately, but nothing should make it harder to add later.
- Use semantic HTML elements. Don't block keyboard navigation. Always use proper labels on inputs.
- Avoid patterns that fundamentally break screen readers or focus management — these are expensive to fix retroactively.

### Aesthetics with Purpose
- Aesthetics matter. Clean, unobtrusive interfaces with a distinct character make productivity software pleasant and keep users engaged in what might otherwise feel mundane.
- Specific visual details vary by project, but the philosophy is consistent: **clean, purposeful, and quietly delightful**.
- Use typography hierarchy (size, weight, color contrast) to guide attention — not just layout.
- Avoid gratuitous decoration, but don't be sterile. The interface should feel considered and craft-forward.

---

## Communication

### Flag Potential Guidelines Updates
- If something comes up in our work that seems like it should become a general principle — for either this global file or a repo-level CLAUDE.md — **proactively suggest adding it**. These guidelines are built incrementally and I may not think to capture things in the moment.

### Keep Responses Tight
- Short, direct answers. No padding, no restating the question.
- Use headers only when the response is genuinely multi-part.
- No emojis unless asked.

---

## Security Defaults
- Always flag if a change could affect authentication, authorization, data access patterns, or user-facing security.
- Never introduce SQL injection, XSS, command injection, or other OWASP Top 10 vulnerabilities.
- Validate at system boundaries (user input, external APIs). Everywhere else, trust internal guarantees.
