COPY %{table} (
	id,
	shop_id,
	handle
)
FROM ?
WITH (FORMAT text);
