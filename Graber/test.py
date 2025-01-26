import requests
from bs4 import BeautifulSoup

def fetch_quotidienne_results():
    url = 'https://loteries.espacejeux.com/fr/loteries/la-quotidienne'
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    
    # Извлечение данных после <span class="num">
    results = []
    for item in soup.select('span.num'):
        result = item.text.strip()
        results.append(result)
    
    return results

if __name__ == "__main__":
    results = fetch_quotidienne_results()
    
    if len(results) >= 9:
        print(" ".join(results[0:2]))        # Первые два элемента первой строкой
        print(" ".join(results[2:5]))        # Третий, четвертый и пятый элементы второй строкой
        print(" ".join(results[5:9]))        # Шестой, седьмой, восьмой и девятый элементы третьей строкой
    else:
        print("Недостаточно данных для вывода.")
