# Fintecture

Fintecture is connected with most European banks and enables a user to initiate a payment directly from their bank account. This results to a bank transfer sent from the user's bank account directly to your bank account, skipping all intermediaries. Within the SEPA region, transfers take between 10 seconds to 1 business day to arrive on your bank account. No hidden fees. Check out [our website](https://fintecture.com/).

## Prerequisites

Make sure you have installed all of the following prerequisites on your development machine:

* Rails - [Download & Install Ruby on Rails](https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm)

## Running the sample

Before execute the sample you should change the `redirect_url` in the `.env` file in order to connect come back to the server you will run this project. Replacing the port number for yours should be enough.

```
redirect_url="http://localhost:[your port]/callback"
```

Run the server

    $ rails server

The server will executed on port 3000 by default as usual. You can change the port by specifying `--port 3000` or `-p 3000`.
    
    $ rails server --port [your port]

## Set Up (.env)

This sample project has a `.env_example` file that provides fake parameters, you should replace the values with yours. To do that you have to create an application before on the [developer console](https://console.fintecture.com).

```
fintecture_app_id="a229d811-0f17-4295-b135-99bb1cb2ca63s"
fintecture_app_secret="a50afa3e-fea5-4bb8-86bd-b52c945fc0e8g"
fintecture_app_private_key="-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDI8ft2cX5Zos3X\nPLT5/XlM6GYxAc122+fufVEKlMWIxZiSVfElhvznTa5jQPyTw5dshBZCZ6EZK/RT\noGZTrUC7EE6/ZI5gvVz6foVQHbpMIyGQ0dL2ne/2+gSxmOO3XtdIYQp7k0uINtUr\n2Pbzi8n//FRj9TJqpQoHN1PB+UPBzjklis8o4pZctZ9HVpzb6vK8qga1L+ja+E7K\nd9EdueV5Y29Uh7bPoGDGrFjZrQpcbvHEIvlvdMIabrpBu/4uzZ4f663as/vHDMDr\n9zP4VOpZcME4D2UBiRiztbDQukgUQnYMudHfN6zuYIAig9eSI2sPQlgciUWJ+ryD\nWkmwRozPAgMBAAECggEAV3+O6KdIxk0u5m8nusdVn1h+zw4i4oOk/WMR+9KGJSUt\nZ2MGyzl5PFrF+bAdi1YaxITLkITBUE2kaRmqFPuW+R2DvLFTkepC50xaTmVzbp3J\nit7ixsJE8D0z+AVD+t/QTFL9Fowv0pNVxW8HMUuIXPAJ6zCkkG1m7Xd5ADjC+UtF\nQAaVHcAmz2lKRBCP9lzzCN2TfVpMGu71KcpaPXXhzuHWXsi2jEWyjvPajfLQvlQI\nUVsLRJsNlz1PILslU/tuu2vASmpl7aWy+PxXGYTd7UOqeQ+es4xYpxmMfR2hhV4Y\nOVOMRtqzmgh8QCEsuVfuA5sXxrksc/0J7iGXm2+SYQKBgQD9CoJmPt8KicQDkbsY\ni6fjbhWOsVm1iWZJjXQR1XwsDmOmlK8gBfwHm2wFhaRt5G1jeo0/Trme4bKpvSOn\nddGJjJln3vk7TwcCquo/G7D+ZzB3IqL2FEqZqPFTTTu/eVHVtPXUurt4SpkZnzH+\n1vt3YKKDq31e4auBIW+ZBbl2UQKBgQDLS4WGQTCVZleeQ02PbdSd2IcQL/4ye3ao\nm6btC0GmrhhTd+rXdVdRRxxkkmnQDLVOnj05dCXOxtnhVMTsU+B4hUTNQvp8gW1c\nBID5p08kvUOjSrfjkE5dIyp08H9cuFTuwL55sIvvs5NimJ8fWoaOCb1pgtzrVrl7\no40uRCppHwKBgQCPUWd//7YWYucZWm4MvfTONKiTFFIKJxM/L5YBD9hvn4rDa80w\npxMTP+1Tx1jVQR7PzDa6F528pnqp9s196JZQgMjWcwzYka8XzLQ2IDoELW/e2khQ\ndje2hmCA3OqtTUqTbxYZcdYCkMXcJDWN8Denap1BVF0C43BfCBAMLJjZsQKBgFRl\nUtZMY+Xx6bfrCtzbZKPuywteUTIV7UnL7H2F6chPiAvGwbiWnxw/4DqkScc0L2Sm\n7pXWcQepp7QS4/mUTKDb+pcYEjLz7DmCKST7XzDKXbUBhNu1AcNKoQqQ+N6+K4w+\nehS8xStKqooJAC4c/7Uht/+Ac0RD6Za5bBfj9pNTAoGAGHiUKyN/wB5joM6/K7bm\nStLwtZclgd2jkqPp5yuhmSpXPkQmEePhWrHuEx2pF6hdSvI1RRydNgTn0YmpB0bM\nWDQPSNRwcsKTJVM2qb6Xx2ziBhGZf1vdyYLlin+vigoWgGg5xUAsUG0cGbloZ/dB\nWosgDj9AGW6w4ETDnTGCA1QQ=\n-----END PRIVATE KEY-----"
```


Your `config/initializers/fintecture.rb` file in initializers will be in charge to load those variables:

```ruby
Fintecture.app_id = ENV['fintecture_app_id']
Fintecture.app_secret = ENV['fintecture_app_secret']
Fintecture.private_key = ENV['fintecture_app_private_key']
```

## Set Up (secrets.yml)

This sample project has a `secrets.yml` file that provides fake parameters, you should replace the values with yours. To do that you have to create an application before on the [developer console](https://console.fintecture.com).

```
fintecture_app_id: a229d811-0f17-4295-b135-99bb1cb2ca63s
fintecture_app_secret: a50afa3e-fea5-4bb8-86bd-b52c945fc0e8g
fintecture_app_private_key: |
  -----BEGIN PRIVATE KEY-----
  MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDI8ft2cX5Zos3X
  PLT5/XlM6GYxAc122+fufVEKlMWIxZiSVfElhvznTa5jQPyTw5dshBZCZ6EZK/RT
  oGZTrUC7EE6/ZI5gvVz6foVQHbpMIyGQ0dL2ne/2+gSxmOO3XtdIYQp7k0uINtUr
  2Pbzi8n//FRj9TJqpQoHN1PB+UPBzjklis8o4pZctZ9HVpzb6vK8qga1L+ja+E7K
  d9EdueV5Y29Uh7bPoGDGrFjZrQpcbvHEIvlvdMIabrpBu/4uzZ4f663as/vHDMDr
  9zP4VOpZcME4D2UBiRiztbDQukgUQnYMudHfN6zuYIAig9eSI2sPQlgciUWJ+ryD
  WkmwRozPAgMBAAECggEAV3+O6KdIxk0u5m8nusdVn1h+zw4i4oOk/WMR+9KGJSUt
  Z2MGyzl5PFrF+bAdi1YaxITLkITBUE2kaRmqFPuW+R2DvLFTkepC50xaTmVzbp3J
  it7ixsJE8D0z+AVD+t/QTFL9Fowv0pNVxW8HMUuIXPAJ6zCkkG1m7Xd5ADjC+UtF
  QAaVHcAmz2lKRBCP9lzzCN2TfVpMGu71KcpaPXXhzuHWXsi2jEWyjvPajfLQvlQI
  UVsLRJsNlz1PILslU/tuu2vASmpl7aWy+PxXGYTd7UOqeQ+es4xYpxmMfR2hhV4Y
  OVOMRtqzmgh8QCEsuVfuA5sXxrksc/0J7iGXm2+SYQKBgQD9CoJmPt8KicQDkbsY
  i6fjbhWOsVm1iWZJjXQR1XwsDmOmlK8gBfwHm2wFhaRt5G1jeo0/Trme4bKpvSOn
  ddGJjJln3vk7TwcCquo/G7D+ZzB3IqL2FEqZqPFTTTu/eVHVtPXUurt4SpkZnzH+
  1vt3YKKDq31e4auBIW+ZBbl2UQKBgQDLS4WGQTCVZleeQ02PbdSd2IcQL/4ye3ao
  m6btC0GmrhhTd+rXdVdRRxxkkmnQDLVOnj05dCXOxtnhVMTsU+B4hUTNQvp8gW1c
  BID5p08kvUOjSrfjkE5dIyp08H9cuFTuwL55sIvvs5NimJ8fWoaOCb1pgtzrVrl7
  o40uRCppHwKBgQCPUWd//7YWYucZWm4MvfTONKiTFFIKJxM/L5YBD9hvn4rDa80w
  pxMTP+1Tx1jVQR7PzDa6F528pnqp9s196JZQgMjWcwzYka8XzLQ2IDoELW/e2khQ
  dje2hmCA3OqtTUqTbxYZcdYCkMXcJDWN8Denap1BVF0C43BfCBAMLJjZsQKBgFRl
  UtZMY+Xx6bfrCtzbZKPuywteUTIV7UnL7H2F6chPiAvGwbiWnxw/4DqkScc0L2Sm
  7pXWcQepp7QS4/mUTKDb+pcYEjLz7DmCKST7XzDKXbUBhNu1AcNKoQqQ+N6+K4w+
  ehS8xStKqooJAC4c/7Uht/+Ac0RD6Za5bBfj9pNTAoGAGHiUKyN/wB5joM6/K7bm
  StLwtZclgd2jkqPp5yuhmSpXPkQmEePhWrHuEx2pF6hdSvI1RRydNgTn0YmpB0bM
  WDQPSNRwcsKTJVM2qb6Xx2ziBhGZf1vdyYLlin+vigoWgGg5xUAsUG0cGbloZ/dB
  WosgDj9AGW6w4ETDnTGCA1QQ=
  -----END PRIVATE KEY-----
```


Your `config/initializers/fintecture.rb` file in initializers will be in charge to load those variables:

```ruby
Fintecture.app_id = Rails.application.secrets.fintecture_app_id
Fintecture.app_secret = Rails.application.secrets.fintecture_app_secret
Fintecture.private_key = Rails.application.secrets.fintecture_app_private_key
```

## Set Up (credentials.yml.enc)

This sample project has a `credentials.yml.enc` file that provides fake parameters, you should replace the values with yours. To do that you have to create an application before on the [developer console](https://console.fintecture.com).

To open it you could use this command line
```
EDITOR=vim rails credentials:edit
```

This is the fintecture structure configuration you should have (using your values).
```
fintecture_app_id: a229d811-0f17-4295-b135-99bb1cb2ca63s
fintecture_app_secret: a50afa3e-fea5-4bb8-86bd-b52c945fc0e8g
fintecture_app_private_key: |
  -----BEGIN PRIVATE KEY-----
  MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDI8ft2cX5Zos3X
  PLT5/XlM6GYxAc122+fufVEKlMWIxZiSVfElhvznTa5jQPyTw5dshBZCZ6EZK/RT
  oGZTrUC7EE6/ZI5gvVz6foVQHbpMIyGQ0dL2ne/2+gSxmOO3XtdIYQp7k0uINtUr
  2Pbzi8n//FRj9TJqpQoHN1PB+UPBzjklis8o4pZctZ9HVpzb6vK8qga1L+ja+E7K
  d9EdueV5Y29Uh7bPoGDGrFjZrQpcbvHEIvlvdMIabrpBu/4uzZ4f663as/vHDMDr
  9zP4VOpZcME4D2UBiRiztbDQukgUQnYMudHfN6zuYIAig9eSI2sPQlgciUWJ+ryD
  WkmwRozPAgMBAAECggEAV3+O6KdIxk0u5m8nusdVn1h+zw4i4oOk/WMR+9KGJSUt
  Z2MGyzl5PFrF+bAdi1YaxITLkITBUE2kaRmqFPuW+R2DvLFTkepC50xaTmVzbp3J
  it7ixsJE8D0z+AVD+t/QTFL9Fowv0pNVxW8HMUuIXPAJ6zCkkG1m7Xd5ADjC+UtF
  QAaVHcAmz2lKRBCP9lzzCN2TfVpMGu71KcpaPXXhzuHWXsi2jEWyjvPajfLQvlQI
  UVsLRJsNlz1PILslU/tuu2vASmpl7aWy+PxXGYTd7UOqeQ+es4xYpxmMfR2hhV4Y
  OVOMRtqzmgh8QCEsuVfuA5sXxrksc/0J7iGXm2+SYQKBgQD9CoJmPt8KicQDkbsY
  i6fjbhWOsVm1iWZJjXQR1XwsDmOmlK8gBfwHm2wFhaRt5G1jeo0/Trme4bKpvSOn
  ddGJjJln3vk7TwcCquo/G7D+ZzB3IqL2FEqZqPFTTTu/eVHVtPXUurt4SpkZnzH+
  1vt3YKKDq31e4auBIW+ZBbl2UQKBgQDLS4WGQTCVZleeQ02PbdSd2IcQL/4ye3ao
  m6btC0GmrhhTd+rXdVdRRxxkkmnQDLVOnj05dCXOxtnhVMTsU+B4hUTNQvp8gW1c
  BID5p08kvUOjSrfjkE5dIyp08H9cuFTuwL55sIvvs5NimJ8fWoaOCb1pgtzrVrl7
  o40uRCppHwKBgQCPUWd//7YWYucZWm4MvfTONKiTFFIKJxM/L5YBD9hvn4rDa80w
  pxMTP+1Tx1jVQR7PzDa6F528pnqp9s196JZQgMjWcwzYka8XzLQ2IDoELW/e2khQ
  dje2hmCA3OqtTUqTbxYZcdYCkMXcJDWN8Denap1BVF0C43BfCBAMLJjZsQKBgFRl
  UtZMY+Xx6bfrCtzbZKPuywteUTIV7UnL7H2F6chPiAvGwbiWnxw/4DqkScc0L2Sm
  7pXWcQepp7QS4/mUTKDb+pcYEjLz7DmCKST7XzDKXbUBhNu1AcNKoQqQ+N6+K4w+
  ehS8xStKqooJAC4c/7Uht/+Ac0RD6Za5bBfj9pNTAoGAGHiUKyN/wB5joM6/K7bm
  StLwtZclgd2jkqPp5yuhmSpXPkQmEePhWrHuEx2pF6hdSvI1RRydNgTn0YmpB0bM
  WDQPSNRwcsKTJVM2qb6Xx2ziBhGZf1vdyYLlin+vigoWgGg5xUAsUG0cGbloZ/dB
  WosgDj9AGW6w4ETDnTGCA1QQ=
  -----END PRIVATE KEY-----
```


Your `config/initializers/fintecture.rb` file in initializers will be in charge to load those variables:

```ruby
Fintecture.app_id = Rails.application.credentials.fintecture_app_id
Fintecture.app_secret = Rails.application.credentials.fintecture_app_secret
Fintecture.private_key = Rails.application.credentials.fintecture_app_private_key
```