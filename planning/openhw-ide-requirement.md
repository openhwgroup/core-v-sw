# OpenHW IDE

### Operating System

#### Windows 64 bit

The only operating system supported initially.

The exact list of supported Windows versions (???).

### Java VM
As Eclipse SimRel is switching to Java 11 from 2020-09, it would be wise to start from Java 11.

### License
EPL 2.0

### CM
#### Sources
Git repository is located at (???). The usage model is "GitHub Flow".
#### Changes
The change requests are tracked at (???)
#### Versioning
The semantic versioning should be respected. The initial version for all the installable units should be 0.1.0

### CI
#### Technology
The base build technology for Eclipse-related part is Apache Maven with Eclipse Tycho plug-ins.
 * Apache Maven 3.6.3
 * Eclipse Tycho 2.0.0 (1.7.0 until release)

The way to include binary components like toolchains is (???)

####Signing
The requirements to content signing are (???)

#### Output
The result of the build is p2 repository and an archive for each target platform.
No installer supported at the moment. All the required changes for user environment are described at documentation. 

### Content
*	Latest released Eclipse (2020-06 at the moment)
* 	Latest released CDT (9.11 at the moment)
*   Latest released Eclipse Embedded CDT (5.1.1 at the moment)  - aka GNU MCU  plug-ins 
*	Latest Embecosm CORE-V toolchain
*	OpenOCD for CORE-V

### Documentation
 * OpenHW IDE getting started guide documentation with Genesys 2 board in the form of (???)

### Functionality
 * Simple Eclipse project
    * ready-to-run on Genesys 2 board (e.g. LED toggle)
    * including Opella-LD OpenOCD launch (Opella-LD is 	Ashling's low-cost, FTDI based probe not to be confused with the existing Opella-XD)

### Branding
#### Naming
* The full product name is (???)
* The short product name is (???)
* The launcher name is (???)
* The abbreviation name is (???)

#### Copyright
Copyright message to be defined

#### Graphics
Use graphics from openhwgroup.org page if available
* splash.bmp
* about image
* window images
* launcher images

### Distribution
The p2 repository and archives are available for download from (???)

### Future
Overtime, Ashling and hopefully the OpenHW group/community can enhance e.g.  
* Adding Linux support
* Automating the build to “pull” all the latest components from their respective repos etc (???)
* Improved documentation and more board examples
* Various improvements (???)