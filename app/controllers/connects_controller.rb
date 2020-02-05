class ConnectsController < ApplicationController

  before_action :set_connect, only: :create

  def index
    @connect = Connect.new(amount: 150, currency: 'EUR', communication: 'Thanks Mom!')
  end

  def create
    set_fintecture_conf

    if @connect.valid?
      if Fintecture.environment != 'production'
        @connect.customer_full_name = 'Test bot'
        @connect.customer_email = 'email@test.com'
        @connect.customer_ip = '192.168.0.1'
      end

      tokens = Fintecture::Pis.get_access_token

      pis_connect = Fintecture::Connect.get_pis_connect tokens['access_token'], @connect

      redirect_to pis_connect[:url]
    else
      render 'index'
    end

  end

  private

  def connect_params
    params.require(:connect).permit(
        :amount,
        :currency,
        :communication,
        :customer_full_name,
        :customer_email
    )
  end

  def payments_attributes
    connect_params.merge(
      {
        redirect_uri: ENV['redirect_url'],
        origin_uri: ENV['redirect_url'].remove('/callback')
      }
    )
  end

  def model
    Connect
  end

  def set_connect
    @connect = model.new(payments_attributes)
  end

  def set_fintecture_conf
    Fintecture.app_id = '65bfee30-1b5d-4687-83c7-286fb459feda'
    Fintecture.app_secret = '66c41ebf-877d-40c9-9285-4485ebb27a76'
    Fintecture.private_key = %q(-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCvmLdR93sxZiq7
LQGB6JhoIe9HoniwuB+Cs5f98BflBe/PgSnJWqQaIKTS02P6A8En6hwvH3FGUxpw
zZ0rO0vdGQJJUsQS5F3q1C/8qrjiOVVRQs7vZ2Cpoj/VhdXNNBdQ+hLJdXpb84jT
aKLgXAqMgIVBlz2xNBTUi5OvavNwjHN9qm6eQKrjsRnkuEAiDcZPj/lyAHDICjjS
G2tdFYbZjAxR0I3Rm9BP/wLG0FfcoV4qINVKyObXYoG9Zn1i+inwAA2fP1rPXZMW
34LWjw1b/rKiF3wTF57ZuA9oQsb6+qiWUQlcblmhSuymG48X1GN6XR7aIkqqmls5
heJ1zwHjAgMBAAECggEATa8IzwznJewWlHctNw0xO8RjiPQCY+AZJKgSYmgREiOl
u83fMDLW7a4qbRDTJpz5m5BxRpGo+d0zEduNID6b6eUyA0FH+DmqqQSVdDkNERwf
OBOP3A8GjxV2Gx8Z/q4AcLUpkZHU/5AGpMyiXhKqIg2LpoBj7Rzm6D8Vp6HvsAbe
ej1gTFzTjqUDuv48J8W845+aeN0qw5hAG382bDYDdYYYN9G/50j9mMhW1ZAEyRuU
j0VoOl/rdDpGlXlzh+ZhGGhXZdSYqf7+TvI52PgAOStB0vWtQMK2usu1R9qsqPen
5sRbLGO8cKrZy4+GpbuMarY+61xehkgCKH+6K1aAuQKBgQDorltYfXr6VFQ5X2Pa
4xrncUUmUkRqsJPetlyXV3WYJplkNtjgwkEYwvbvE3eh3h/zfxUHWqHFq0vTpAVR
/1XezG089oCyLhq8Nkqjs0VexQIPi3QTGW4GZleNx82kGbKfHXXbW70CCebShKM3
uDzQR4OcAoK+AIwJEBFS6Ob2yQKBgQDBMc3UgSwdBKrX2+P/jAFZgf81HD/+Zzg6
09SIMJ7xJz77UOBuIsId3ZELZ/PBSBnkmNA314IbRLLwRSW81ebMPyqcOkl1o2xG
GXPULJmVXLrEwO8jrUzfNfNDCtLE7YHvAZNG0yn0nOBDhSYMRE+5HEjFc5qSE1Jc
szBPpniNSwKBgB28AlJZnriUxDqctQ8IzKxc7kBKbRHRRORGG6j/dTifXiTPWYHH
cTgv2gyNSVF3KFAeolpRO7EeBc+i+0cSQS/6oc8TlTiv6Zy5t2oaA7hrpqrD4G58
ZnIM7A1jRiU9X3Uz95azr4CuMUAf0RfSxHq9WNU8AOc0/LA/zGby+mj5AoGAOtMi
XCk0uGU6a92db6s+ofVuMsq2RY1CVs83MHy1eLI9gCJhI8fbmWJkjreJRfnhQHSz
Ob2Z9RmW7ofvdK8gxmIZZFZvFa28AyAu35Tw8sS4bb5dUlyrQm/X8TrzcFjtLkwp
fvA/HydBNe3t5uBJ8hBFrDGGCCJv+p/o/ueuXz8CgYEAucGIvHvprEpl4PbTk8r7
Fjf/9sURY/MUH3h5dIzlqRe5jarq9k1o+ACYO6mZu1SYK/O1bSyX2BlCYhtAj6F0
wkVzcxJbWw5Q8B7DXqfa02gva10NlLUzoHfgBpghn2OxYhzpli46X4fTb4pzF0GC
DcL1PcxEQ+M0JKHjFRxA+xc=
-----END PRIVATE KEY-----)
    Fintecture.environment = 'local'

