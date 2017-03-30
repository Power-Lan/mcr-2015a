
INSTALL_PATH = /usr/local/MATLAB/MATLAB_Compiler_Runtime
SILENT_CONFIG := $(shell mktemp)

noop:

deb:
	dpkg-buildpackage -us -uc -b

MCR_R2015a_glnxa64_installer.zip:
	wget https://fr.mathworks.com/supportfiles/downloads/R2015a/deployment_files/R2015a/installers/glnxa64/MCR_R2015a_glnxa64_installer.zip

all: MCR_R2015a_glnxa64_installer.zip
	mkdir -p mcr
	unzip MCR_R2015a_glnxa64_installer.zip -d mcr
	echo "destinationFolder=$(DEB)/$(INSTALL_PATH)" > $(SILENT_CONFIG)
	echo "agreeToLicense=yes" >> $(SILENT_CONFIG)
	echo "mode=silent" >> $(SILENT_CONFIG)
	./mcr/install -inputFile $(SILENT_CONFIG)

clean:
	rm -Rf mcr

mrproper: clean
	rm -f MCR_R2015a_glnxa64_installer.zip

