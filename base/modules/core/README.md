## Core system policies and defaults.

This directory contains NixOS modules that define global system behavior shared by all machines, independent of hardware class or use case.

Modules here should establish:

- Nix configuration and evaluation policy

- System locale, timezone, and basic environment defaults

- User and authentication policy (not specific users)

- Baseline security, logging, and system limits

Files in core/ must not reference specific hardware, desktop environments, or individual users.

These modules are intended to be safe to import on any host.
