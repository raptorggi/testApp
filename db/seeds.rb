if Rails.env.development?
  User.create(name: 'user', last_name: 'test', phone: '+70000000000', email: 'user@example.com', password: 'password', password_confirmation: 'password')

  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

  4.times do |i|
    Page.create(title: "Page #{i}", text: "text for Page #{i}")
  end

  Category.create(name_ru: 'Смартфоны и смарт-часы', name_en: 'Smartphones and smart watches', description: '')
  Category.create(name_ru: 'Компьютеры и периферия', name_en: 'Computers and Peripherals', description: '')
  Category.create(name_ru: 'Ноутбуки и планшеты', name_en: 'Laptops & Tablets', description: '')
  Category.create(name_ru: 'Телевизоры и медиа', name_en: 'TV and Media', description: '')
  Category.create([{ name_ru: 'Смартфоны', name_en: 'Smartphones', description: '' }, { name_ru: 'Смарт-часы', name_en: 'Smart watches', description: '' }]) do |c|
    c.parent_id = Category.find_by(name_ru: 'Смартфоны и смарт-часы').id
  end
  Category.create([{ name_ru: 'Компьютерные системы', name_en: 'Computer systems', description: '' }, { name_ru: 'Периферия', name_en: 'Peripherals', description: '' }]) do |c|
    c.parent_id = Category.find_by(name_ru: 'Компьютеры и периферия').id
  end

  category = Category.find_by name_ru: 'Смартфоны'

  product = category.products.create(name_ru: 'Sony Xperia XZ2 Compact DS 64 ГБ серебристый', name_en: 'Sony Xperia XZ2 Compact DS 64 ГБ silver', quantity: 15, reserved: 0, description: 'Смартфон Sony Xperia XZ2 Compact DS создан для захватывающих развлечений. Смотрите фильмы в HDR и снимайте собственные видеоролики в невероятном качестве 4K HDR: с этим устройством весь мир у вас на ладони. Дизайн 5-дюймового Sony Xperia XZ2 Compact DS продуман до малейших мелочей. Этот элегантный смартфон с прочным матовым корпусом и закругленными краями легко помещается в карман. Представляем первый в мире смартфон с поддержкой видеозаписи в 4K HDR. Снимайте более красочные, контрастные и детализированные ролики в качестве, достойном кинематографа. Модуль передовой камеры Motion Eye оборудован матрицей с памятью и снимает поразительно реалистичные фото и видео. Эффектная сверхзамедленная съемка в качестве Full HD с частотой 960 кадров/с позволяет запечатлеть движения и моменты, которые человеческий глаз уловить не в состоянии. Основная и фронтальная камеры Xperia XZ2 Compact оснащены технологией 3D-сканирования. Сканируйте людей и предметы, превращая их в 3D-модели, которые можно распечатать или разместить в социальных сетях.', price: 49_999)
  img = File.open(File.join(Rails.root, '/public/img/dev/products/sony_xz2.jpg'))
  product.update image: img

  product = category.products.create(name_ru: 'Samsung Galaxy S9 64 ГБ черный', name_en: 'Samsung Galaxy S9 64 ГБ black', quantity: 5, reserved: 0, description: 'Смартфон Samsung Galaxy S9 - это революционное устройство, поразившее миллионы пользователей своим уникальным функционалом, ворвавшись на мировой рынок в 2018 году. Корпус данной модели сочетает в себе элементы из металла и высокопрочного стекла, благодаря чему она получила степень защиты IP68. Черное оформление является неизменной классикой всех времен. На передней панели смартфона располагается 5.8-дюймовый экран, созданный по технологии Super AMOLED. Он занимает собой практически всю площадь лицевой стороны, благодаря чему эту модель с уверенностью можно причислить к безрамочным.', price: 59_999)
  img = File.open(File.join(Rails.root, '/public/img/dev/products/samsung_s9.jpg'))
  product.update image: img

  product = category.products.create(name_ru: 'Huawei P20 128 ГБ синий', name_en: 'Huawei P20 128 ГБ blue', quantity: 0, reserved: 0, description: 'Смартфон Huawei P20 – оптимальный вариант для любителей фотосъемки, ведь он обладает основной двойной камерой на 12+20 и фронтальной на 24 Мп, так что делаете ли вы селфи или же запечатлеваете окружающие виды, вы получите снимки безупречного качества, за которые отвечают и оптическая стабилизация и сенсорная фокусировка. Кроме того, смартфон станет вашим надежным спутником в дальней дороге, поскольку обладает GPS и ГЛОНАСС, а также системой Android Pay, которая позволит применять бесконтактные технологии оплаты, что очень удобно.', price: 44_999)
  img = File.open(File.join(Rails.root, '/public/img/dev/products/hui_p20.jpg'))
  product.update image: img
end