---kelas
---kelas objek kelas
create table public.kelas(
    id int generated by default as identity,
    nama text not null,
    tingkat int not null,
    created_at timestamp with time zone default current_timestamp,
    updated_at timestamp with time zone default current_timestamp,
    deleted_at timestamp with time zone
);

alter table only public.kelas
    add constraint kelas_pkey primary key (id);


---mata pelajaran
---mata pelajaran objek mata pelajaran 
create table public.mata_pelajaran(
    id int generated by default as identity,
    nama text not null,
    kode text not null,
    tingkat int not null,
    created_at timestamp with time zone default current_timestamp,
    updated_at timestamp with time zone default current_timestamp,
    deleted_At timestamp with time zone
);

alter table only public.mata_pelajaran
    add constraint mata_pelajaran_pkey primary key(id);

alter table only public.mata_pelajaran add constraint mata_pelajaran_kode_unique unique (kode);


---wali kelas
create table public.wali_kelas(
    id int generated by default as identity,
    nama text not null,
    alamat text,
    no_telp text,
    created_at timestamp with time zone default current_timestamp,
    updated_at timestamp with time zone default current_timestamp,
    deleted_At timestamp with time zone
);

alter table only public.wali_kelas
    add constraint wali_kelas_pkey primary key(id);


---jam pelajaran
create table public.jam_pelajaran(
    id int generated by default as identity,
    id_matpel int not null,
    jam_mulai timestamp with time zone,
    jam_akhir timestamp with time zone,
    created_at timestamp with time zone default current_timestamp,
    updated_at timestamp with time zone default current_timestamp,
    deleted_At timestamp with time zone
);

alter table only public.jam_pelajaran
    add constraint jam_pelajaran_pkey primary key(id);

alter table only public.jam_pelajaran
    add constraint mata_pelajaran_jam_pelajaran_id_mata_pelajaran_forreign foreign key(id_matpel) references public.mata_pelajaran(id);


---siswa objek siswa
create table public.siswa(
    id int generated by default as identity,
    nama text not null,
    id_kelas int not null,
    id_wakel int not null,
    tingkat int not null,
    alamat text,
    created_at timestamp with time zone default current_timestamp,
    updated_at timestamp with time zone default current_timestamp,
    deleted_At timestamp with time zone
);

alter table only public.siswa
    add constraint siswa_pkey primary key(id);

alter table only public.siswa
    add constraint kelas_siswa_id_kelas_forreign foreign key(id_kelas) references public.kelas(id);

alter table only public.siswa
    add constraint wali_kelas_siswa_id_wali_kelas_forreign foreign key(id_wakel) references public.wali_kelas(id);


---jam pelajaran siswa
create table public.jam_pelajaran_siswa(
    id int generated by default as identity,
    id_jampel int not null,
    id_siswa int not null,
    status_kehadiran text,
    created_at timestamp with time zone default current_timestamp,
    updated_at timestamp with time zone default current_timestamp,
    deleted_At timestamp with time zone
);

alter table only public.jam_pelajaran_siswa
    add constraint jam_pelajaran_siswa_pkey primary key(id);

alter table only public.jam_pelajaran_siswa
    add constraint jam_pelajaran_jam_pelajaran_siswa_id_jam_pelajaran_forreign foreign key(id_jampel) references public.jam_pelajaran(id);

alter table only public.jam_pelajaran_siswa
    add constraint siswa__jam_pelajaran_siswa_id_siswa_forreign foreign key(id_siswa) references public.siswa(id);

