# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ethebaul <ethebaul@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/06/20 05:06:30 by ethebaul          #+#    #+#              #
#    Updated: 2025/08/01 01:27:38 by ethebaul         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BUILD_DIR			=	./build/
SRCS_DIR			=	./srcs/

MKCONFIGURE			=	./make/configure.mk
MKGENERATED			=	./make/generated.mk
MKCOLOR				=	./make/color.mk

AS					=	nasm
ASFLAGS				=	-f bin

NAME				=	bios

all: $(NAME)
	@echo -e $(GREEN)Bios Built Successfully$(RESET)

-include $(MKCONFIGURE) $(MKGENERATED) $(MKCOLOR)

$(NAME): $(SRCS)
	@$(AS) $(ASFLAGS) $< -o $@
	@echo -e $(BLUE)$(NAME)$(RESET) $(AS) $(ASFLAGS) $< -o $@

clean:
	@rm -rf $(BUILD_DIR)

fclean: clean
	@rm -f $(NAME)

re: fclean all

-include $(DEPS)

.PHONY : all clean fclean re clangd