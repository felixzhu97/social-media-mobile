// 不使用类型定义，避免类型错误
// import { Product as SharedProduct } from 'shared';

export const sportsOutdoorsProducts = [
  // 运动户外 - 原有产品
  {
    name: '瑜伽垫防滑加厚',
    description: 'TPE环保材质，双面防滑，加厚8mm，回弹性好，耐用易清洁，附赠背带，多色可选。',
    price: 129.0,
    originalPrice: 159.0,
    image: 'https://images.unsplash.com/photo-1592432678016-e910b452f9a2?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 200,
    rating: 4.5,
    reviewCount: 278,
    inStock: true,
  },
  {
    name: '特步跑步鞋气垫减震',
    description: '轻量化设计，气垫减震，透气网面，防滑耐磨大底，适合日常跑步和健身。',
    price: 239.0,
    originalPrice: 299.0,
    image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 150,
    rating: 4.3,
    reviewCount: 196,
    inStock: true,
  },
  {
    name: '迪卡侬帐篷户外露营',
    description: '2-3人双层帐篷，防风防雨，搭建简单，通风透气，适合野营和户外活动。',
    price: 399.0,
    originalPrice: 499.0,
    image: 'https://images.unsplash.com/photo-1504280390367-361c6d9f38f4?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 60,
    rating: 4.6,
    reviewCount: 124,
    inStock: true,
  },
  {
    name: '探路者登山包',
    description: '40L大容量，耐磨防泼水，科学减负系统，多功能分区，适合登山徒步和旅行。',
    price: 329.0,
    originalPrice: 399.0,
    image: 'https://images.unsplash.com/photo-1596207891316-23851be3cc20?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 80,
    rating: 4.5,
    reviewCount: 157,
    inStock: true,
  },

  // 运动户外 - 健身器材
  {
    name: '哑铃套装可调节',
    description: '环保包胶材质，防滑耐用，重量可调节，适合家庭健身，锻炼肌肉和力量训练。',
    price: 299.0,
    originalPrice: 399.0,
    image: 'https://images.unsplash.com/photo-1584735935682-2f2b69dff9d2?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 120,
    rating: 4.6,
    reviewCount: 215,
    inStock: true,
  },
  {
    name: '多功能健身仰卧板',
    description: '高密度海绵垫，承重300kg，多角度调节，折叠设计，适合家庭腹肌训练和全身锻炼。',
    price: 499.0,
    originalPrice: 599.0,
    image: 'https://images.unsplash.com/photo-1599058917765-a780eda07a3e?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 75,
    rating: 4.5,
    reviewCount: 168,
    inStock: true,
  },
  {
    name: '弹力带健身套装',
    description: '5根不同阻力级别，天然乳胶材质，附带把手和脚环，适合全身肌肉训练和瑜伽拉伸。',
    price: 89.0,
    originalPrice: 129.0,
    image: 'https://images.unsplash.com/photo-1540497077202-7c8a3999166f?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 150,
    rating: 4.4,
    reviewCount: 198,
    inStock: true,
  },
  {
    name: '跳绳健身专业',
    description: '钢丝绳可调节长度，轴承防缠绕设计，舒适防滑手柄，适合有氧训练和减脂健身。',
    price: 59.0,
    originalPrice: 79.0,
    image: 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 200,
    rating: 4.3,
    reviewCount: 256,
    inStock: true,
  },
  {
    name: '俯卧撑支架',
    description: 'S型设计，防滑手柄，承重150kg，稳固耐用，减轻手腕压力，适合家庭和健身房使用。',
    price: 79.0,
    originalPrice: 99.0,
    image: 'https://images.unsplash.com/photo-1598289431512-b91a5feae595?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 140,
    rating: 4.5,
    reviewCount: 186,
    inStock: true,
  },

  // 运动户外 - 瑜伽用品
  {
    name: '瑜伽砖套装',
    description: 'EVA环保材质，高密度防滑，轻便耐用，适合初学者辅助练习，提高平衡和灵活性。',
    price: 69.0,
    originalPrice: 89.0,
    image: 'https://images.unsplash.com/photo-1593164842264-e2e7e3c11f15?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 120,
    rating: 4.6,
    reviewCount: 215,
    inStock: true,
  },
  {
    name: '瑜伽伸展带',
    description: '高弹力棉质材料，柔软耐用，多档扣环设计，适合拉伸训练和柔韧性提升。',
    price: 49.0,
    originalPrice: 69.0,
    image: 'https://images.unsplash.com/photo-1518611012118-696072aa579a?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 150,
    rating: 4.4,
    reviewCount: 186,
    inStock: true,
  },
  {
    name: '瑜伽球健身球',
    description: 'PVC环保材质，防爆加厚，多尺寸可选，附赠打气筒，适合平衡训练和核心锻炼。',
    price: 89.0,
    originalPrice: 119.0,
    image: 'https://images.unsplash.com/photo-1516481265257-62b701357974?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 85,
    rating: 4.5,
    reviewCount: 156,
    inStock: true,
  },
  {
    name: '瑜伽服套装女',
    description: '莫代尔面料，柔软舒适，高弹透气，四向拉伸，适合瑜伽、普拉提和日常休闲穿着。',
    price: 199.0,
    originalPrice: 249.0,
    image: 'https://images.unsplash.com/photo-1518310383802-640c2de311b2?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 90,
    rating: 4.7,
    reviewCount: 178,
    inStock: true,
  },
  {
    name: '瑜伽轮后弯神器',
    description: 'TPE包裹ABS材质，防滑耐用，承重200kg，缓解背部疼痛，提高脊柱灵活性。',
    price: 129.0,
    originalPrice: 159.0,
    image: 'https://images.unsplash.com/photo-1517637382994-f02da38c6728?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 75,
    rating: 4.6,
    reviewCount: 132,
    inStock: true,
  },

  // 运动户外 - 户外装备
  {
    name: '户外便携折叠椅',
    description: '铝合金框架，600D牛津布面料，承重120kg，便携收纳，适合野营、钓鱼和户外活动。',
    price: 129.0,
    originalPrice: 169.0,
    image: 'https://images.unsplash.com/photo-1531766230389-a803c70d4b74?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 90,
    rating: 4.5,
    reviewCount: 167,
    inStock: true,
  },
  {
    name: '户外多功能工具刀',
    description: '不锈钢材质，14种功能组合，便携小巧，适合户外探险、camping和紧急情况使用。',
    price: 89.0,
    originalPrice: 119.0,
    image: 'https://images.unsplash.com/photo-1473188588951-666fce8e7f72?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 100,
    rating: 4.7,
    reviewCount: 143,
    inStock: true,
  },
  {
    name: '便携式户外炉具',
    description: '铝合金材质，轻巧便携，高热效率，防风设计，适合户外野营烹饪和应急使用。',
    price: 199.0,
    originalPrice: 249.0,
    image: 'https://images.unsplash.com/photo-1504851149312-7a075b496cc7?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 65,
    rating: 4.6,
    reviewCount: 118,
    inStock: true,
  },
  {
    name: '户外睡袋保暖',
    description: '防水涤纶面料，中空棉填充，保暖舒适，可拼接双人使用，适合户外露营和旅行。',
    price: 249.0,
    originalPrice: 299.0,
    image: 'https://images.unsplash.com/photo-1508873535684-277a3cbcc4e8?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 75,
    rating: 4.8,
    reviewCount: 136,
    inStock: true,
  },
  {
    name: '户外防水LED头灯',
    description: '超亮LED灯珠，多种照明模式，防水防摔，USB充电，适合夜间户外活动和应急照明。',
    price: 89.0,
    originalPrice: 119.0,
    image: 'https://images.unsplash.com/photo-1504593811423-6dd665756c11?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 110,
    rating: 4.5,
    reviewCount: 186,
    inStock: true,
  },

  // 运动户外 - 跑步骑行
  {
    name: '专业运动计步手环',
    description: 'AMOLED彩屏显示，心率血氧监测，50米防水，14天续航，多种运动模式，实时数据追踪。',
    price: 199.0,
    originalPrice: 249.0,
    image: 'https://images.unsplash.com/photo-1575311373937-040b8e97429e?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 85,
    rating: 4.7,
    reviewCount: 213,
    inStock: true,
  },
  {
    name: '运动腰包跑步手机包',
    description: '轻量防水面料，贴身设计，多口袋收纳，反光条夜间安全，适合跑步和户外运动。',
    price: 59.0,
    originalPrice: 79.0,
    image: 'https://images.unsplash.com/photo-1571731956672-f2b94d7dd0cb?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 120,
    rating: 4.4,
    reviewCount: 186,
    inStock: true,
  },
  {
    name: '折叠自行车',
    description: '铝合金车架，20寸车轮，21速变速系统，前后碟刹，快速折叠设计，适合通勤和短途旅行。',
    price: 1299.0,
    originalPrice: 1599.0,
    image: 'https://images.unsplash.com/photo-1507035895480-2b3156c31fc8?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 40,
    rating: 4.6,
    reviewCount: 98,
    inStock: true,
  },
  {
    name: '骑行头盔一体成型',
    description: 'EPS缓冲层，PC外壳，多孔通风设计，可调节头围，轻量舒适，保障骑行安全。',
    price: 159.0,
    originalPrice: 199.0,
    image: 'https://images.unsplash.com/photo-1505515888595-332d2a8a09e8?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 75,
    rating: 4.5,
    reviewCount: 132,
    inStock: true,
  },
  {
    name: '运动蓝牙耳机',
    description: '防水防汗，低延迟高音质，入耳稳固不易掉，长续航，降噪通话，适合运动和日常使用。',
    price: 199.0,
    originalPrice: 249.0,
    image: 'https://images.unsplash.com/photo-1606741965509-017b2a0cddb7?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 95,
    rating: 4.7,
    reviewCount: 178,
    inStock: true,
  },

  // 运动户外 - 游泳装备
  {
    name: '专业游泳眼镜',
    description: '防雾防水，硅胶密封圈，UV防护，可调节松紧带，适合成人训练和休闲游泳。',
    price: 89.0,
    originalPrice: 119.0,
    image: 'https://images.unsplash.com/photo-1599407384144-1a6e7fb8c4d2?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 120,
    rating: 4.6,
    reviewCount: 186,
    inStock: true,
  },
  {
    name: '专业连体泳衣女',
    description: '高弹力面料，抗氯耐用，修身显瘦，腿位高剪裁，适合游泳训练和水上运动。',
    price: 199.0,
    originalPrice: 249.0,
    image: 'https://images.unsplash.com/photo-1560089-8a0f14c5a954?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 85,
    rating: 4.5,
    reviewCount: 154,
    inStock: true,
  },
  {
    name: '游泳训练用划水板',
    description: 'EVA环保材质，轻量浮力好，耐用不易变形，提高上肢力量，适合初学者和专业训练。',
    price: 69.0,
    originalPrice: 89.0,
    image: 'https://images.unsplash.com/photo-1530549387789-4c1017266635?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 100,
    rating: 4.4,
    reviewCount: 132,
    inStock: true,
  },
  {
    name: '防水游泳包干湿分离',
    description: '防水尼龙面料，干湿分离设计，大容量收纳，便携轻巧，适合游泳和户外水上活动。',
    price: 129.0,
    originalPrice: 159.0,
    image: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 75,
    rating: 4.6,
    reviewCount: 115,
    inStock: true,
  },
  {
    name: '专业游泳帽',
    description: '优质硅胶材质，高弹力防水，减少水阻，舒适贴合，适合长发和短发人士使用。',
    price: 49.0,
    originalPrice: 69.0,
    image: 'https://images.unsplash.com/photo-1572116469696-31de0f17cc34?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 140,
    rating: 4.3,
    reviewCount: 168,
    inStock: true,
  },

  // 运动户外 - 体育用品
  {
    name: '专业篮球室内外通用',
    description: '高级合成皮革，防滑耐磨，标准7号球，适合室内外场地和各种气候条件下使用。',
    price: 159.0,
    originalPrice: 199.0,
    image: 'https://images.unsplash.com/photo-1519861531473-9200262188bf?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 90,
    rating: 4.7,
    reviewCount: 156,
    inStock: true,
  },
  {
    name: '羽毛球拍套装',
    description: '全碳素材质，超轻高强度，减震手感好，附赠球和拍套，适合初学者和进阶玩家。',
    price: 229.0,
    originalPrice: 279.0,
    image: 'https://images.unsplash.com/photo-1617744316788-6cdef963b3ad?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 75,
    rating: 4.6,
    reviewCount: 134,
    inStock: true,
  },
  {
    name: '乒乓球拍专业比赛',
    description: '纯木底板，高弹性胶皮，快攻结合弧圈型，正反面均衡，适合进阶选手和专业比赛。',
    price: 299.0,
    originalPrice: 359.0,
    image: 'https://images.unsplash.com/photo-1609710228159-0fa9bd7c0827?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 60,
    rating: 4.8,
    reviewCount: 98,
    inStock: true,
  },
  {
    name: '足球5号标准',
    description: 'PU合成皮革，手工缝制，防水耐磨，标准5号球，适合草地、人造草皮和室内场地。',
    price: 149.0,
    originalPrice: 189.0,
    image: 'https://images.unsplash.com/photo-1614632537423-1e6c2e7e0aab?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 85,
    rating: 4.5,
    reviewCount: 142,
    inStock: true,
  },
  {
    name: '专业网球拍碳素',
    description: '碳纤维材质，减震设计，平衡良好，适合初学者和中级选手，附赠拍套和网球。',
    price: 399.0,
    originalPrice: 499.0,
    image: 'https://images.unsplash.com/photo-1617713964959-d9a36bbc7b52?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 55,
    rating: 4.7,
    reviewCount: 87,
    inStock: true,
  },

  // 运动户外 - 滑雪装备
  {
    name: '滑雪板套装专业级',
    description: '全碳纤维板身，双翘板设计，高速边刃，附赠固定器，适合初学者到中级滑雪爱好者。',
    price: 2999.0,
    originalPrice: 3599.0,
    image: 'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 30,
    rating: 4.8,
    reviewCount: 76,
    inStock: true,
  },
  {
    name: '防风保暖滑雪服套装',
    description: '三层复合面料，10000mm防水透气，保暖棉填充，多口袋设计，适合各种雪地活动。',
    price: 899.0,
    originalPrice: 1199.0,
    image: 'https://images.unsplash.com/photo-1605540436563-5bca919ee766?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 50,
    rating: 4.7,
    reviewCount: 98,
    inStock: true,
  },
  {
    name: '滑雪护目镜防雾',
    description: '球面双层镜片，防雾防UV，宽视野设计，可配合近视眼镜使用，适合各种雪况和天气。',
    price: 299.0,
    originalPrice: 399.0,
    image: 'https://images.unsplash.com/photo-1607604514313-301cbaaf97e5?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 65,
    rating: 4.6,
    reviewCount: 112,
    inStock: true,
  },
  {
    name: '滑雪手套防水保暖',
    description: '三层复合材质，防水透气，加厚保暖，触屏设计，防滑掌心，适合滑雪和各种冬季运动。',
    price: 169.0,
    originalPrice: 219.0,
    image: 'https://images.unsplash.com/photo-1547868399-642d061989b2?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 80,
    rating: 4.5,
    reviewCount: 134,
    inStock: true,
  },
  {
    name: '滑雪头盔一体成型',
    description: 'ABS外壳，EPS缓冲层，可调节通风孔，舒适内衬，可搭配护目镜使用，保障滑雪安全。',
    price: 399.0,
    originalPrice: 499.0,
    image: 'https://images.unsplash.com/photo-1542124292-70d83293d89a?q=80&w=1000',
    category: 'Sports & Outdoors',
    stock: 45,
    rating: 4.7,
    reviewCount: 87,
    inStock: true,
  },
];
