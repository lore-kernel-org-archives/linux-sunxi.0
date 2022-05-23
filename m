Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEC036C
	for <linux-sunxi@lists.linux.dev>; Mon, 23 May 2022 05:28:16 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id t6so19639792wra.4
        for <linux-sunxi@lists.linux.dev>; Sun, 22 May 2022 22:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9uMuLZ+WHHh5WrmFB7JGvdrkZLB4YOBUOPeV4QL7yzg=;
        b=Y7kqAoylA+C6m4MPwSA1YrcUGwM5+kRVXDhOpG5OUxWIJDFnBKuVppwLcraDZBlmau
         LjKXI0nLbe+RKNA6nAJhuLYnXMdAUKpGtIdVzyeDMvWhkYW27wCNe/Us8RWXHLHT4eFH
         M9So1Iom6hJn88cvubjLP9h1BZHr/wC5YhtxB69uMa3sl7yewtvD584E7joMhnPQJZwe
         mhH+j7YGGYZYGJtI9SYQoZxp30voOt8m6e3cXBydM/B54I9+bkzkHXmefoySwmYiFb4O
         UM8f1/QWB8VRoNLefi0UUGG2cdezs+gIpD/jgnWVy6RceLWCpffPXSl93rCbm+tjDWrq
         LeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9uMuLZ+WHHh5WrmFB7JGvdrkZLB4YOBUOPeV4QL7yzg=;
        b=VQ323U69YrdE5gndR09ZSxC4+Uj+KdiqYjh9L+WNsaQNxcM4zffRq6GYT8ks8u4o6M
         XUOdCM6W1rWgpgkkiVZnS/tneGXmhrvD+UJQoixqBZrwFVHRPZWMNiIp66hWxE/E9Y1U
         3kIuo6i8196dgPpoyW5t42LryRkw6wTQOrj8s70+8+TJdatpJjSllQ269ZTezHy/B0Z7
         S3eFgUJlKEU8HJCIFnK/jUASRoHlw9hTFpJAsRPJqU1xUM42uODlzOnBNs4GVZ+t41lZ
         BFGwcXTMaxMMx5lzHiVN0wtNZpzDCGfwSzj5TcraCQpkXHPLxej0O/ITV/qjgHOibe/+
         AyKA==
X-Gm-Message-State: AOAM532RZyIL6vT4enNFya3Ae8KRk6ENEN2WM5s7EZZypDPDQGi3ZccK
	6euATbDGC22YIQan/6RuFty7CQ==
X-Google-Smtp-Source: ABdhPJwqOjOWSF8b13h1bIXClf8iN5Rml8F4bhr0+MrnoZAuILGzkXIwWfoK9xvvCG7fE0z6uPVXbw==
X-Received: by 2002:adf:dd8a:0:b0:20d:ff7:ce01 with SMTP id x10-20020adfdd8a000000b0020d0ff7ce01mr17371264wrl.242.1653283694762;
        Sun, 22 May 2022 22:28:14 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id h2-20020a1ccc02000000b0039466988f6csm7802414wmb.31.2022.05.22.22.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 22:28:14 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: andrew@lunn.ch,
	broonie@kernel.org,
	calvin.johnson@oss.nxp.com,
	davem@davemloft.net,
	edumazet@google.com,
	hkallweit1@gmail.com,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linux@armlinux.org.uk,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	samuel@sholland.org,
	wens@csie.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 0/3] arm64: add ethernet to orange pi 3
Date: Mon, 23 May 2022 05:28:04 +0000
Message-Id: <20220523052807.4044800-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello

2 sunxi board still does not have ethernet working, orangepi 1+ and
orangepi 3.
This is due to the fact thoses boards have a PHY which need 2 regulators.

A first attempt by Ondřej Jirman was made to support them was made by adding support in
stmmac driver:
https://lore.kernel.org/lkml/20190820145343.29108-6-megous@megous.com/
Proposal rejected, since regulators need to be handled by the PHY core.

My first tentative was to just add handling of phy and phy-io in
phy-core:
https://lore.kernel.org/netdev/20220509074857.195302-7-clabbe@baylibre.com/T/
But having hard-coded phy names was rejected.

Second tentative tryed the same path than clocks and clock-names for
regulators.
https://lore.kernel.org/netdev/0518eef1-75a6-fbfe-96d8-bb1fc4e5178a@linaro.org/t/
But using this was rejected by DT maintainers.

So v3 use a new regulator_bulk_get_all() which grab all supplies
properties in a DT node.
But this way could have some problem, a netdev driver could handle
already its PHY (like dwmac-sun8i already do) and so both phy-core and
the netdev will use both.
It is why phy-supply was renamed in ephy-supply in patch #3.

This serie was tested on whole range of board and PHY architecture:
- internal PHY
  * sun8i-h3-orangepi-pc
- external PHY
  * sun50i-h6-pine-h64
  * sun8i-r40-bananapi-m2-ultra
  * sun8i-a83t-bananapi-m3
  * sun50i-a64-bananapi-m64
  * sun50i-h6-orangepi-3
  * sun50i-h5-nanopi-neo-plus2

The resume/suspend of PHY was tested.

Regards

changes since v1:
- Add regulator_bulk_get_all for ease handling of PHY regulators
- Removed all convertion patchs to keep DT compatibility.

Changes since v2:
- removed use of regulator-names and regulators list.

Corentin Labbe (2):
  regulator: Add regulator_bulk_get_all
  phy: handle optional regulator for PHY

Ondřej Jirman (1):
  arm64: dts: allwinner: orange-pi-3: Enable ethernet

 .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 38 ++++++++
 drivers/net/mdio/Kconfig                      |  1 +
 drivers/net/mdio/fwnode_mdio.c                | 36 +++++++-
 drivers/net/phy/phy_device.c                  | 10 ++
 drivers/regulator/core.c                      | 92 +++++++++++++++++++
 include/linux/phy.h                           |  3 +
 include/linux/regulator/consumer.h            |  2 +
 7 files changed, 178 insertions(+), 4 deletions(-)

-- 
2.35.1

