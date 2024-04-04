import requests

# Задаем базовый URL API
base_url = 'https://ox.themailtrac.info'

# Параметры для GET запроса
params = {
    'ff_n': 'Название A',
    'jj_id': -8,
    'rr_id': -8,
    'gg_ot': '',
    'gg_do': '',
    'ww_sort': 'nosort',
    'nn_pagin': 10,
    'pp_page': 1
    }

# Отправляем GET запрос
response = requests.get(f'{base_url}/perechen', params=params)

# Проверяем статус ответа
if response.status_code == 200:
# Выводим содержимое ответа, если запрос был успешным
    print(response.text)
else:
# Выводим сообщение об ошибке
    print(f'Ошибка запроса: {response.status_code}')
