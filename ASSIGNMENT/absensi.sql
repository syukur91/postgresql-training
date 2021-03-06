--- Absensi Mata Pelajaran Siswa

--- Create Table
--- Mata Pelajaran ---
CREATE TABLE public.mata_pelajaran (
    id int GENERATED BY DEFAULT AS IDENTITY,
    nama text NOT NULL,
    kode text NOT NULL,
    tingkat text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);

--- Jam Belajaran
CREATE TABLE public.jam_pelajaran (
    id int GENERATED BY DEFAULT AS IDENTITY,
    id_matpel int,
    jam_mulai timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    jam_akhir timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);

--- Wali Kelas ---
CREATE TABLE public.wali_kelas (
    id int GENERATED BY DEFAULT AS IDENTITY,
    nama text NOT NULL,
    alamat text NOT NULL,
    telepon text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);

--- Jam Pelajaran Siswa ---
CREATE TABLE jam_pelajaran_siswa (
    id int GENERATED BY DEFAULT AS IDENTITY,
    id_jam_pelajaran int,
    id_siswa int,
    status text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);

--- Siswa ---
CREATE TABLE public.siswa (
    id int GENERATED BY DEFAULT AS IDENTITY,
    nama text NOT NULL,
    id_kelas int,
    id_wali_kelas int,
    tingkat int,
    alamat text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);

--- Kelas ---
CREATE TABLE public.kelas (
    id int GENERATED BY DEFAULT AS IDENTITY,
    nama text NOT NULL,
    tingkat int,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);

--- ALTER Table Primary Key ---
--- Mata Pelajaran ---
ALTER TABLE ONLY public.mata_pelajaran 
    ADD CONSTRAINT mata_pelajaran_pkey PRIMARY KEY (id);

--- Jam Pelajaran ---
ALTER TABLE ONLY public.jam_pelajaran 
    ADD CONSTRAINT jam_pelajaran_pkey PRIMARY KEY (id);

--- Siswa ---
ALTER TABLE ONLY public.siswa 
    ADD CONSTRAINT siswa_pkey PRIMARY KEY (id);

--- Kelas ---
ALTER TABLE ONLY public.kelas 
    ADD CONSTRAINT kelas_pkey PRIMARY KEY (id);

--- Jam Pelajaran Siswa ---
ALTER TABLE ONLY public.jam_pelajaran_siswa 
    ADD CONSTRAINT jam_pelajaran_siswa_pkey PRIMARY KEY (id);
    
--- Wali Kelas ---
ALTER TABLE ONLY public.wali_kelas
    ADD CONSTRAINT wali_kelas_pkey PRIMARY KEY (id);

--- ALTER Table Foreign Key ---
ALTER TABLE ONLY public.jam_pelajaran
    ADD CONSTRAINT matapelajaran_jampelajaran_idmatpel_foreign FOREIGN KEY (id_matpel) REFERENCES public.mata_pelajaran (id);

ALTER TABLE ONLY public.jam_pelajaran_siswa
    ADD CONSTRAINT jampelajaran_jampelajaransiswa_idjampelajaran_foreign FOREIGN KEY (id_jam_pelajaran) REFERENCES public.jam_pelajaran (id);

ALTER TABLE ONLY public.jam_pelajaran_siswa 
    ADD CONSTRAINT siswa_jampelajaransiswa_idsiswa_foreign FOREIGN KEY (id_siswa) REFERENCES public.siswa (id);

ALTER TABLE ONLY public.siswa 
    ADD CONSTRAINT kelas_siswa_idkelas_foreign FOREIGN KEY (id_kelas) REFERENCES public.kelas (id);

ALTER TABLE ONLY public.siswa 
    ADD CONSTRAINT walikelas_siswa_idwalikelas_foreign FOREIGN KEY (id_wali_kelas) REFERENCES public.wali_kelas (id);

