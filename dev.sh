#!/bin/bash

# Rails Development Helper Script
# Memudahkan development Rails di dalam container

show_help() {
    echo "Rails Development Helper - Usage:"
    echo "  ./dev.sh server       - Start Rails server"
    echo "  ./dev.sh console      - Open Rails console"
    echo "  ./dev.sh test         - Run all tests"
    echo "  ./dev.sh test [file]  - Run specific test file"
    echo "  ./dev.sh migrate      - Run database migrations"
    echo "  ./dev.sh rollback     - Rollback last migration"
    echo "  ./dev.sh setup        - Setup database"
    echo "  ./dev.sh reset        - Reset database"
    echo "  ./dev.sh routes       - Show routes"
    echo "  ./dev.sh generate     - Rails generate (interactive)"
    echo "  ./dev.sh bundle       - Bundle install"
    echo "  ./dev.sh rubocop      - Run Rubocop"
    echo "  ./dev.sh rubocop-fix  - Auto-fix Rubocop issues"
    echo "  ./dev.sh shell        - Open shell in container"
    echo "  ./dev.sh logs         - Show container logs"
    echo "  ./dev.sh up           - Start containers"
    echo "  ./dev.sh down         - Stop containers"
    echo "  ./dev.sh build        - Build containers"
    echo "  ./dev.sh help         - Show this help"
}

case "$1" in
    "server")
        echo "🚀 Starting Rails server..."
        docker-compose exec app bundle exec rails server -b 0.0.0.0 -p 3036
        ;;
    "console")
        echo "🛠️  Opening Rails console..."
        docker-compose exec app bundle exec rails console
        ;;
    "test")
        if [ -z "$2" ]; then
            echo "🧪 Running all tests..."
            docker-compose exec app bundle exec rails test
        else
            echo "🧪 Running test: $2"
            docker-compose exec app bundle exec rails test "$2"
        fi
        ;;
    "migrate")
        echo "📊 Running database migrations..."
        docker-compose exec app bundle exec rails db:migrate
        ;;
    "rollback")
        echo "↩️  Rolling back database..."
        docker-compose exec app bundle exec rails db:rollback
        ;;
    "setup")
        echo "🏗️  Setting up database..."
        docker-compose exec app bundle exec rails db:setup
        ;;
    "reset")
        echo "🔄 Resetting database..."
        docker-compose exec app bundle exec rails db:reset
        ;;
    "routes")
        echo "🗺️  Showing routes..."
        docker-compose exec app bundle exec rails routes
        ;;
    "generate")
        echo "⚡ Rails generator - Enter generator command (e.g., 'model User name:string'):"
        read -r generator_cmd
        docker-compose exec app bundle exec rails generate $generator_cmd
        ;;
    "bundle")
        echo "💎 Running bundle install..."
        docker-compose exec app bundle install
        ;;
    "rubocop")
        echo "👮 Running Rubocop..."
        docker-compose exec app bundle exec rubocop
        ;;
    "rubocop-fix")
        echo "🔧 Auto-fixing Rubocop issues..."
        docker-compose exec app bundle exec rubocop -A
        ;;
    "shell")
        echo "🐚 Opening shell in container..."
        docker-compose exec app /bin/bash
        ;;
    "logs")
        echo "📋 Showing container logs..."
        docker-compose logs -f app
        ;;
    "up")
        echo "⬆️  Starting containers..."
        docker-compose up -d
        ;;
    "down")
        echo "⬇️  Stopping containers..."
        docker-compose down
        ;;
    "build")
        echo "🔨 Building containers..."
        docker-compose build
        ;;
    "help"|"")
        show_help
        ;;
    *)
        echo "❌ Unknown command: $1"
        echo ""
        show_help
        exit 1
        ;;
esac