#     Fintecture.app_id = '924f6171-596e-45b5-9cf9-dc88e58fcf3d'
#     Fintecture.app_secret = '37d4b80f-123f-4c28-b497-cd23c20707e1'
#     Fintecture.private_key = %q(-----BEGIN PRIVATE KEY-----
# MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDAYViR+A2u1rPH
# mbqfdV8a9kBLiPyWzSUn0yEtPkuDqgFmwwKn8YhQ+QYJzE/pcKYLYJTsMKOmd4LJ
# PxVb4RqFKFbdY/6PkwHVODjp05ll+r8UqyEACF8x4/r6smhiQFfjdnc4GZ5WL08B
# ChX4r+agTeM5Io58witGM+xfuBZsWaBxlrxc3yzo/Kz7zpkTKJPha/vSSIxXiG17
# dhCMXDp84W6w9fn4xuhmCKzpfmEew4uS+PTTAKs4okXr4KoOsxuaOXsmVjgeYO9v
# 7KrDQPEfCPfsz6tsYkSOTFpLKbOuY+EfEA1V0xFLftuF6mW0hNpDYKlDiHEnWD32
# RSYm0X1NAgMBAAECggEAJRcPj7LylmUUC7VGjwQ+xhC4hCegxUU/dt5kfNfQEM4n
# z4NlAXKWfMAKKzzuIjxi8voXtDLLdmZ/u2OTb1+msIn+t1fWRiGKXqykgmZWopv1
# l5tHtT0n91M0Of3IFLtBhpv6L8F2rriXw4RJiKUHMpxZpNQWAxUfaT1NAwZXomNO
# sS0/A0zaGkf7W6NHFmOHCc5Z1+aFbZGx4aSosB8XpXqA7qjIo9fD1D3fbJb0cLG9
# yj51A+8vWh2QMDzL4TaLDcFd9SeRpbJi728bEILp36FJXPeUHOgRQEUJV+BkH4KO
# vr6n/Iin9QtfMW294ZZZOo66QCe+oUHKg8F9HeM80QKBgQDgMtTFHdFBTZUT1BV0
# psNZQABC1CqwH3qIufBSZyKC8aSXj8G1V7CbfR+GD+S4P7CrAsa6m8QyJpcTpCig
# 15bRb8TrUvRaWX82n/IqeaGjkiprBVE7V9lx1k2Sr8C8t2pPHss0xr8x5PzXyvs7
# Bc8zuHM3E+/czVavPgDgVnKXcQKBgQDbqx5fElyhX7mPd9TihZj2GhIm2gPB+COf
# z9IWuuBCnMkXowAe86bWW9njEDICjX1y/5Mnn6axw6GUuJ9UpqmweL6cU4AzYCeS
# xsToBTjq2/BYNgK6nBsWac2VkdzJE3pnR7cq8gxzy+LZ6TN4O+rf0RYfma0tzoMh
# OsbDzEftnQKBgQChNywUykosoTMv3PPIvBoA1araY2KG3zvnkX0kZBFHA6gNbEwo
# sHPIe4LtjgQ0EWhisE5i5ZuBTIqajxLABgbnd22soiwfw/dcOkuTC3+V9YcXCe3N
# tHAiEa4aatM3YNTLLCOHQds+b6D5M3bQjG7gjCQdWPLEXcuVnApZRxCDoQKBgGls
# xcXBDT3RsD/ftgcFMTUjrASDa3xDN+2yEtUf2RN/Ja+3Zg50x2RnbrngAvBgsY1o
# hVpl792u0zSKKsW4uwXb3Tcvh/6gLj3uMYBdSUTGS6I6QbMHyqRGIQmgmILUW1GI
# BKuSwVEtz/DfT/lrYD0Mnv6JhajPTPW8vLopp3etAoGAcoyl/1mrixQcdFlPk3Xx
# 1z+8gXIjW7XRJ80ToKlHBK53+GTv43Xk7OXwTZDbhmslan+oVScMmuS6azBgaNId
# rRg9gtRkqgLTCH385PbP0pT4PLAhI+hIN60ZVtulb+kI6salX0rk8MxCAyd6NbgK
# O+ebxgspujahx79k7YUEF2E=
# -----END PRIVATE KEY-----)
#     Fintecture.environment = 'test'
  end
end
