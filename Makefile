# Makefile

VENV ?= venv
PYTHON ?= python3

.PHONY: venv run clean deactivate

## venv     ── create the virtualenv and install dependencies
venv:
	@if [ -d $(VENV) ]; then \
	  echo "Virtual environment '$(VENV)' already exists."; \
	else \
	  echo "Creating virtual environment '$(VENV)'..."; \
	  $(PYTHON) -m venv $(VENV); \
	  echo "Upgrading pip and installing requirements..."; \
	  $(VENV)/bin/pip install --upgrade pip; \
	  if [ -f requirements.txt ]; then \
	    $(VENV)/bin/pip install -r requirements.txt; \
	  fi; \
	  echo "Done. Activate with: source $(VENV)/bin/activate"; \
	fi

## run      ── run the game (auto-creates venv if needed)
run: venv
	@echo "Starting Asteroids..."
	$(VENV)/bin/$(PYTHON) main.py

## clean    ── remove the virtual environment entirely
clean:
	@if [ -d $(VENV) ]; then \
	  echo "Removing '$(VENV)'..."; \
	  rm -rf $(VENV); \
	  echo "Done."; \
	else \
	  echo "No virtual environment '$(VENV)' to remove."; \
	fi

## deactivate ── reminder on how to leave the venv
deactivate:
	@echo "If you are inside the venv, run:"
	@echo "    deactivate"
