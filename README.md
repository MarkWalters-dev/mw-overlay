# mw-overlay

Personal Gentoo ebuild repository containing custom utilities, packages, and system tools.

- **Primary Forgejo:** [https://git.markwalters.dev/mark/mw-overlay](https://git.markwalters.dev/mark/mw-overlay)
- **GitHub Mirror:** [https://github.com/MarkWalters-dev/mw-overlay](https://github.com/MarkWalters-dev/mw-overlay)

---

## Adding the Overlay

Ensure `app-eselect/eselect-repository` and `dev-vcs/git` are installed:

```bash
sudo emerge app-eselect/eselect-repository dev-vcs/git
```

### Method 1: Using `eselect repository` (Recommended)

Add the overlay directly using `eselect repository add`:

Using SSH (authorized machines)
```bash
sudo eselect repository add mw git ssh://git@git.markwalters.dev/mark/mw-overlay.git
```
Or using HTTPS (Forgejo)
```bash
sudo eselect repository add mw git https://git.markwalters.dev/mark/mw-overlay.git
```

Or using the GitHub mirror
```bash
sudo eselect repository add mw git https://github.com/MarkWalters-dev/mw-overlay.git
```

Sync the repository:

```bash
sudo emaint sync -r mw
```

---

### Method 2: Manual `repos.conf`

Alternatively, create `/etc/portage/repos.conf/mw.conf`:

```ini
[mw]
location = /var/db/repos/mw
sync-type = git
sync-uri = https://git.markwalters.dev/mark/mw-overlay.git
auto-sync = yes
priority = 50
```

Then sync:

```bash
sudo emaint sync -r mw
```

---

## Local Development / Working Tree

To test local changes directly against a development checkout without syncing:

```ini
[mw]
location = /home/john/code/mw-overlay
auto-sync = no
priority = 50
```

---

## Available Packages

| Category | Package | Description |
| :--- | :--- | :--- |
| `dev-util` | `code-audit` | Unified multi-ecosystem CLI code auditor |
