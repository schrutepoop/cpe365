rem
rem CSC 365. Lab 2. Test script for INN dataset
rem 
rem Alex Dekhtyar (dekhtyar@calpoly.edu)
rem

spool lab2-INN-output.txt


rem Create tables

host echo '***********************************************'
host echo ' Creating tables  '
host echo '***********************************************'

set echo on

start INN-setup.sql

set echo off

rem Populate tables

host echo '***********************************************'
host echo ' Populating tables  '
host echo '***********************************************'

set termout off

start INN-build-Rooms.sql
start INN-build-Reservations.sql

set termout on

rem test tables

host echo '***********************************************'
host echo ' Testing tables  '
host echo '***********************************************'


set echo on

start INN-test.sql

set echo off

rem drop tables

host echo '***********************************************'
host echo ' Dropping tables  '
host echo '***********************************************'


set echo on
start INN-cleanup.sql

rem test that the tables no longer exist

start INN-test.sql

set echo off

host echo '***********************************************'
host echo ' That is All, folks!  '
host echo '***********************************************'

spool off
