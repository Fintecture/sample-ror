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

## Set Up

This project has a `.env` file that provides all the parameters required to execute the sample, but you are free to replace the values with yours. To do that you have to create an application before on the [developer console](https://console.fintecture.com).

```
fintecture_app_id="128925b2-1106-48ce-a0a0-3b75bb2e0d48"
fintecture_app_secret="aa6d8452-4a64-4704-a810-be77993cb1e5"
fintecture_app_private_key="-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDMpUBcC0B7lmec\nEaNV5xnxlJaHxvQAJFKuJqeApZu8TifWrFzql7WbPjeoEV4Iqm1oWyCVj3woZtLm\nCIXqBN6ZUcjytYeUmsZJmk7s9r1oZIVRBzVguyLOT7juZ+zcv9PzSDb6KItigKgo\n7sgb8hq1sNJZARBiMvJB4HkA8LMNluMcVd8wjADKyIKUdRIrMw9rjXmRIEUI1Loc\nkU1KrpYpDUIhBg9K7dBHA20b/YjvEIC1TC4F0tlSe6XAeXGersKSDMYw1+d183xK\n5JzZIkn4w8kFwQhTBF+Ouym/z1rFbthPnEPK2EGp8WWAfZ41a3QtCXwQkGPO1V+H\nV9mYIhJxAgMBAAECggEAAOczVHwWejgBltFL7lETUjnn3la52pDFVBqVjJE2iJBh\nIJyKLIrT8ejY1nF2G0jzngectaf5kO4LBiLhZ1djP9mFakzdF22lnHaY4Ttj7BSi\nagT1xsPEXydyU0Ly/YA6nW7o0rPanx6w90rHaCOqaWKpf/vuFYRuM5H0+MAZeOev\nccyU3XwEjEmGk502hd9uWJklLqAjvKl66u+/df+Bp3UTHL5uJEXzA4ubCto/wtj7\nVIGUBNN6+VCCGWrTIb/zMg8YTQSFnmyH/ZYuF1FNFebuk3VIdruoHgIxhvkuMTT9\nzV6GImKA9lu2xCk6PPYLkD72g1N6k2MgMzj0+B0MYQKBgQDsNaicGWH8pK2QwzdB\n4tUeCqUGS8XES4VYQ6WIkWnk5nFt4Oc3+CdqJtfZwV/Z0VtzArYNEMROIfKXaGx1\noyiuzdjmRtu2fTmRTmlMfXTLF9L2wVbscmfk9gRC19Xcc0HEhkEJBVIYn6Ilqgy8\nsjv/OuHUiVIA8P4192lWV8qzIQKBgQDdypclfayPVY93siXZX8rhgdrq0vNFGQNp\nacD8WyhH7iMa+fnQeyZOzQtHFIcPYBEPcmqsCfX1+VVYKQApae0yHRtFO5j7vujr\n1pQNBO1+EQvWUuwub1+8LdQqnv0l8HWqYcSu7ECxxc0OhfiHgT5O86ISKuu+vwfC\nYaGzR0fFUQKBgQCiiSnEgBLU7dwgyLO1Ooi7a0ey1WD4eZ7/5Ux6dNURFSDoIuH3\nuWIlwSS2SkHSeCUdNrhetTLfMKzlUo2PRP4xiqO9kPSO1gxO2E3MvGcpePNJqDBP\n80laW48DD9GxJ/4RZPBLbMXY+79ve1vYXCy8q5/Jx9QNocbLC7wIFdD9AQKBgD6w\ncKBsMUYiTPbsJ76VUOcEqTgOgCxbsZcuCRpLOct7B/ksBuxioqVLV5CzwKkb4jaX\nhIc0GY14+CJ/FEigZCbyCy86dTdS8ssWT6qOZgJoFwxxS8ikOk8aNQoG/k6m9Ns/\n3zQCGxckbZ1ZSLIkWdQ/EORJtXCo1iyfI/FkiGjBAoGBAM6bd+5sPQmPqU3Sq5S8\nKN6ZinjnDh7MtEnC6LegMU0Tkb9HIBL0QnzYX/q3Ps6dekHfc5gP6vY5Ym6Wu7M7\nC09apUAFOCzzSyE7R+r4aWkifGaPWMU/SsX8tR5wldB0gxFom+qaK2jLJoiVcX16\niBEZTlWdJeeo3PxDgiHt8uaa\n-----END PRIVATE KEY-----"
```

Your `fintecture.rb` file in initializers will be in charge to load those variables:

```ruby
Fintecture.app_id = ENV['fintecture_app_id']
Fintecture.app_secret = ENV['fintecture_app_secret']
Fintecture.app_private_key = ENV['fintecture_app_private_key']
```