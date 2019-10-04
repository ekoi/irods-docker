# irods-docker
A simple Irods installation as docker container. 

        git clone https://github.com/ekoi/irods-docker.git
        cd irods-docker/docker
        docker build -t ekoindarto/irods .  
        docker run -d -it --name irods  ekoindarto/irods

Execute the initialization scripts, **only once**!
        
        docker exec -it irods /bin/bash -c "/setup.ctl"
        docker exec -it irods /bin/bash -c "/iinit.tcl" 
        
 Confirmation the installation:
 
        docker exec -it irods /bin/bash -c "ils"
        
 Result:
 
        /tempZone/home/rods:
        
 Enjoy:
 
        docker exec -it irods /bin/bash
        
        
        