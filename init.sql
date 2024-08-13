--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2


CREATE DATABASE infrastructure;

\connect infrastructure

CREATE SCHEMA IF NOT EXISTS public;

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

-- Creation de la table "servers"
CREATE TABLE public.servers (
    Hostname character varying(25),
    IP character varying(15),
    Region character varying(20),
    Uptodate date,
    Os character varying(50)
);

-- Creation de la table "Containers"
CREATE TABLE public.containers (
    Name character varying(30),
    IP character varying(15),
    UP boolean,
    Engine character varying(50),
    Image character varying(255)
);

-- Creation de la table "Databases"
CREATE TABLE public.databases (
    Name character varying(30),
    Engine character varying(50),
    Size integer,
    Uptodate date
);


INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_501', '192.168.10.167', 'eu-west-2', '2023-05-24', 'CentOS8');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK719', '192.168.20.121', 'Yes', 'Docker', 'redis:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB849', 'PostgreSQL', 100, '2023-05-24');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_685', '192.168.10.150', 'eu-west-3', '2023-05-23', 'RHEL7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK462', '192.168.20.29', 'Yes', 'Docker', 'jenkins:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB954', 'PostgreSQL', 100, '2023-05-22');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_82', '192.168.10.183', 'eu-west-2', '2023-05-23', 'Windows_server_2012');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK87', '192.168.20.190', 'Yes', 'Docker', 'mysql:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB475', 'MySQL', 500, '2023-05-24');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_691', '192.168.10.76', 'eu-west-2', '2023-05-29', 'RHEL7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK434', '192.168.20.140', 'Yes', 'Docker', 'python:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB607', 'PostgreSQL', 500, '2023-05-21');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_636', '192.168.10.173', 'eu-south-1', '2023-05-26', 'SUSE12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK141', '192.168.20.89', 'No', 'Docker', 'traefik:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB688', 'MySQL', 100, '2023-05-30');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_380', '192.168.10.171', 'eu-central-1', '2023-05-20', 'Windows_server_2012');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK202', '192.168.20.58', 'Yes', 'Docker', 'mysql:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB820', 'MySQL', 500, '2023-05-29');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_137', '192.168.10.63', 'eu-west-2', '2023-05-29', 'Fedora33');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK952', '192.168.20.69', 'Yes', 'Docker', 'wordpress:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB386', 'MySQL', 100, '2023-05-26');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_202', '192.168.10.137', 'eu-west-1', '2023-05-24', 'OpenSUSE15');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK209', '192.168.20.6', 'Yes', 'Docker', 'jenkins:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB394', 'MySQL', 100, '2023-05-25');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_967', '192.168.10.140', 'eu-west-1', '2023-05-22', 'CentOS7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK806', '192.168.20.102', 'Yes', 'Docker', 'nginx:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB213', 'MySQL', 100, '2023-05-26');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_262', '192.168.10.149', 'eu-west-3', '2023-05-21', 'Fedora33');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK359', '192.168.20.81', 'No', 'Docker', 'php:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB770', 'PostgreSQL', 100, '2023-05-26');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_93', '192.168.10.105', 'eu-west-2', '2023-05-29', 'Debian10');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK900', '192.168.20.39', 'Yes', 'Docker', 'elasticsearch:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB561', 'PostgreSQL', 100, '2023-05-26');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_77', '192.168.10.104', 'eu-west-2', '2023-05-26', 'SUSE12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK712', '192.168.20.57', 'Yes', 'Docker', 'mongodb:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB699', 'MySQL', 100, '2023-05-28');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_977', '192.168.10.156', 'eu-west-1', '2023-05-26', 'Windows_server_2012');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK984', '192.168.20.64', 'No', 'Docker', 'nginx:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB126', 'PostgreSQL', 400, '2023-05-23');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_287', '192.168.10.175', 'eu-west-2', '2023-05-29', 'RHEL7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK481', '192.168.20.21', 'Yes', 'Docker', 'traefik:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB228', 'PostgreSQL', 500, '2023-05-26');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_833', '192.168.10.133', 'eu-west-3', '2023-05-26', 'CentOS7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK795', '192.168.20.133', 'No', 'Docker', 'traefik:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB621', 'PostgreSQL', 200, '2023-05-30');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_857', '192.168.10.184', 'eu-central-1', '2023-05-26', 'CentOS7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK411', '192.168.20.136', 'Yes', 'Docker', 'python:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB585', 'PostgreSQL', 300, '2023-05-21');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_267', '192.168.10.19', 'eu-west-2', '2023-05-21', 'FreeBSD12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK957', '192.168.20.168', 'Yes', 'Docker', 'rabbitmq:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB413', 'MySQL', 200, '2023-05-21');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_443', '192.168.10.39', 'eu-west-2', '2023-05-21', 'SUSE11');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK119', '192.168.20.36', 'No', 'Docker', 'rabbitmq:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB330', 'MySQL', 500, '2023-05-20');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_362', '192.168.10.2', 'eu-west-3', '2023-05-20', 'Windows_server_2012');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK683', '192.168.20.146', 'No', 'Docker', 'jenkins:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB132', 'MySQL', 200, '2023-05-20');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_965', '192.168.10.139', 'eu-south-1', '2023-05-31', 'FreeBSD12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK784', '192.168.20.48', 'No', 'Docker', 'mongodb:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB246', 'PostgreSQL', 400, '2023-05-20');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_330', '192.168.10.90', 'eu-west-3', '2023-05-27', 'RHEL7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK822', '192.168.20.131', 'No', 'Docker', 'gitlab:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB530', 'PostgreSQL', 300, '2023-05-30');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_904', '192.168.10.93', 'eu-central-1', '2023-05-24', 'OpenSUSE15');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK742', '192.168.20.69', 'Yes', 'Docker', 'nginx:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB820', 'MySQL', 500, '2023-05-20');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_471', '192.168.10.127', 'eu-west-1', '2023-05-20', 'FreeBSD12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK562', '192.168.20.162', 'Yes', 'Docker', 'wordpress:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB454', 'MySQL', 300, '2023-05-23');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_233', '192.168.10.152', 'eu-west-3', '2023-05-24', 'FreeBSD13');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK631', '192.168.20.38', 'No', 'Docker', 'wordpress:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB440', 'PostgreSQL', 400, '2023-05-30');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_343', '192.168.10.21', 'eu-west-1', '2023-05-28', 'SUSE12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK811', '192.168.20.99', 'No', 'Docker', 'jenkins:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB779', 'PostgreSQL', 200, '2023-05-29');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_749', '192.168.10.178', 'eu-west-2', '2023-05-30', 'RHEL8');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK619', '192.168.20.153', 'Yes', 'Docker', 'node:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB24', 'MySQL', 200, '2023-05-26');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_671', '192.168.10.28', 'eu-central-1', '2023-05-23', 'CentOS7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK31', '192.168.20.118', 'No', 'Docker', 'postgres:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB808', 'PostgreSQL', 200, '2023-05-22');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_88', '192.168.10.193', 'eu-west-3', '2023-05-30', 'SUSE11');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK77', '192.168.20.137', 'Yes', 'Docker', 'elasticsearch:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB776', 'PostgreSQL', 400, '2023-05-27');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_722', '192.168.10.55', 'eu-west-3', '2023-05-26', 'UbuntuServer_20.04');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK846', '192.168.20.54', 'No', 'Docker', 'elasticsearch:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB830', 'MySQL', 500, '2023-05-22');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_965', '192.168.10.148', 'eu-central-1', '2023-05-22', 'CentOS7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK845', '192.168.20.104', 'No', 'Docker', 'jenkins:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB489', 'PostgreSQL', 300, '2023-05-30');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_260', '192.168.10.144', 'eu-west-1', '2023-05-25', 'RHEL8');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK411', '192.168.20.79', 'No', 'Docker', 'traefik:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB698', 'MySQL', 400, '2023-05-29');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_813', '192.168.10.195', 'eu-west-3', '2023-05-29', 'OpenSUSE15');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK451', '192.168.20.149', 'Yes', 'Docker', 'mysql:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB786', 'MySQL', 500, '2023-05-21');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_370', '192.168.10.163', 'eu-west-1', '2023-05-27', 'SUSE11');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK876', '192.168.20.146', 'No', 'Docker', 'traefik:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB649', 'MySQL', 200, '2023-05-21');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_313', '192.168.10.168', 'eu-west-2', '2023-05-21', 'UbuntuServer_20.04');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK826', '192.168.20.20', 'Yes', 'Docker', 'elasticsearch:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB902', 'PostgreSQL', 100, '2023-05-22');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_887', '192.168.10.152', 'eu-south-1', '2023-05-22', 'Windows_server_2012');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK455', '192.168.20.164', 'Yes', 'Docker', 'php:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB670', 'PostgreSQL', 200, '2023-05-28');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_878', '192.168.10.152', 'eu-west-2', '2023-05-23', 'FreeBSD12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK348', '192.168.20.158', 'Yes', 'Docker', 'php:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB381', 'MySQL', 300, '2023-05-25');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_521', '192.168.10.24', 'eu-west-3', '2023-05-31', 'CentOS8');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK732', '192.168.20.31', 'Yes', 'Docker', 'node:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB886', 'PostgreSQL', 400, '2023-05-27');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_394', '192.168.10.142', 'eu-west-3', '2023-05-27', 'CentOS8');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK143', '192.168.20.152', 'Yes', 'Docker', 'redis:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB947', 'PostgreSQL', 400, '2023-05-25');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_678', '192.168.10.119', 'eu-west-3', '2023-05-20', 'Debian10');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK99', '192.168.20.11', 'No', 'Docker', 'wordpress:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB108', 'PostgreSQL', 500, '2023-05-21');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_481', '192.168.10.14', 'eu-west-3', '2023-05-26', 'FreeBSD12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK624', '192.168.20.6', 'Yes', 'Docker', 'alpine:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB49', 'MySQL', 400, '2023-05-20');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_40', '192.168.10.131', 'eu-west-2', '2023-05-27', 'UbuntuServer_20.04');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK254', '192.168.20.54', 'Yes', 'Docker', 'rabbitmq:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB06', 'PostgreSQL', 500, '2023-05-30');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_731', '192.168.10.104', 'eu-south-1', '2023-05-26', 'Debian10');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK778', '192.168.20.4', 'No', 'Docker', 'postgres:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB180', 'MySQL', 100, '2023-05-31');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_657', '192.168.10.10', 'eu-west-2', '2023-05-21', 'FreeBSD12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK05', '192.168.20.142', 'Yes', 'Docker', 'traefik:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB501', 'MySQL', 200, '2023-05-28');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_438', '192.168.10.25', 'eu-central-1', '2023-05-26', 'FreeBSD12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK858', '192.168.20.86', 'No', 'Docker', 'gitlab:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB260', 'PostgreSQL', 400, '2023-05-22');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_819', '192.168.10.61', 'eu-west-2', '2023-05-20', 'OpenSUSE15');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK348', '192.168.20.10', 'Yes', 'Docker', 'php:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB78', 'PostgreSQL', 100, '2023-05-26');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_673', '192.168.10.125', 'eu-west-3', '2023-05-25', 'FreeBSD13');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK239', '192.168.20.132', 'Yes', 'Docker', 'node:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB547', 'MySQL', 400, '2023-05-31');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_735', '192.168.10.131', 'eu-west-2', '2023-05-20', 'CentOS7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK348', '192.168.20.177', 'Yes', 'Docker', 'python:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB724', 'PostgreSQL', 400, '2023-05-30');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_267', '192.168.10.120', 'eu-west-2', '2023-05-21', 'FreeBSD12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK476', '192.168.20.165', 'No', 'Docker', 'gitlab:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB511', 'MySQL', 300, '2023-05-20');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_641', '192.168.10.198', 'eu-west-2', '2023-05-24', 'SUSE11');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK601', '192.168.20.45', 'Yes', 'Docker', 'elasticsearch:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB134', 'MySQL', 100, '2023-05-20');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_34', '192.168.10.187', 'eu-west-3', '2023-05-21', 'RHEL7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK789', '192.168.20.101', 'Yes', 'Docker', 'postgres:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB162', 'MySQL', 300, '2023-05-28');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_973', '192.168.10.40', 'eu-south-1', '2023-05-27', 'FreeBSD12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK387', '192.168.20.65', 'No', 'Docker', 'nginx:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB290', 'PostgreSQL', 200, '2023-05-23');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_639', '192.168.10.50', 'eu-west-2', '2023-05-24', 'UbuntuServer_20.04');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK175', '192.168.20.98', 'Yes', 'Docker', 'mysql:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB22', 'PostgreSQL', 500, '2023-05-30');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_870', '192.168.10.24', 'eu-west-1', '2023-05-26', 'UbuntuServer_20.04');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK370', '192.168.20.55', 'No', 'Docker', 'wordpress:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB326', 'PostgreSQL', 200, '2023-05-31');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_761', '192.168.10.195', 'eu-west-2', '2023-05-22', 'CentOS8');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK254', '192.168.20.59', 'Yes', 'Docker', 'mysql:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB200', 'PostgreSQL', 200, '2023-05-27');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_374', '192.168.10.91', 'eu-west-3', '2023-05-23', 'RHEL8');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK48', '192.168.20.69', 'No', 'Docker', 'gitlab:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB615', 'PostgreSQL', 200, '2023-05-25');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_794', '192.168.10.122', 'eu-west-1', '2023-05-26', 'RHEL7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK843', '192.168.20.20', 'No', 'Docker', 'php:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB365', 'PostgreSQL', 400, '2023-05-25');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_939', '192.168.10.53', 'eu-west-1', '2023-05-26', 'FreeBSD12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK57', '192.168.20.59', 'Yes', 'Docker', 'elasticsearch:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB145', 'PostgreSQL', 200, '2023-05-31');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_722', '192.168.10.40', 'eu-west-1', '2023-05-30', 'Debian10');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK173', '192.168.20.15', 'No', 'Docker', 'redis:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB459', 'MySQL', 200, '2023-05-26');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_701', '192.168.10.35', 'eu-west-2', '2023-05-21', 'FreeBSD13');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK884', '192.168.20.196', 'Yes', 'Docker', 'nginx:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB862', 'MySQL', 200, '2023-05-29');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_858', '192.168.10.48', 'eu-west-3', '2023-05-20', 'Fedora33');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK142', '192.168.20.104', 'No', 'Docker', 'wordpress:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB265', 'MySQL', 100, '2023-05-29');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_642', '192.168.10.178', 'eu-west-2', '2023-05-30', 'CentOS7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK769', '192.168.20.31', 'Yes', 'Docker', 'redis:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB415', 'PostgreSQL', 400, '2023-05-30');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_659', '192.168.10.142', 'eu-central-1', '2023-05-28', 'SUSE12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK617', '192.168.20.65', 'No', 'Docker', 'alpine:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB467', 'MySQL', 400, '2023-05-25');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_932', '192.168.10.192', 'eu-west-1', '2023-05-20', 'SUSE11');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK452', '192.168.20.18', 'Yes', 'Docker', 'redis:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB261', 'PostgreSQL', 200, '2023-05-24');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_886', '192.168.10.16', 'eu-west-2', '2023-05-22', 'RHEL7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK994', '192.168.20.137', 'Yes', 'Docker', 'traefik:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB513', 'MySQL', 500, '2023-05-24');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_761', '192.168.10.91', 'eu-central-1', '2023-05-28', 'FreeBSD12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK820', '192.168.20.115', 'Yes', 'Docker', 'gitlab:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB899', 'PostgreSQL', 300, '2023-05-21');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_725', '192.168.10.199', 'eu-central-1', '2023-05-27', 'CentOS7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK892', '192.168.20.150', 'Yes', 'Docker', 'redis:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB980', 'MySQL', 300, '2023-05-26');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_519', '192.168.10.19', 'eu-west-1', '2023-05-20', 'Debian10');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK364', '192.168.20.73', 'No', 'Docker', 'php:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB706', 'MySQL', 500, '2023-05-27');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_596', '192.168.10.168', 'eu-south-1', '2023-05-30', 'Fedora34');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK746', '192.168.20.70', 'Yes', 'Docker', 'python:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB363', 'PostgreSQL', 500, '2023-05-22');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_568', '192.168.10.168', 'eu-west-1', '2023-05-26', 'Windows_server_2012');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK258', '192.168.20.26', 'No', 'Docker', 'python:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB202', 'MySQL', 300, '2023-05-21');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_501', '192.168.10.115', 'eu-south-1', '2023-05-25', 'Fedora34');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK796', '192.168.20.51', 'No', 'Docker', 'postgres:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB97', 'PostgreSQL', 100, '2023-05-21');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_170', '192.168.10.155', 'eu-central-1', '2023-05-27', 'RHEL8');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK507', '192.168.20.22', 'Yes', 'Docker', 'mongodb:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB782', 'PostgreSQL', 200, '2023-05-22');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_224', '192.168.10.161', 'eu-west-3', '2023-05-26', 'FreeBSD13');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK192', '192.168.20.97', 'No', 'Docker', 'wordpress:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB408', 'PostgreSQL', 400, '2023-05-30');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_80', '192.168.10.163', 'eu-west-3', '2023-05-22', 'RHEL8');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK66', '192.168.20.132', 'No', 'Docker', 'jenkins:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB655', 'MySQL', 100, '2023-05-26');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_784', '192.168.10.176', 'eu-south-1', '2023-05-30', 'CentOS7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK33', '192.168.20.73', 'Yes', 'Docker', 'elasticsearch:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB30', 'PostgreSQL', 200, '2023-05-31');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_125', '192.168.10.35', 'eu-west-1', '2023-05-29', 'RHEL8');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK551', '192.168.20.193', 'Yes', 'Docker', 'python:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB121', 'PostgreSQL', 100, '2023-05-27');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_453', '192.168.10.24', 'eu-west-1', '2023-05-29', 'Windows_server_2012');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK744', '192.168.20.137', 'Yes', 'Docker', 'gitlab:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB701', 'MySQL', 100, '2023-05-26');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_274', '192.168.10.163', 'eu-west-3', '2023-05-22', 'OpenSUSE15');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK828', '192.168.20.122', 'No', 'Docker', 'python:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB183', 'PostgreSQL', 200, '2023-05-25');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_616', '192.168.10.143', 'eu-south-1', '2023-05-27', 'Debian10');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK557', '192.168.20.164', 'No', 'Docker', 'postgres:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB602', 'PostgreSQL', 300, '2023-05-25');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_671', '192.168.10.152', 'eu-west-3', '2023-05-29', 'Fedora33');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK966', '192.168.20.98', 'Yes', 'Docker', 'mysql:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB792', 'MySQL', 200, '2023-05-23');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_429', '192.168.10.21', 'eu-west-3', '2023-05-22', 'RHEL7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK573', '192.168.20.155', 'Yes', 'Docker', 'redis:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB808', 'MySQL', 400, '2023-05-25');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_720', '192.168.10.130', 'eu-west-1', '2023-05-27', 'SUSE11');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK86', '192.168.20.70', 'Yes', 'Docker', 'jenkins:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB668', 'PostgreSQL', 400, '2023-05-29');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_727', '192.168.10.198', 'eu-west-1', '2023-05-29', 'CentOS7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK98', '192.168.20.170', 'No', 'Docker', 'alpine:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB413', 'PostgreSQL', 400, '2023-05-26');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_567', '192.168.10.90', 'eu-west-3', '2023-05-28', 'RHEL7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK670', '192.168.20.114', 'No', 'Docker', 'gitlab:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB980', 'MySQL', 100, '2023-05-20');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_294', '192.168.10.187', 'eu-west-3', '2023-05-29', 'Fedora34');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK749', '192.168.20.188', 'Yes', 'Docker', 'python:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB76', 'MySQL', 400, '2023-05-31');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_163', '192.168.10.175', 'eu-south-1', '2023-05-26', 'FreeBSD13');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK339', '192.168.20.190', 'No', 'Docker', 'wordpress:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB283', 'PostgreSQL', 200, '2023-05-20');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_895', '192.168.10.75', 'eu-west-3', '2023-05-23', 'RHEL8');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK394', '192.168.20.166', 'Yes', 'Docker', 'mongodb:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB806', 'MySQL', 400, '2023-05-22');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_894', '192.168.10.55', 'eu-west-2', '2023-05-26', 'RHEL7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK359', '192.168.20.123', 'Yes', 'Docker', 'rabbitmq:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB119', 'PostgreSQL', 500, '2023-05-23');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_482', '192.168.10.83', 'eu-south-1', '2023-05-25', 'OpenSUSE15');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK285', '192.168.20.105', 'No', 'Docker', 'php:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB562', 'MySQL', 400, '2023-05-24');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_373', '192.168.10.19', 'eu-west-3', '2023-05-23', 'Fedora33');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK974', '192.168.20.102', 'Yes', 'Docker', 'php:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB296', 'MySQL', 300, '2023-05-31');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_994', '192.168.10.56', 'eu-central-1', '2023-05-30', 'Fedora34');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK158', '192.168.20.32', 'Yes', 'Docker', 'node:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB481', 'PostgreSQL', 200, '2023-05-21');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_196', '192.168.10.42', 'eu-west-3', '2023-05-31', 'CentOS8');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK522', '192.168.20.77', 'Yes', 'Docker', 'mongodb:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB853', 'MySQL', 500, '2023-05-25');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_959', '192.168.10.65', 'eu-west-2', '2023-05-29', 'FreeBSD13');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK86', '192.168.20.191', 'Yes', 'Docker', 'node:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB740', 'PostgreSQL', 100, '2023-05-25');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_445', '192.168.10.174', 'eu-south-1', '2023-05-30', 'FreeBSD12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK428', '192.168.20.59', 'Yes', 'Docker', 'redis:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB342', 'PostgreSQL', 300, '2023-05-25');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_610', '192.168.10.88', 'eu-west-2', '2023-05-31', 'UbuntuServer_20.04');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK831', '192.168.20.195', 'Yes', 'Docker', 'nginx:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB363', 'PostgreSQL', 400, '2023-05-24');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_851', '192.168.10.134', 'eu-west-2', '2023-05-29', 'FreeBSD13');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK310', '192.168.20.91', 'No', 'Docker', 'jenkins:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB991', 'MySQL', 500, '2023-05-28');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_461', '192.168.10.132', 'eu-west-3', '2023-05-28', 'Fedora33');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK786', '192.168.20.52', 'Yes', 'Docker', 'redis:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB47', 'PostgreSQL', 100, '2023-05-20');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_4', '192.168.10.86', 'eu-central-1', '2023-05-27', 'SUSE12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK530', '192.168.20.8', 'Yes', 'Docker', 'traefik:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB627', 'PostgreSQL', 400, '2023-05-23');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_161', '192.168.10.25', 'eu-west-2', '2023-05-25', 'SUSE12');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK232', '192.168.20.102', 'No', 'Docker', 'alpine:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB891', 'PostgreSQL', 400, '2023-05-20');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_835', '192.168.10.83', 'eu-south-1', '2023-05-31', 'RHEL7');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK318', '192.168.20.198', 'No', 'Docker', 'python:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB239', 'MySQL', 100, '2023-05-31');
INSERT INTO public.servers (Hostname, IP, Region, Uptodate, Os) VALUES ('vm_aws_870', '192.168.10.22', 'eu-central-1', '2023-05-24', 'Fedora34');
INSERT INTO public.containers (Name, IP, UP, Engine, Image) VALUES ('DCK36', '192.168.20.14', 'Yes', 'Docker', 'jenkins:latest');
INSERT INTO public.databases (Name, Engine, Size, Uptodate) VALUES ('DB139', 'PostgreSQL', 100, '2023-05-24');
