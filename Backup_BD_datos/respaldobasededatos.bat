cd\
cd Archivos de programa
cd PostgreSQL
cd 8.1
cd bin
set PGPASSWORD=301-mami
pg_dump.exe -i -h localhost -p 5432 -U postgres -F p -a -D -v -f "C:\Tomcat\webapps\consultorio\Backup_BD_datos\personacaso.sql" -t personacaso consultorio
"301-mami"
pg_dump.exe -i -h localhost -p 5432 -U postgres -F p -a -D -v -f "C:\Tomcat\webapps\consultorio\Backup_BD_datos\estudiantes.sql" -t estudiantes consultorio
"301-mami"
pg_dump.exe -i -h localhost -p 5432 -U postgres -F p -a -D -v -f "C:\Tomcat\webapps\consultorio\Backup_BD_datos\asignacion.sql" -t asignacion consultorio
"301-mami"
pg_dump.exe -i -h localhost -p 5432 -U postgres -F p -a -D -v -f "C:\Tomcat\webapps\consultorio\Backup_BD_datos\periodo.sql" -t periodo consultorio
"301-mami"
pg_dump.exe -i -h localhost -p 5432 -U postgres -F p -a -D -v -f "C:\Tomcat\webapps\consultorio\Backup_BD_datos\estudianteperiodo.sql" -t estudianteperiodo consultorio
"301-mami"
