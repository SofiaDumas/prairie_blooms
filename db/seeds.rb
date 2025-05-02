# This file should ensure the existence of records required to run the application in every
# environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in
# every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database
# with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.destroy_all

flowers = Category.find_or_create_by!(category_name: "Flowers")
herbs = Category.find_or_create_by!(category_name: "Herbs")
succulents = Category.find_or_create_by!(category_name: "Succulents")
herbaceous = Category.find_or_create_by!(category_name: "Herbaceous")
trees = Category.find_or_create_by!(category_name: "Trees")
supplies = Category.find_or_create_by!(category_name: "Supplies")

# Create products under flowers category
Product.create!([
                  {
                    product_name:              "Sunflower Delight",
                    description:               "Bright and bold sunflowers",
                    stock_quantity:            50,
                    category:                  flowers,
                    product_prices_attributes: [{ price:          2.75,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Rose Romance",
                    description:               "Elegant red roses bouquet",
                    stock_quantity:            40,
                    category:                  flowers,
                    product_prices_attributes: [{ price:          3.25,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Tulip Sunrise",
                    description:               "Mixed tulips in spring colors",
                    stock_quantity:            30,
                    category:                  flowers,
                    product_prices_attributes: [{ price:          2.50,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Daisy Fresh",
                    description:               "White daisies bouquet",
                    stock_quantity:            25,
                    category:                  flowers,
                    product_prices_attributes: [{ price:          1.50,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Peony Passion",
                    description:               "Soft pink peonies",
                    stock_quantity:            20,
                    category:                  flowers,
                    product_prices_attributes: [{ price:          6.50,
                                                  effective_date: Time.zone.today }]
                  }
                ])

# Create products under herbs category
Product.create!([
                  {
                    product_name:              "Basil Plant",
                    description:               "Fresh sweet basil",
                    stock_quantity:            60,
                    category:                  herbs,
                    product_prices_attributes: [{ price:          10,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Mint Starter",
                    description:               "Cooling mint herb",
                    stock_quantity:            55,
                    category:                  herbs,
                    product_prices_attributes: [{ price:          5,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Parsley Pot",
                    description:               "Curly leaf parsley",
                    stock_quantity:            40,
                    category:                  herbs,
                    product_prices_attributes: [{ price:          4.75,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Oregano Leaves",
                    description:               "Savory oregano plant",
                    stock_quantity:            35,
                    category:                  herbs,
                    product_prices_attributes: [{ price:          6.25,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Thyme Tray",
                    description:               "Earthy thyme herb",
                    stock_quantity:            45,
                    category:                  herbs,
                    product_prices_attributes: [{ price:          1.50,
                                                  effective_date: Time.zone.today }]
                  }
                ])

# Create products under succulents category
Product.create!([
                  {
                    product_name:              "Cactus Combo",
                    description:               "Three types of easy-care cacti",
                    stock_quantity:            50,
                    category:                  succulents,
                    product_prices_attributes: [{ price:          7.85,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Aloe Vera Pot",
                    description:               "Healing aloe vera plant",
                    stock_quantity:            30,
                    category:                  succulents,
                    product_prices_attributes: [{ price:          10.25,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Echeveria Charm",
                    description:               "Symmetrical rosette succulent",
                    stock_quantity:            25,
                    category:                  succulents,
                    product_prices_attributes: [{ price:          5,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Jade Plant",
                    description:               "Money plant, good luck symbol",
                    stock_quantity:            40,
                    category:                  succulents,
                    product_prices_attributes: [{ price:          6.40,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Zebra Haworthia",
                    description:               "Striped mini succulent",
                    stock_quantity:            35,
                    category:                  succulents,
                    product_prices_attributes: [{ price:          10.25,
                                                  effective_date: Time.zone.today }]
                  }
                ])

# Create products under herbaceous category
Product.create!([
                  {
                    product_name:              "Daylily Mix",
                    description:               "Mixed color daylilies",
                    stock_quantity:            20,
                    category:                  herbaceous,
                    product_prices_attributes: [{ price:          5.35,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Coneflower Blend",
                    description:               "Purple coneflowers for pollinators",
                    stock_quantity:            30,
                    category:                  herbaceous,
                    product_prices_attributes: [{ price:          4.25,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Hosta Heaven",
                    description:               "Shade-loving hosta plants",
                    stock_quantity:            25,
                    category:                  herbaceous,
                    product_prices_attributes: [{ price:          8.05,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Astilbe Dream",
                    description:               "Feathery astilbe blooms",
                    stock_quantity:            20,
                    category:                  herbaceous,
                    product_prices_attributes: [{ price:          4.65,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Bee Balm",
                    description:               "Attracts bees and butterflies",
                    stock_quantity:            35,
                    category:                  herbaceous,
                    product_prices_attributes: [{ price:          10.25,
                                                  effective_date: Time.zone.today }]
                  }
                ])

# Create products under trees category
Product.create!([
                  {
                    product_name:              "Maple Tree",
                    description:               "Fast-growing native tree",
                    stock_quantity:            15,
                    category:                  trees,
                    product_prices_attributes: [{ price:          20,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Crabapple Tree",
                    description:               "Flowering ornamental tree",
                    stock_quantity:            10,
                    category:                  trees,
                    product_prices_attributes: [{ price:          22,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Spruce Sapling",
                    description:               "Classic evergreen tree",
                    stock_quantity:            20,
                    category:                  trees,
                    product_prices_attributes: [{ price:          15,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Cherry Blossom",
                    description:               "Beautiful spring blossoms",
                    stock_quantity:            12,
                    category:                  trees,
                    product_prices_attributes: [{ price:          17,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Birch Tree",
                    description:               "White barked shade tree",
                    stock_quantity:            18,
                    category:                  trees,
                    product_prices_attributes: [{ price:          25,
                                                  effective_date: Time.zone.today }]
                  }
                ])

# Create products under supplies category
Product.create!([
                  {
                    product_name:              "Potting Soil",
                    description:               "Rich organic soil mix",
                    stock_quantity:            100,
                    category:                  supplies,
                    product_prices_attributes: [{ price:          12.99,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Gardening Gloves",
                    description:               "Durable and comfortable gloves",
                    stock_quantity:            80,
                    category:                  supplies,
                    product_prices_attributes: [{ price:          7.99,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Watering Can",
                    description:               "Metal 2L watering can",
                    stock_quantity:            70,
                    category:                  supplies,
                    product_prices_attributes: [{ price:          15.99,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Hand Tools Set",
                    description:               "Mini rake, shovel, and pruner",
                    stock_quantity:            65,
                    category:                  supplies,
                    product_prices_attributes: [{ price:          18.49,
                                                  effective_date: Time.zone.today }]
                  },
                  {
                    product_name:              "Seed Starter Kit",
                    description:               "Tray and dome for seedlings",
                    stock_quantity:            90,
                    category:                  supplies,
                    product_prices_attributes: [{ price:          11.49,
                                                  effective_date: Time.zone.today }]
                  }
                ])
