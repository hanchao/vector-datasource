SELECT name, kind, admin_level, __geometry__, __id__

FROM
(
    --
    -- Place Border
    --
    SELECT
        name,
        boundary AS kind,
        admin_level,
        way AS __geometry__,
        osm_id AS __id__

    FROM planet_osm_polygon

    WHERE
        way && !bbox!
        AND boundary='administrative'
        AND admin_level IN ('2', '3') -- national, disputed

    --
    -- Place Name
    --
    UNION

    SELECT
        name,
        place AS kind,
        NULL AS admin_level,
        way AS __geometry__,
        osm_id AS __id__

    FROM planet_osm_point

    WHERE
        name IS NOT NULL
        AND place IN (
            'continent',
            'ocean',
            'country',
            'sea'
        )
        AND way && !bbox!

) AS places
