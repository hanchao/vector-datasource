SELECT
    name,
    place AS kind,
    way AS __geometry__,
    osm_id AS __id__,
    admin_level

FROM planet_osm_point

WHERE name IS NOT NULL

AND place IN (
    'city',
    'county',
    'province',
    'island',
    'town',
    'neighbourhood',
    'suburb',
    'locality',
    'lake',
    'village',
    'hamlet',
    'isolated_dwelling'
)
