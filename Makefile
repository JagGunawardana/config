# Makefile from the good ole' UNIX days
# make install - install all the python packages and .deb packages to run,
# 	develop this service.
# make test - run all unit tests, specify test runner by ???
# Known issues:
# 	Some python packages that have the package name with "_" in, but
# 	the name registered with setuptools (and hence from pip freeze)
# 	has "-" in the name. This will cause these to be always installed.
# 	This should mainly be the Saffron packages and model-mommy

# PIP
PIP=pip
PIPTEMPDIR=/tmp/pypi
PFLAGS=--no-deps

# Change the next line to include all the pip requirements files.
ALL_REQUIREMENTS=requirements.txt requirements-dev.txt requirements-sd.txt
# Change the next line to include any packages (.deb) that we require
ALL_PACKAGES=libxml2-dev libxslt1-dev swig

.PHONY: clean clean_pyc cleandb pyrequirements install integration local \
	local_integration int_integration testing_integration staging_integration \
	unit acceptanct integration_fixtures pep8 pylint

all: install

install: prelims all_packages pyrequirements

prelims:
	# Next line is messy, but makes life easier and faster
	rm .missing_requirements.txt

all_packages:
	@for pkg in $(ALL_PACKAGES);\
		do dpkg-query -l  $$pkg >> /dev/null;\
		if [ $$? -eq 1 ]; then\
			echo "Installing $$pkg - you may need to enter root password";\
			sudo apt-get install $$pkg;\
		fi \
	done

pyrequirements: .missing_requirements.txt
	mkdir -p $(PIPTEMPDIR)
	@echo "\n\nSome python packages are missing, installing: "
	@echo "=============================================="
	@cat .missing_requirements.txt	
	@echo "==============================================\n\n"
	$(PIP) install --download $(PIPTEMPDIR) $(PFLAGS) -r .missing_requirements.txt -i http://cheeseshop:cu77h3ch3353@int-cheeseshop-1.sd-ngp.net/simple
	$(PIP) install --no-index --find-links=file:$(PIPTEMPDIR) $(PFLAGS) -r .missing_requirements.txt

.missing_requirements.txt: $(ALL_REQUIREMENTS)
	cat $(ALL_REQUIREMENTS) | sort | uniq > .all_requirements.txt
	$(PIP) freeze | sort | uniq > .all_installed.txt
	-diff .all_installed.txt .all_requirements.txt --changed-group-format='%>' --unchanged-group-format='' > .missing_requirements.txt
	test -f .missing_requirements.txt && sed -i -e /^$$/d .missing_requirements.txt # get rid of blanks
	-@rm .all_requirements.txt .all_installed.txt

# Bit of housekeeping

clean: # uninstall the python packages (but not the .debs - in case still required)
	cat $(ALL_REQUIREMENTS) | sort | uniq > .all_requirements_remove
	$(PIP) uninstall -r .all_requirements_remove
	-rm .all_requirements_remove .missing_requirements.txt .all_requirements.txt .all_installed.txt

clean_pyc:
	find . -name '*.pyc' -exec rm -f {} \;

cleandb:
	./src/manage.py syncdb --noinput
	./src/manage.py migrate --noinput

# All testing

integration:
	make integration_fixtures
	nosetests --nocapture src/apps/api/integration_tests

LOCAL_INTEGRATION_TESTS = src/apps/api/integration_tests/test_guest_user_browsing.py src/apps/api/integration_tests/test_known_user_browsing.py src/apps/api/integration_tests/test_data.py src/apps/api/integration_tests/test_vouchers.py
INT_INTEGRATION_TESTS = src/apps/api/integration_tests/test_data.py src/apps/api/integration_tests/test_vouchers.py src/apps/api/integration_tests/test_purchase.py src/apps/api/integration_tests/test_fake_token_exchange.py
TEST_INTEGRATION_TESTS = src/apps/api/integration_tests/test_data.py src/apps/api/integration_tests/test_vouchers.py src/apps/api/integration_tests/test_purchase.py
STAGING_INTEGRATION_TESTS = src/apps/api/integration_tests/test_data.py src/apps/api/integration_tests/test_purchase.py

local:
	./src/manage.py runserver storefront.dev:8011

local_integration:
	./src/manage.py loaddata lockinstore_config env_integration lockinstore_data
	export STORE_URI="http://storefront.dev:8011/api/v1"; nosetests --nocapture $(LOCAL_INTEGRATION_TESTS)

int_integration:
	export STORE_URI="https://int-store.sd-ngp.net/api/v1"; nosetests --nocapture $(INT_INTEGRATION_TESTS)

testing_integration:
	export STORE_URI="https://testing-store.sd-ngp.net/api/v1"; nosetests --nocapture $(TEST_INTEGRATION_TESTS)

staging_integration:
	export STORE_URI="https://staging-store.sd-ngp.net/api/v1"; nosetests --nocapture $(STAGING_INTEGRATION_TESTS)

unit:
	src/manage.py test api; src/manage.py test catalogue; src/manage.py test uv

acceptance:
	nosetests src/apps/api/acceptance_tests

integration_fixtures:
	src/manage.py loaddata env_integration lockinstore_config lockinstore_data

pep8:
	-git status | grep 'modified:.*py\|new file:.*py' | cut -f 2 -d: | xargs -n 1 -t pep8 --max-line-length 120

pylint:
	-PYTHONPATH=$$(pwd)/src:$${PYTHONPATH} &&\
	git status | grep 'modified:.*py' | cut -f 2 -d: | xargs -n 1 -t pylint --rcfile pylint.rc -f colorized -r n
