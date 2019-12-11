#!/bin/bash
while test $# -gt 0; do
        case "$1" in
                --help)
                        echo "options:"
                        echo "--help            		      show brief help"
                        echo "-h, --host (default='$HOST')    database host"
                        echo "-P, --port (default='$PORT')	      database port"
                        echo "-u, --user (default='$USERNAME') 	      database username"
                        echo "-p, --pass (default='$PASSWORD')        database password"
                        echo "-d, --database (default='$DATABASE')      database name"
                        echo "-f, --filter                          filter ex: show_connections -f \"'foo', 'bar'\""
                        exit 0
                        ;;
                -f|--filter)
                        shift
                        if test $# -gt 0; then
                                export WHERE="where usename in ($1)"
                        else
                                echo "filter not found"
                                exit 1
                        fi
                        shift
                        ;;
                -h|--host)
                        shift
                        if test $# -gt 0; then
                                export HOST=$1
                        else
                                echo "host not found"
                                exit 1
                        fi
                        shift
                        ;;
                -P|--port)
                        shift
                        if test $# -gt 0; then
                                export PORT=$1
                        else
                                echo "port not found"
                                exit 1
                        fi
                        shift
                        ;;
                -u|--user)
                        shift
                        if test $# -gt 0; then
                                export USERNAME=$1
                        else
                                echo "user not found"
                                exit 1
                        fi
                        shift
                        ;;
                -p|--pass)
                        shift
                        if test $# -gt 0; then
                                export PASSWORD=$1
                        else
                                echo "password not found"
                                exit 1
                        fi
                        shift
                        ;;
                -d|--database)
                        shift
                        if test $# -gt 0; then
                                export DATABASE=$1
                        else
                                echo "database not found"
                                exit 1
                        fi
                        shift
                        ;;
                *)
                        break
                        ;;
        esac
done

watch -c -t -n 1 "PGPASSWORD=$PASSWORD psql -h $HOST -U $USERNAME -d $DATABASE -c \"select usename, count(*) connections from pg_stat_activity $WHERE group by usename order by count(*) desc\""

