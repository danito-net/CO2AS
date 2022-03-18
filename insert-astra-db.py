import sys

from cassandra.cluster import Cluster
from cassandra.auth import PlainTextAuthProvider

id = sys.argv[1]
device = sys.argv[2]
label = sys.argv[3]
latitude = sys.argv[4]
longitude = sys.argv[5]
altitude = sys.argv[6]
co2 = sys.argv[7]
temp = sys.argv[8]
note = sys.argv[9]
status = sys.argv[10]

# print("ID =", id)
# print("Device =", device)
# print("Label =", label)
# print("Latitude =", latitude)
# print("Longitude =", longitude)
# print("Altitude =", altitude)
# print("CO2 =", co2)
# print("Temperature =", temp)
# print("Note =", note)
# print("Status =", status)

cloud_config= {
        'secure_connect_bundle': 'secure-connect-co2as-db.zip'
}
auth_provider = PlainTextAuthProvider('...', '...')
cluster = Cluster(cloud=cloud_config, auth_provider=auth_provider)
session = cluster.connect()

query = "INSERT INTO co2as (id, uuid, dtz, device, label, latitude, longitude, altitude, co2, temp, note, status) VALUES ('" + id + "', now(), toUnixTimestamp(now()), '" + device + "', '" + label + "', '"', '" + latitude + "', '" + longitude + "', '" + altitude + "', '" + co2 + "', '" + temp + "', '" + note + "', " + status + ");"

# print(query)

row1 = session.execute("use co2as_keyspace;").one()
row = session.execute(query).one()
