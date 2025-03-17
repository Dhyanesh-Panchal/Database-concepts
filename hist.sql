SELECT AVG(agg.val),agg.bucket FROM (
    SELECT val, (time/5) AS bucket
) AS agg GROUP BY agg.bucket