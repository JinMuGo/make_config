# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Funcs.mk                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/16 20:53:35 by jgo               #+#    #+#              #
#    Updated: 2023/07/16 21:02:46 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

## printf function define
ifndef color_printf
define color_printf
	echo "$(1)\n[$(2)] $(3)$(DEF_COLOR)"
endef
endif

link_files:: unlink_files
	$(Q)$(call color_printf,$(GRAY),includes,📁 make includes folder)
	mkdir -p $(dst_dir);
	$(Q)$(foreach file,$(files), $(call color_printf,$(CYAN),$(file),🔗 linking file\n) ln -sf $(src_dir)/$(file) $(dst_dir);)
	$(Q)$(foreach file,$(files), ln -sf $(src_dir)/$(file) $(dst_dir);)

unlink_files::
	$(Q)$(foreach file,$(files), $(call color_printf,$(GRAY),$(file),🚫 unlinking file\n) $(RM) $(dst_dir)/$(file);)
	$(Q)$(foreach file,$(files), $(RM) $(dst_dir)/$(file);)