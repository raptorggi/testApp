# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "admin", email: "admin", password: "12345678", admin: true)

4.times do |i|
  Page.create(title: "Page #{i}", text: "text for Page #{i}")
end

Category.create(name: "Смартфоны и смарт-часы", description: "")
Category.create(name: "Компьютеры и периферия", description: "")
Category.create(name: "Ноутбуки и планшеты", description: "")
Category.create(name: "Телевизоры и медиа", description: "")

Category.create([{name: "Смартфоны", description: ""}, {name: "Смарт-часы", description: ""}]) do |c| 
  c.parent_id = Category.find_by(name: 'Смартфоны и смарт-часы').id
end
Category.create([{name: "Компьютерные системы", description: ""}, {name: "Периферия", description: ""}]) do |c| 
  c.parent_id = Category.find_by(name: 'Компьютеры и периферия').id
end

category = Category.find_by name: 'Смартфоны'
product = category.products.create(name: "Смартфон Sony Xperia XZ2 Compact DS 64 ГБ серебристый", description: "Смартфон Sony Xperia XZ2 Compact DS создан для захватывающих развлечений. Смотрите фильмы в HDR и снимайте собственные видеоролики в невероятном качестве 4K HDR: с этим устройством весь мир у вас на ладони. Дизайн 5-дюймового Sony Xperia XZ2 Compact DS продуман до малейших мелочей. Этот элегантный смартфон с прочным матовым корпусом и закругленными краями легко помещается в карман.
                                                                                                      Представляем первый в мире смартфон с поддержкой видеозаписи в 4K HDR. Снимайте более красочные, контрастные и детализированные ролики в качестве, достойном кинематографа. Модуль передовой камеры Motion Eye оборудован матрицей с памятью и снимает поразительно реалистичные фото и видео. Эффектная сверхзамедленная съемка в качестве Full HD с частотой 960 кадров/с позволяет запечатлеть движения и моменты, которые человеческий глаз уловить не в состоянии. Основная и фронтальная камеры Xperia XZ2 Compact оснащены технологией 3D-сканирования. Сканируйте людей и предметы, превращая их в 3D-модели, которые можно распечатать или разместить в социальных сетях.", price: 49999)
img = File.open(File.join(Rails.root, '/public/img/dev/products/sony_xz2.jpg'))
product.update image: img

product = category.products.create(name: "Смартфон Samsung Galaxy S9 64 ГБ черный", description: "Смартфон Samsung Galaxy S9 - это революционное устройство, поразившее миллионы пользователей своим уникальным функционалом, ворвавшись на мировой рынок в 2018 году. Корпус данной модели сочетает в себе элементы из металла и высокопрочного стекла, благодаря чему она получила степень защиты IP68. Черное оформление является неизменной классикой всех времен. На передней панели смартфона располагается 5.8-дюймовый экран, созданный по технологии Super AMOLED. Он занимает собой практически всю площадь лицевой стороны, благодаря чему эту модель с уверенностью можно причислить к безрамочным.", price: 59999)
img = File.open(File.join(Rails.root, '/public/img/dev/products/samsung_s9.jpg'))
product.update image: img

product = category.products.create(name: "Смартфон Huawei P20 128 ГБ синий", description: "Смартфон Huawei P20 – оптимальный вариант для любителей фотосъемки, ведь он обладает основной двойной камерой на 12+20 и фронтальной на 24 Мп, так что делаете ли вы селфи или же запечатлеваете окружающие виды, вы получите снимки безупречного качества, за которые отвечают и оптическая стабилизация и сенсорная фокусировка. Кроме того, смартфон станет вашим надежным спутником в дальней дороге, поскольку обладает GPS и ГЛОНАСС, а также системой Android Pay, которая позволит применять бесконтактные технологии оплаты, что очень удобно.", price: 44999)
img = File.open(File.join(Rails.root, '/public/img/dev/products/hui_p20.jpg'))
product.update image: img
