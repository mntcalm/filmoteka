# models.py

class Db_details(object):
    def __init__(self, driver, name, host, port, login, password):
        self.driver = driver
        self.name = name
        self.host = host
        self.port = port
        self.login = login
        self.password = password

class Log_details(object):
    def __init__(self, level, size, number):
        self.level = level
        self.size = size
        self.number = number

class UserLogin():
    def __init__(self, id, name, role_id, locked):
        self.id = id
        self.name = name
        self.role_id = role_id
        self.locked = locked
    
    def is_authenticated(self):
        return True
    def is_active(self):
        return True
    def is_anonymous(self):
        return False
    def get_id(self):
        return str(self.id)

class Prch(object):
    def __init__(
        self,
        id,
        film_name,
        janre_id,
        release_date,
        rejiser,
        descript,
        rate,
        user,
        poster):
            self.id = id
            self.film_name = film_name
            self.janre_id = janre_id
            self.release_date = release_date
            self.rejiser = rejiser
            self.descript = descript
            self.rate = rate
            self.user = user
            self.poster = poster

class Janry(object):
    def __init__(
        self,
        id,
        j_name):
            self.id = id
            self.j_name = j_name


class Regisery(object):
    def __init__(
        self,
        id,
        r_name):
            self.id = id
            self.r_name = r_name


