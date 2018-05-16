# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

makeup = Category.create(label: 'Make up',  state: 'published')
face = Category.create(label: 'Face', state: 'published', parent: makeup)
eyes = Category.create(label: 'Eyes', state: 'published', parent: makeup)
nails = Category.create(label: 'Nails', state: 'published', parent: makeup)
contour = Category.create(label: 'Contour', state: 'published', parent: face)
blush = Category.create(label: 'Blush', state: 'published', parent: face)
faceprimer = Category.create(label: 'Face Primer', state: 'discontinued', parent: face)
eyeliner = Category.create(label: 'Eyeliner', state: 'published', parent: eyes)
mascara = Category.create(label: 'Mascara', state: 'draft', parent: eyes)

matchstix = Product.create(name: 'Match Stix', state: 'published', description: 'A magnetised makeup stick in a longwear, light-as-air matte formula to conceal, correct, contour, and touch up.', category: contour)
bornthiswayconcealer = Product.create(name: 'Born This Way Radiant Concealer', state: 'draft', description: 'An oil-free concealer that minimises the appearance of imperfections while leaving skin with natural-looking radiance.', category: contour)
matchstix_ivory = Variant.create(name: 'Ivory', sold_out: false, under_sale: false, price: 3700, product: matchstix)
matchstix_maple = Variant.create(name: 'Maple', sold_out: false, under_sale: false, price: 3700, product: matchstix)
matchstix_maple = Variant.create(name: 'Caramel', sold_out: true, under_sale: false, price: 3700, product: matchstix)
bornthiswayconcealer_fair = Variant.create(name: 'Fair', sold_out: false, under_sale: false, price: 4400, product: bornthiswayconcealer)
bornthiswayconcealer_tan = Variant.create(name: 'Tan', sold_out: false, under_sale: false, price: 4400, product: bornthiswayconcealer)

tarteblush = Product.create(name: 'Tarte Amazonian Clay 12-hour Blush', state: 'published', description: 'Infused with natural clay harvested from the banks of the Amazon River and naturally baked by the sun, this nutrient-rich blush benefits all skin types for a fade-free flawless finish that lasts an amazing 12 hours.', category: blush)
tarteblush_dazzled = Variant.create(name: 'Dazzled', sold_out: false, under_sale: true, price: 4700, sale_price: 4000, product: tarteblush)

porefessional = Product.create(name: 'Benefit Porefessional Face Primer', state:'published', description: 'The POREfessional Face Primer is a lightweight balm that quickly minimizes the appearance of pores and fine lines for smoother-than-smooth skin.', category: faceprimer)
porefessional_22ml = Variant.create(name: '22ml', sold_out: false, under_sale: false, price: 5400, product: porefessional )
porefessional_44ml = Variant.create(name: '44ml', sold_out: false, under_sale: false, price: 9100, product: porefessional)

rocknroller = Product.create(name: 'Nudestix Rock N Roller Eyeliner', state: 'published', description: 'A revolutionary rollerball eyeliner ink that glides on easily, straight, and smooth.', category: eyeliner)
rocknroller_bronze = Variant.create(name: 'Bronze', sold_out: false, under_sale: false, price: 3700, product: rocknroller)

rollerlashmini = Product.create(name: 'Benefit Cosmetics Roller Lash Mascara Mini', state: 'published', description: 'Inspired by hair rollers, this super-curling and lifting mascara creates a sexy, wide-eyed look all day.', category: mascara)
rollerlashmini_v = Variant.create(name: 'Benefit Cosmetics Roller Lash Mascara Mini', sold_out:false, under_sale: false, price: 2100, product: rollerlashmini)

skincare = Category.create(label: 'Skin Care', state: 'published')
masksandtreatment = Category.create(label: 'Masks and Treatments', state: 'published', parent: skincare)
moisturizer = Category.create(label: 'Moisturizer', state: 'published', parent: skincare)
masks = Category.create(label: 'Masks', state: 'published', parent: masksandtreatment)
peel = Category.create(label: 'Masks', state: 'published', parent: masksandtreatment)
faceoil = Category.create(label: 'Face Oil', state:'discontinued', parent: masksandtreatment)
daymoisturizer = Category.create(label: 'Day Moisturizer', state: 'published', parent: moisturizer)
nightcream = Category.create(label: 'Night Cream', state: 'published', parent: moisturizer)

hair = Category.create(label: 'Hair', state:'discontinued')
styling = Category.create(label: 'Styling', state: 'published', parent: hair)
treatment = Category.create(label: 'Treatment', state: 'published', parent: hair)
hairspray = Category.create(label: 'Hair Spray', state: 'published', parent: styling)
texturizer = Category.create(label: 'Texturizer', state: 'published', parent: styling)
