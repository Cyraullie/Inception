# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cgoldens <cgoldens@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/11/19 15:29:22 by cgoldens          #+#    #+#              #
#    Updated: 2026/03/24 13:38:09 by cgoldens         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DCPATH = -f ./srcs/docker-compose.yml

RM = rm -rf

GREEN = \033[1;32m
CYAN = \033[1;36m
YELLOW = \033[1;33m
RESET = \033[0m

# Règles
all: header up

header:
	@echo "$(GREEN)"
	@echo "  _____                      _   _             "
	@echo " |_   _|                    | | (_)            "
	@echo "   | |  _ __   ___ ___ _ __ | |_ _  ___  _ __  "
	@echo "   | | | '_ \\ / __/ _ \\ '_ \\| __| |/ _ \\| '_ \\ "
	@echo "  _| |_| | | | (_|  __/ |_) | |_| | (_) | | | |"
	@echo " |_____|_| |_|\\___\\___| .__/ \\__|_|\\___/|_| |_|"
	@echo "                      | |                      "
	@echo "                      |_|                      "
	@echo "BY CGOLDENS"
	@echo "$(RESET)"


check_env:
	@if [ ! -f .env ]; then \
		echo "❌ Missing .env file"; \
		echo "👉 Please create it before running the project"; \
		exit 1; \
	fi

up: check_env
	@echo "$(YELLOW)Launching docker container...$(RESET)"
	@mkdir -p /home/cgoldens/data/
	@mkdir -p /home/cgoldens/data/mariadb
	@mkdir -p /home/cgoldens/data/wordpress
	@docker compose $(DCPATH) up -d
	@echo "$(CYAN)Launching completed!$(RESET)"

down:
	@echo "$(YELLOW)Stopping docker container...$(RESET)"
	@docker compose $(DCPATH) down
	@echo "$(CYAN)Docker container stopped !$(RESET)"

clean:
	sudo docker system prune -af

fclean: clean
	sudo rm -rf /home/cgoldens/data
	sudo docker volume rm -f srcs_wp_database
	sudo docker volume rm -f srcs_wp_files


re: down fclean up

.PHONY: all up down re fclean