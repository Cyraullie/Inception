# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cgoldens <cgoldens@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/11/19 15:29:22 by cgoldens          #+#    #+#              #
#    Updated: 2025/11/19 15:34:43 by cgoldens         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = RPN

SRCDIR = ./
INCDIR = ./
OBJDIR = ./build/

CC = c++
CFLAGS = -Wall -Wextra -Werror -std=c++98
RM = rm -rf

SRCS = $(shell find $(SRCDIR) -type f -name "*.cpp")
OBJS = $(SRCS:$(SRCDIR)%.cpp=$(OBJDIR)%.o)

GREEN = \033[1;32m
CYAN = \033[1;36m
YELLOW = \033[1;33m
RESET = \033[0m

# Règles
all: header $(NAME)

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

${OBJDIR}%.o: $(SRCDIR)%.cpp
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -I$(INCDIR) -c -o $@ $<

$(NAME): $(OBJS) 
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME)
	@echo "$(CYAN)Build completed!$(RESET)"

clean:
	@echo "$(YELLOW)Cleaning object files...$(RESET)"
	$(RM) $(OBJS)
	$(RM) $(OBJDIR)

fclean: clean
	@echo "$(YELLOW)Cleaning $(NAME) binary$(RESET)"
	$(RM) $(NAME)


re: fclean all

.PHONY: all clean fclean re