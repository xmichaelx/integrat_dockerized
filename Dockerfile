FROM gcc:9.5.0
WORKDIR /app
RUN wget -q -O linux_p1550p2650.440 https://ssd.jpl.nasa.gov/ftp/eph/planets/Linux/de440/linux_p1550p2650.440
RUN git clone https://github.com/Bill-Gray/jpl_eph
RUN git clone https://github.com/Bill-Gray/lunar
WORKDIR /app/lunar
RUN git reset --hard 0d936a3
RUN make && make install
WORKDIR /app/jpl_eph
RUN make && make install
WORKDIR /app/lunar
RUN make integrat
WORKDIR /app
RUN cp /app/lunar/integrat /app
RUN echo '#!/usr/bin/env bash' >> /app/integrat_wrapper 
RUN echo '/app/integrat $1 $2 $3 -f /app/linux_p1550p2650.440' >> /app/integrat_wrapper 
RUN chmod +x /app/integrat_wrapper
ENTRYPOINT ["/app/integrat_wrapper"]
