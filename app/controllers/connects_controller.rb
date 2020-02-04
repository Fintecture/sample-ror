class ConnectsController < ApplicationController

  before_action :set_connect

  def create

    Fintecture.app_id = '65bfee30-1b5d-4687-83c7-286fb459feda'
    Fintecture.app_secret = '66c41ebf-877d-40c9-9285-4485ebb27a76'
    Fintecture.app_private_key = %q(-----BEGIN PRIVATE KEY-----
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

    if @connect.valid?
      if Fintecture.environment != 'production'
        @connect.customer_full_name = 'Test bot'
        @connect.customer_email = 'email@test.com'
        @connect.customer_ip = '192.168.0.1'
        @connect.customer_id = 123
      end

      redirect_to Fintecture::Connect.connect_url_pis @connect
    else
      render 'static/home'
    end

  end

  private

  def connect_params
    params.require(:connect).permit(
        :amount,
        :currency,
        :order_id,
        :customer_id,
        :customer_full_name,
        :customer_email,
        :customer_id
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
end
