#!/bin/sh

# Files not under C755A repository
# This list does not contain standard header/library
# Some of the missing files may be automatically generated during compilation.
#
# all.h
# alt_path.h
# and.h
# asc.h
# ascconnection.h
# BmfMessage.hh
# cod.h
# ctlcmd.h
# dbm.h
# errno.h
# ggetopt.h ?
# hgt.h
# hrg.h
# imgtmcpex_servier_i.hh
# inter_record.h
# km_record.h
# manager.h
# matb.h
# mbo.h
# num.h
# ols.h
# rtap/database.h
# ssal.h
# scadaorb.h
# scs.h
# scsaddress.h
# scsalmext.h
# scsimgmodule.h
# scstimer.h
# sta.h
# sys.h
# sys_pro.h
# tbs.h
# tcf.h
# tcl.h
# timb.h
# tmcpex_server.hh
# tmcpex_serverproxy.hh
# tmc_agu.h
# tmc_camino.h
# tmc_cdv.h
# tmc_cfg.h
# tmc_cirpec.h
# tmc_cirpem.h
# tmc_cirpet.h
# tmc_cycle.h
# tmc_enclav.h
# tmc_esta.h
# tmc_hora.h
# tmc_intersta.h
# tmc_iti.h
# tmc_launching.h
# tmc_launchper.h
# tmc_linea.h
# tmc_man.h
# tmc_manstage.h
# tmc_pec.h
# tmc_pem.h
# tmc_period.h
# tmc_pet.h
# tmc_per.h
# tmc_powerzone.h
# tmc_ppf.h
# tmc_ppl.h
# tmc_regdata.h
# tmc_subroute.h
# tmc_tcf.h
# tmc_trafdir.h
# tmc_tren.h
# tmc_stabling.h
# tra_hor.h
# trafic_i.h # Yes, it's actually spelled like this
# trip_record.h
# tvr.h
# twp.h
# utility.h
# vel.h

/usr/bin/env cppcheck --enable=all --force \
    --library=tmc.cfg \
    -I ../hmi/Nel-gws/Project/NelVisu_new/NelVisu_new/src \
    -I ../mcs/bmf/col/orb/inc \
    -I ../mcs/bmf/inc \
    -I ../mcs/scc/ala/ext/inc \
    -I ../mcs/sig/ctl/orb/inc \
    -I ../mdb/INCLUDE_MDB/INCLUDE_MDB_SHARE \
    -I ../nel/inc \
    -I ../nel/red/inc \
    -I bmfint/inc \
    -I classes/inc \
    -I enc/inc \
    -I enc/tst \
    -I hor \
    -I include \
    -I integration \
    -I lch/inc \
    -I lch/tst \
    -I lchint/inc \
    -I mdbdef \
    -I pex/inc \
    -I pex/orb \
    -I pex/tst \
    -I pis/inc \
    -I reg/inc \
    -I reg/tst \
    -I sal/inc \
    -I sal/tst \
    -I scsint/inc \
    -I sigint/inc \
    -I sta/inc \
    -I stb/inc \
    -I stb/tst \
    -I stbint/inc \
    -I stub/include \
    -I stub/telcom \
    -I sup/inc \
    -I sup/orb \
    -I tcl/include \
    -I tgtint/inc \
    -I tools/inc \
    -I tra \
    -I trk/inc \
    -I trk/tst \
    -I twp/inc \
    sup
