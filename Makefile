# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cgoldens <cgoldens@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/11/19 15:29:22 by cgoldens          #+#    #+#              #
#    Updated: 2025/11/21 15:14:56 by cgoldens         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DCPATH = -f ./srcs/docker-compose.yml

RM = rm -rf

GREEN = \033[1;32m
CYAN = \033[1;36m
YELLOW = \033[1;33m
RESET = \033[0m

# Règles
up: header $(NAME)

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


$(NAME):
	@echo "$(YELLOW)Launching docker container...$(RESET)"
	@docker volume create db-data
	@docker volume create wp-data
	@docker compose $(DCPATH) up -d
	@echo "$(CYAN)Launching completed!$(RESET)"

down:
	@echo "$(YELLOW)Stopping docker container...$(RESET)"
	@docker compose $(DCPATH) down
	@echo "$(CYAN)Docker container stopped !$(RESET)"

re: stop up

.PHONY: up stop re