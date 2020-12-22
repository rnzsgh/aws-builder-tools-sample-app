
PROFILE ?= test

ZIP := aws-builder-tools-sample-app.zip

BUCKET := pub-cfn-cust-res-pocs-us-east-1

ACCOUNT_ID := $(shell aws sts get-caller-identity --profile $(PROFILE) --query 'Account' --output text)

.PHONY: push-seed
push-seed:
	@mkdir -p build/templates
	@mkdir -p build/static/css
	@cp app.py build
	@cp templates/* build/templates
	@cp static/css/* build/static/css
	@cp Dockerfile build
	@cp requirements.txt build
	@cd build; zip -rq ../$(ZIP) .
	#@aws s3 cp --profile $(PROFILE) $(ZIP) s3://$(BUCKET)/$(ZIP)


.PHONY: clean
clean:
	@rm -f *.zip
	@rm -Rf build
