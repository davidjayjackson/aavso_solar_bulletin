USE solar;

DROP TABLE IF EXISTS summary;

CREATE TABLE summary AS
SELECT DISTINCT
  CONCAT(
    TRIM(SUBSTR(sd.monthyr, 4)), '-',
    LPAD(MONTH(STR_TO_DATE(SUBSTR(sd.monthyr, 1, 3), '%b')), 2, '0')
  )                                          AS JD,          -- YYYY-MM from monthyr
  TRIM(SUBSTR(sd.monthyr, 4))                AS YEAR,
  SUBSTR(sd.monthyr, 1, 3)                   AS MONTH,

  sd.day                                     AS DAY,         -- use your day column (what you wrote as "day")
  sd.date                                    AS julian_date, -- keep raw julian value

  UPPER(sd.Obs)                              AS Obs,
  sk.name                                    AS name,
  UPPER(sd.see)                              AS SEE,
  sd.g                                       AS g,
  sd.s                                       AS s,
  sd.W                                       AS W,
  ch.updated                                 AS hupdate,
  ch.method                                  AS method,
  ch.inst                                    AS inst,
  LEFT(ch.Aperture, 10)                      AS Aperture,
  ch.filter                                  AS filter,
  ch.eyepiece                                AS eyep,
  ch.focal_length                            AS Foc_len,
  ch.focal_length_type                       AS unit,
  ch.magnification                           AS magnification,
  sk.updated                                 AS kupdate,
  sk.k                                       AS k,
  sk.scale                                   AS scale,
  sk.SIDC_submitter                          AS SIDC_submitter
FROM sun_header ch
JOIN sun_data sd
  ON ch.id = sd.header_id
JOIN sun_obsconst sk
  ON sk.Obs = sd.Obs
WHERE sd.revised = 0
  AND sk.revised = 0
  AND SUBSTR(sd.monthyr, 1, 3) = 'Jan'
  AND TRIM(SUBSTR(sd.monthyr, 4)) = '2025';