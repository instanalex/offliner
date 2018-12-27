# offliner
Instana offline installer 

The bundler came with 2 different flavors : RHEL distros and Debian distros
They have been tested on RHEL 7.5 and Ubuntu 16.04. 

The 2 files share 90% of similar code, so there are areas of improvement to make a single file that can execute on both types of distribution. 

The bundler will create a self extractable package. 
To generate the package, you just need an agent key (from a valid on-premise license) and run : 
./bundler_RHEL.sh -a <agent-key>
or 
./bundler_DEB.sh -a <agent-key>
This can be run on any Debian or RHEL machine with approximately 20Gb of disk space.

The agent key is simply use to download necessary packages and will not be used during the installation process. 

When the bundler has finished his job, you should have a file called instana_setup.sh which size is about 2.8Gb.

To install INSTANA offline: 
Copy the instana_setup.sh file on the targeted machine and run 
./instana_setup.sh

You'll be prompted to enter different information: 
- Agent Key
- Sales ID
- Machine name
- Tenant name
- Unit name
- Your name
- Your Email
- Your password
- Folder to store the data
- Folder to store the logs

There are no prerequisites before execution. The script will handle everything for you, including folder and certificate creation. 
It will also package pre-configured static agents for this server and make them available through web interface. 
NB: instana_setup.sh can also be run with -f <varfile>
where varfile is a text file containing all requested data as key value pairs (see sample_varfile)

INSTANA Agents: 
Agent can be retreive using url: https://<server-name>/agent-setup/<distro>/instana_static_agent_<distro>.sh
where distro can be any of: rhel6, rhel7, centos, debian

URL https://<server-name>/agent-setup can also be used from a browser. 

To install an agent, simply run: 
./instana_static_agent_<distro>.sh -z <zone>

Agent is preconfigured to report to the server where it has been downloaded from. 
