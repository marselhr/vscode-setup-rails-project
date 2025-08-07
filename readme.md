# Rails Development Setup

Setup development environment yang nyaman untuk Rails aplikasi yang berjalan di dalam Docker container.

## Tools & Extensions yang Terinstall

### VS Code Extensions:

- **Ruby LSP** - Language server untuk Ruby dengan fitur lengkap
- **Rails Extension** - Support khusus untuk Rails development
- **Ruby Solargraph** - Additional Ruby language server
- **Ruby** - Ruby language support
- **Endwise** - Auto-completion untuk Ruby blocks
- **Ruby Rubocop** - Linting dan formatting Ruby code
- **Tailwind CSS IntelliSense** - CSS framework support
- **Auto Rename Tag** - HTML/ERB tag management
- **Prettier** - Code formatter
- **Docker** - Container management
- **Dev Containers** - Development dalam container
- **VSCode rdbg Ruby Debugger** - Ruby debugging support

### Konfigurasi Development:

- **Ruby LSP** dikonfigurasi untuk auto-completion dan diagnostics
- **Auto-formatting** dengan Rubocop on save
- **File associations** untuk ERB, Gemfile, Rakefile
- **Emmet support** untuk ERB files
- **Search exclusions** untuk folder yang tidak perlu (tmp, log, gems, etc.)

## Cara Menggunakan

### 1. Development dengan Dev Container (Recommended)

Dev Container memungkinkan Anda bekerja langsung di dalam container Rails:

1. Buka VS Code
2. Install extension "Dev Containers" (sudah terinstall)
3. Press `Ctrl+Shift+P` dan pilih "Dev Containers: Reopen in Container"
4. VS Code akan restart dan membuka workspace di dalam container

Keuntungan Dev Container:

- ✅ Ruby LSP berjalan di environment yang sama dengan aplikasi
- ✅ Auto-completion dan diagnostics lebih akurat
- ✅ Debugging berjalan langsung di container
- ✅ Terminal langsung di dalam container

### 2. Development dengan Workspace Lokal

Jika lebih prefer development lokal:

1. Buka file `sumtestinspinia.code-workspace`
2. VS Code akan membuka multi-folder workspace
3. Gunakan tasks dan terminal commands untuk interaksi dengan container

## Commands & Tasks

### Menggunakan VS Code Tasks (Ctrl+Shift+P → "Tasks: Run Task")

- **Start Rails Server** - Menjalankan Rails server di container
- **Rails Console** - Membuka Rails console
- **Run Tests** - Menjalankan semua tests
- **Bundle Install** - Install gems
- **Rails Generate** - Generator Rails (interactive)
- **Database Migrate** - Menjalankan database migrations
- **Database Setup** - Setup database
- **Rubocop** - Code linting
- **Rubocop Auto-correct** - Auto-fix code issues
- **Start/Stop Docker Compose** - Manage containers

### Menggunakan Script Helper (./dev.sh)

```bash
# Menjalankan server
./dev.sh server

# Membuka console
./dev.sh console

# Running tests
./dev.sh test
./dev.sh test test/models/user_test.rb

# Database operations
./dev.sh migrate
./dev.sh setup
./dev.sh reset

# Code quality
./dev.sh rubocop
./dev.sh rubocop-fix

# Container management
./dev.sh up
./dev.sh down
./dev.sh shell

# Lihat semua commands
./dev.sh help
```

## Debugging

### Setup Debug di Container:

1. Pastikan gem `debug` ada di Gemfile (sudah ada)
2. Tambahkan `binding.break` di code yang ingin di-debug
3. Gunakan launch configuration "Debug Rails Server"
4. Atau jalankan: `./dev.sh server` dan attach debugger

### Debug Configurations yang Tersedia:

- **Debug Rails Server** - Debug server yang berjalan
- **Debug Current Test File** - Debug file test yang sedang dibuka
- **Debug Rails Console** - Debug di Rails console

## Tips Development

### Ruby LSP Features:

- ✅ **Go to Definition** (F12)
- ✅ **Find References** (Shift+F12)
- ✅ **Auto-completion** (Ctrl+Space)
- ✅ **Hover Documentation** (hover mouse)
- ✅ **Code Actions** (Ctrl+.)
- ✅ **Document Symbols** (Ctrl+Shift+O)
- ✅ **Workspace Symbols** (Ctrl+T)

### Keyboard Shortcuts:

- `Ctrl+Shift+P` - Command Palette
- `Ctrl+Shift+T` - Reopen closed terminal
- ` Ctrl+``  ` - Toggle terminal
- `F5` - Start debugging
- `Ctrl+F5` - Run without debugging

### File Associations:

- `.rb` files → Ruby with full LSP support
- `.erb` files → ERB with HTML Emmet
- `Gemfile` → Ruby syntax
- `.rake` files → Ruby syntax

## Port Forwarding

Container ports yang ter-expose:

- **3036** - Rails server
- **3306** - MariaDB (internal)
- **6379** - Redis (internal)

## Troubleshooting

### LSP tidak bekerja:

1. Pastikan di dalam container atau local Ruby sudah terinstall
2. Restart Ruby LSP: `Ctrl+Shift+P` → "Ruby LSP: Restart"
3. Check output: View → Output → Ruby LSP

### Container issues:

```bash
# Rebuild container
./dev.sh down
./dev.sh build
./dev.sh up

# Reset database
./dev.sh reset
```

### Performance issues:

- Exclude folders: tmp, log, gems dari search
- Disable file watching untuk folder besar
- Gunakan Dev Container untuk performa LSP yang lebih baik

## Structure

```
.devcontainer/          # Dev Container configuration
  └── devcontainer.json # Container setup dan extensions
.vscode/               # VS Code workspace settings
  ├── settings.json    # Editor dan extension settings
  ├── tasks.json       # Development tasks
  └── launch.json      # Debug configurations
dev.sh                 # Development helper script
sumtestinspinia.code-workspace  # Multi-folder workspace
```

Selamat coding! 🚀
