# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Recipes.mk                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/24 20:22:27 by jgo               #+#    #+#              #
#    Updated: 2023/05/28 16:52:25 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

$(DIRS):
	$(MAKE) -C $@

all bonus :
	$(Q)$(MAKE) $(DIRS)
	$(Q)$(call color_printf,$(YELLOW),$(NAME),🎯 Start compiling)
	$(MAKE) $(NAME)
	$(Q)$(call color_printf,$(GREEN),$(NAME),✨ compiled!)

$(NAME): $(OBJS) $(LIBS)
	$(MAKE) files="$(HEADS)" src_dir=`pwd`/includes dst_dir=$(TOPDIR)/includes link_files
	$(LINK.o) $^ $(LOADLIBES) $(LDLIBS) -o $@
	$(MAKE) files="$(NAME)" src_dir=`pwd` dst_dir=$(TOPDIR) link_files

clean:
	$(Q)$(foreach dir, $(DIRS), $(MAKE) TOPDIR=$(TOPDIR) -C $(dir) $@;)
	$(MAKE) files="$(HEADS)" src_dir=`pwd` dst_dir=$(TOPDIR)/includes unlink_files
	$(RM) $(DEPS) $(OBJS)

fclean: clean
	$(Q)$(foreach dir, $(DIRS), $(MAKE) TOPDIR=$(TOPDIR) -C $(dir) $@;)
	$(MAKE) files="$(NAME)" src_dir=`pwd` dst_dir=$(TOPDIR) unlink_files
	$(RM) $(NAME)

re: fclean
	$(Q)$(foreach dir, $(DIRS), $(MAKE) TOPDIR=$(TOPDIR) -C $(dir) $@;)
	$(MAKE)

.PHONY: all bonus clean fclean re $(DIRS)