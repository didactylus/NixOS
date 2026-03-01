This is my personal NixOS flake for all my devices I have.

The goal is to have a modular system that can be configured for any system that I need at any time. This is achieved by having 3 parts. First you have modules. Modules are small wrappers for any applications you would like yo have on any of your systems. These modules then get rolled up into bundles which package similar modules to be used together for an objective. Think having a core bundle that you want every system to have and then maybe a gaming bundle for gaming centric machines. Or maybe virtualization butndle for virtualization tasks. These bundles are then put into a configuation specific to a machine.

Users are also defined as a togglable selection. You just create a User.nix and toggle it inside the system you want to have that user on. Dotfiles are also handled through the flake so you can just git clone and keep everything in one place.

For reference here are a list of my compute systems defined in my flake

Nomad - Used for my laptops
Citadel - Used for main compute server
Bulwark - Used for my desktops
Sentinal - Used for my NVR
