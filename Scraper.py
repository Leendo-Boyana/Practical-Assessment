from requests_html import HTMLSession
page = 'https://www.takealot.com/russell-hobbs-2200w-crease-control-iron/PLID34147865'

a = HTMLSession()
content = a.get(page)

content.html.render(sleep=1)

product = content.html.xpath('//*[@id="shopfront-app"]/div[3]/div[1]', first=True)

for item in product.absolute_links:
    content = a.get(item)
    price = content.html.find('span.currency plus currency-module_currency_29IIm', first=True)
    Availability = content.html.find('div.cell shrink stock-availability-status', first=True)
    Next_Price = content.html.find('span.currency plus currency-module_currency_29IIm', first=True)
    Next_Available_Availability = content.html.find('div.cell shrink stock-availability-status', first=True)

    if content.html.find('div.cell shrink stock-availability-status'):
        stock = 'in stock'
    else:
        stock = 'out of stock'
    assert isinstance(Next_Price, object)
    print(price, Availability, Next_Available_Availability, Next_Price)
