TERM_YELLOW := \033[0;33m
TERM_NC := \033[0m

.PHONY: all
all:
	@echo -e "(◕‿◕✿)"

.PHONY: update
update: update_system update_flatpak update_cargo update_npm

.PHONY: update_system
update_system:
	@echo -e "$(TERM_YELLOW)Updating System...$(TERM_NC)"
	paru
	@echo ""

.PHONY: update_flatpak
update_flatpak:
	@echo -e "$(TERM_YELLOW)Updating Flatpaks...$(TERM_NC)"
	flatpak update
	@echo ""
	flatpak list --app
	@echo ""

.PHONY: update_cargo
update_cargo:
	@echo -e "$(TERM_YELLOW)Updating Global Cargo Crates...$(TERM_NC)"
	cargo install $$(cargo install --list | rg -w "^.+:" | cut --fields=1 --delimiter=" ")
	@echo ""
	cargo install --list
	@echo ""

.PHONY: update_npm
update_npm:
	@echo -e "$(TERM_YELLOW)Updating Global NPM Packages...$(TERM_NC)"
	npm update -g
	@echo ""
	npm list -g
	@echo ""
