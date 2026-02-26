use solar;

CREATE VIEW sun_summary AS
select distinct substr(date,1,7) JD,
substr(sd.monthyr,4,5) YEAR, substr(sd.monthyr,1,3) MONTH,
day DAY,
upper(sd.Obs) Obs,
sk.name,
upper(see) SEE,
g,
s,W,
ch.updated hupdate,
ch.method method, 
ch.inst,
substr(Aperture,1,10) Aperture, 
ch.filter filter,
ch.eyepiece eyep,
ch.focal_length Foc_len,
ch.focal_length_type unit,
ch.magnification,
sk.updated kupdate,
sk.k, 
sk.scale,
sk.SIDC_submitter

from sun_header ch, sun_data sd, sun_obsconst sk
where ch.id = sd.header_id
and sd.revised = 0
and sk.revised = 0
and sk.Obs = sd.Obs
and substr(sd.monthyr,1,3) = 'Jan'
and substr(sd.monthyr,4,5) = ' 2025'
group by substr(date,1,7), sd.Obs
;

--- INTO OUTFILE 'C:/heidisql/202501_obs.csv' FIELDS TERMINATED BY ','