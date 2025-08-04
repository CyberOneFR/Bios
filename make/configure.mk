# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    configure.mk                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ethebaul <ethebaul@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/06/20 05:19:01 by ethebaul          #+#    #+#              #
#    Updated: 2025/07/31 23:28:16 by ethebaul         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

-include $(MKCOLOR)

configure: fclean $(MKGENERATED)
	@echo -n "SRCS =	" > $(MKGENERATED)
	@for i in $$(find $(SRCS_DIR) -type f -name "*.asm");\
	do\
		echo "\\" >> $(MKGENERATED);\
		echo -n "	$$i" >> $(MKGENERATED);\
	done;
	
.PHONY: configure $(MKGENERATED)