CREATE USER usr_sitio_web_29907275@serverweb
IDENTIFIED BY 'contrasenaSuperSegura';

GRANT SELECT ON bd2_202215_29907275.*
TO usr_sitio_web_29907275@serverweb;

GRANT INSERT ON bd2_202215_29907275.Candidatos
TO usr_sitio_web_29907275@serverweb;
