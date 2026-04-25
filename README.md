## Nyx Flake

The goal is to have a modular system that can be configured for any system that I need at any time. This is handled through modules, bundles, and user profiles.
First you have modules. Modules basically allow you to have a baseline configuration for common apps that are able to be configured.
These modules then get grouped into bundles to then be used together based on activity.
Then modules can be toggled individually or in a bundle.
Users are also handled this way by having a <USERNAME>.nix file that you define your userand then enabled in the config file for the host you would like to add said user to.
Dotfiles are also handled through the flake in user/dotfiles/<USERNAME>/. Here you can reference these dotfiles in your user profile via homemanager.

For reference here are a list of my compute systems defined in my flake

Nomad - Main laptop

Citadel - Main Compute server

Bulwark - Main Desktop

Sentinel - NVR
