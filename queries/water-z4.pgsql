SELECT name, area, kind, source, __geometry__, __id__

FROM
(
    --
    -- Ocean
    --
    SELECT
        '' AS name,
        way_area::bigint AS area,
        'ocean' AS kind,
        'naturalearthdata.com' AS source,
        the_geom AS __geometry__,
        gid::varchar AS __id__

    FROM ne_50m_ocean

    --
    -- Lakes
    --
    UNION

    SELECT
        name,
        way_area::bigint AS area,
        'lake' AS kind,
        'naturalearthdata.com' AS source,
        the_geom AS __geometry__,
        gid::varchar AS __id__

    FROM ne_50m_lakes

    --
    -- Playas
    --
    UNION

    SELECT
        name,
        way_area::bigint AS area,
        'playa' AS kind,
        'naturalearthdata.com' AS source,
        the_geom AS __geometry__,
        gid::varchar AS __id__

    FROM ne_50m_playas

) AS water_areas
