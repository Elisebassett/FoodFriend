FROM perl:5.28

WORKDIR /app

COPY cpanfile cpanfile.snapshot /app/
RUN cpanm --installdeps --notest .

COPY source /app/

EXPOSE 3000

RUN chgrp -R 0 . && \
    chmod -R g=u .

CMD [ "perl", "./your-daemon-or-script.pl" ]
