# Nix Installation and Dotfiles Setup

This guide explains how to install Nix and set up your dotfiles manually.

#### Step 1: Install Nix

1. **Install Nix using the command line:**

   Nix can be installed using the official installer provided by [Determinate Systems](https://github.com/DeterminateSystems/nix-installer).

   Run the following command to install Nix:

   ```bash
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
   ```

   This will download and install Nix on your system.

2. **Verify the installation:**

   After the installation completes, verify that Nix has been installed successfully by running:

   ```bash
   nix --version
   ```

   If you see the version number printed, Nix has been installed correctly.

3. **Restart your system (if needed):**

   On macOS, Nix may require a system restart to fully configure system paths and settings. If you experience any issues after installation, restart your system and try running the commands again.

#### Step 2: Clone the Dotfiles Repository

1. **Clone the dotfiles repository:**

   Use `git` to clone the repository into your home directory:

   ```bash
   git clone git@github.com:gaganref/dotfiles.git ~/dotfiles
   ```

   This command will clone the `dotfiles` repository into the `~/dotfiles` directory.

#### Step 3: Symlink the Dotfiles

1. **Navigate to the dotfiles directory:**

   Change your working directory to `~/dotfiles`:

   ```bash
   cd ~/dotfiles
   ```

2. **Run `stow .` to create symlinks:**

   Use `stow` to symlink the dotfiles to your home directory:

   ```bash
   stow .
   ```

   This command will create symbolic links for the dotfiles in your home directory.

#### Step 4: Restart the Terminal

Once you've completed the steps above, close and reopen your terminal to apply the changes.

---

### Troubleshooting

- **Nix installation issues:** If Nix doesn't work after installation, especially on macOS, it might require a system restart. Restart your system and try again.
  
- **Git clone issues:** Ensure you have proper access to GitHub and that your SSH keys are set up if you're cloning via SSH (`git@github.com`). Alternatively, you can clone via HTTPS if you face issues with SSH:

  ```bash
  git clone https://github.com/gaganref/dotfiles.git ~/dotfiles
  ```

