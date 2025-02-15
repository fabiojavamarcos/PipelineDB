PGDMP         3                x         
   devmay2020    12.0    12.0     x           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            {           1262    25417 
   devmay2020    DATABASE     h   CREATE DATABASE devmay2020 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE devmay2020;
                postgres    false                        3079    25418 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            |           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    1            �            1259    25427    API    TABLE     �   CREATE TABLE public."API" (
    api_name character varying NOT NULL,
    class character varying NOT NULL,
    count integer
);
    DROP TABLE public."API";
       public         heap    postgres    false            �            1259    25433    API_specific    TABLE     �   CREATE TABLE public."API_specific" (
    general character varying NOT NULL,
    specific character varying NOT NULL,
    api_name_fk character varying NOT NULL
);
 "   DROP TABLE public."API_specific";
       public         heap    postgres    false            �            1259    25439    API_specific_backup    TABLE     �   CREATE TABLE public."API_specific_backup" (
    general character varying,
    specific character varying,
    api_name_fk character varying
);
 )   DROP TABLE public."API_specific_backup";
       public         heap    postgres    false            �            1259    25445    apriori    TABLE     �   CREATE TABLE public.apriori (
    pr integer NOT NULL,
    java character varying NOT NULL,
    general character varying NOT NULL
);
    DROP TABLE public.apriori;
       public         heap    postgres    false            �            1259    25451    file    TABLE     �   CREATE TABLE public.file (
    file_name character varying NOT NULL,
    full_name character varying NOT NULL,
    project character varying
);
    DROP TABLE public.file;
       public         heap    postgres    false            �            1259    25457    file_API    TABLE     �   CREATE TABLE public."file_API" (
    file_name character varying NOT NULL,
    api_name character varying NOT NULL,
    count integer
);
    DROP TABLE public."file_API";
       public         heap    postgres    false            �            1259    25463    pr    TABLE     m   CREATE TABLE public.pr (
    pr integer NOT NULL,
    title character varying,
    body character varying
);
    DROP TABLE public.pr;
       public         heap    postgres    false            �            1259    25553    pr_issue    TABLE     �  CREATE TABLE public.pr_issue (
    pr character varying NOT NULL,
    issue character varying NOT NULL,
    issue_title character varying,
    issue_body character varying,
    issue_comments character varying,
    issue_title_linked character varying,
    issue_body_linked character varying,
    issue_comments_linked character varying,
    is_train character varying,
    commit_message character varying,
    is_pr character varying,
    pr_comments character varying
);
    DROP TABLE public.pr_issue;
       public         heap    postgres    false            �            1259    25469    project    TABLE     �   CREATE TABLE public.project (
    name character varying NOT NULL,
    dir_trab character varying,
    language character varying NOT NULL
);
    DROP TABLE public.project;
       public         heap    postgres    false            �           2606    25478 
   API api_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public."API"
    ADD CONSTRAINT api_pk PRIMARY KEY (api_name);
 6   ALTER TABLE ONLY public."API" DROP CONSTRAINT api_pk;
       public            postgres    false    203            �           2606    25480    API_specific api_specific_pk 
   CONSTRAINT     x   ALTER TABLE ONLY public."API_specific"
    ADD CONSTRAINT api_specific_pk PRIMARY KEY (general, specific, api_name_fk);
 H   ALTER TABLE ONLY public."API_specific" DROP CONSTRAINT api_specific_pk;
       public            postgres    false    204    204    204            �           2606    25482    apriori apriori_pk 
   CONSTRAINT     _   ALTER TABLE ONLY public.apriori
    ADD CONSTRAINT apriori_pk PRIMARY KEY (pr, java, general);
 <   ALTER TABLE ONLY public.apriori DROP CONSTRAINT apriori_pk;
       public            postgres    false    206    206    206            �           2606    25484    file_API file_api_pk 
   CONSTRAINT     e   ALTER TABLE ONLY public."file_API"
    ADD CONSTRAINT file_api_pk PRIMARY KEY (file_name, api_name);
 @   ALTER TABLE ONLY public."file_API" DROP CONSTRAINT file_api_pk;
       public            postgres    false    208    208            �           2606    25486    file file_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY public.file
    ADD CONSTRAINT file_pk PRIMARY KEY (full_name);
 6   ALTER TABLE ONLY public.file DROP CONSTRAINT file_pk;
       public            postgres    false    207            �           2606    32775    pr_issue pr_issue_pk 
   CONSTRAINT     Y   ALTER TABLE ONLY public.pr_issue
    ADD CONSTRAINT pr_issue_pk PRIMARY KEY (issue, pr);
 >   ALTER TABLE ONLY public.pr_issue DROP CONSTRAINT pr_issue_pk;
       public            postgres    false    211    211            �           2606    25488 
   pr pr_pkey 
   CONSTRAINT     H   ALTER TABLE ONLY public.pr
    ADD CONSTRAINT pr_pkey PRIMARY KEY (pr);
 4   ALTER TABLE ONLY public.pr DROP CONSTRAINT pr_pkey;
       public            postgres    false    209            �           2606    25490    project project_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (name);
 >   ALTER TABLE ONLY public.project DROP CONSTRAINT project_pkey;
       public            postgres    false    210            �           2606    25491     API_specific api_specific_api_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."API_specific"
    ADD CONSTRAINT api_specific_api_fk FOREIGN KEY (api_name_fk) REFERENCES public."API"(api_name) NOT VALID;
 L   ALTER TABLE ONLY public."API_specific" DROP CONSTRAINT api_specific_api_fk;
       public          postgres    false    3045    204    203            �           2606    25496    file_API file_api_api_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."file_API"
    ADD CONSTRAINT file_api_api_fk FOREIGN KEY (api_name) REFERENCES public."API"(api_name) NOT VALID;
 D   ALTER TABLE ONLY public."file_API" DROP CONSTRAINT file_api_api_fk;
       public          postgres    false    203    3045    208            �           2606    25501    file_API file_api_file_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."file_API"
    ADD CONSTRAINT file_api_file_fk FOREIGN KEY (file_name) REFERENCES public.file(full_name) NOT VALID;
 E   ALTER TABLE ONLY public."file_API" DROP CONSTRAINT file_api_file_fk;
       public          postgres    false    3051    208    207            �           2606    25506    file file_project_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.file
    ADD CONSTRAINT file_project_fk FOREIGN KEY (project) REFERENCES public.project(name) NOT VALID;
 >   ALTER TABLE ONLY public.file DROP CONSTRAINT file_project_fk;
       public          postgres    false    3057    210    207           