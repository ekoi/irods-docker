
# http://www.apache.org/licenses/LICENSE-2.0

FROM centos:7
LABEL maintainer="Eko Indarto <eko.indarto@dans.dataverse.nl>"
# RUN yum install -y sudo epel-release
# RUN yum install -y R-core R-core-devel git python3

RUN yum install -y curl telnet mlocate

RUN yum -y update; yum clean all
RUN yum -y install sudo epel-release; yum clean all
RUN yum -y install expect postgresql-server postgresql postgresql-contrib supervisor pwgen; yum clean all

ADD ./postgresql-setup /usr/bin/postgresql-setup
ADD ./supervisord.conf /etc/supervisord.conf
ADD ./start_postgres.sh /start_postgres.sh

#Sudo requires a tty. fix that.
RUN sed -i 's/.*requiretty$/#Defaults requiretty/' /etc/sudoers
RUN chmod +x /usr/bin/postgresql-setup
RUN chmod +x /start_postgres.sh

RUN /usr/bin/postgresql-setup initdb

ADD ./postgresql.conf /var/lib/pgsql/data/postgresql.conf

RUN chown -v postgres.postgres /var/lib/pgsql/data/postgresql.conf

#RUN echo "local    all             all             0.0.0.0/0               md5" >> /var/lib/pgsql/data/pg_hba.conf
ADD ./pg_hba.conf /var/lib/pgsql/data/pg_hba.conf

VOLUME ["/var/lib/pgsql"]

RUN rpm --import https://packages.irods.org/irods-signing-key.asc

ADD ./renci-irods.yum.repo /etc/yum.repos.d/renci-irods.yum.repo

RUN yum -y check-update

RUN yum -y install irods-server irods-database-plugin-postgres;yum clean all

#RUN /start_postgres.sh

ADD ./setup.tcl /setup.ctl

RUN chmod +x /setup.ctl

ADD ./iinit.tcl /iinit.tcl

RUN chmod +x /iinit.tcl

ADD ./startAll.sh /startAll.sh

#RUN chmod +x /startAll.sh

EXPOSE 5432
EXPOSE 1247
#CMD ["tail", "-f", "/dev/null"]
CMD ["/bin/bash", "/start_postgres.sh"]

#CMD ["/bin/bash", "/start_postgres.sh; /setup.ctl; /iinit.tcl"]


