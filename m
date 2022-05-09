Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE49146AD
	for <linux-sunxi@lists.linux.dev>; Mon,  9 May 2022 07:49:06 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 125-20020a1c1983000000b003941f354c62so7757380wmz.0
        for <linux-sunxi@lists.linux.dev>; Mon, 09 May 2022 00:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PZ2W3KNFaY25uwPYOAUBqo//QhydCTG90+jdDVlc4xA=;
        b=SsCIPp2ySQpY3254xzJt4ErJObYSQGSZEWU6X7IY0SFlD1Kh8uODF6gzKe/ygx7J/o
         QSN9M64o4SLkt1XmMTnzD1rheiktoy3zResGYIC/18S5uNdX/HLiMfVmuwfHS0UmH2J1
         56zMKZiNaUulXDHuZyqd/XlGQ5KOyC6WJCZRnW+PstcyfuttFGZzrUkPS7LIpC1QjC14
         GCU/gunXAFEWBYE6EEq1137icpShNdb4bflJwng7mR12JSqqhaEq0LNkz5Z+RvSgjeRY
         fbR26UOPA3yDsXPBzJ9H7UbMJw0Pe4IrvJ3380Baz+N09dkYijZcf6k1lQ10EfHHhtLw
         TXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PZ2W3KNFaY25uwPYOAUBqo//QhydCTG90+jdDVlc4xA=;
        b=TnPdmUNL8j17A/Pl6zfQ7C6S1GcOZEToaobAWHc/U+owwjOvoCdPK3oOKAg/LQUbNG
         nEZwP5ax0IlFJhnYVLx4oJ+3pyat5Oz6ycRztwk2B/jyhzecnEO8N533G89DtIYs8OQx
         ApCsfWIK4cDTxD/ugEGlyUnSR3VeCuITxzGq2qciVIZU2+4IFT7GSZTKLL2qt2zkGDXJ
         oBGUS0c57nfYFdbCneUJqMFLnZITCzjLIB1TQlcdMDVsoaCmLnI7Ui0KdIwRABE+AG6r
         qNzDFA4WO8laxkiP4ru4zZm2aUGKCW72wYxue5NlBm9ODIkkcjta8vqs6Nc+8+KLGmzT
         MI5A==
X-Gm-Message-State: AOAM533mwys/6UGPvNpt3Ad5B1yGqS6LOwmKLlCVv9IWWWzoYXSuEmBs
	4yqXJnmsRLl58Gs5Y8FKxvWzmg==
X-Google-Smtp-Source: ABdhPJxYTas8Q7heHVKK5/emA1Py+N5pnUGGlYHfJx5IL39sb779Z2eLroXzNCY64Rbv4EnQKVnVAA==
X-Received: by 2002:a1c:35c1:0:b0:38e:c4f6:1931 with SMTP id c184-20020a1c35c1000000b0038ec4f61931mr14583358wma.161.1652082545111;
        Mon, 09 May 2022 00:49:05 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id bw22-20020a0560001f9600b0020c5253d8d8sm11784768wrb.36.2022.05.09.00.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 00:49:04 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: alexandre.torgue@foss.st.com,
	andrew@lunn.ch,
	broonie@kernel.org,
	calvin.johnson@oss.nxp.com,
	davem@davemloft.net,
	edumazet@google.com,
	hkallweit1@gmail.com,
	jernej.skrabec@gmail.com,
	joabreu@synopsys.com,
	krzysztof.kozlowski+dt@linaro.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linux@armlinux.org.uk,
	pabeni@redhat.com,
	peppe.cavallaro@st.com,
	robh+dt@kernel.org,
	samuel@sholland.org,
	wens@csie.org
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 0/6] arm64: add ethernet to orange pi 3
Date: Mon,  9 May 2022 07:48:51 +0000
Message-Id: <20220509074857.195302-1-clabbe@baylibre.com>
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

A first attempt was made to support them was made by adding support in
stmmac driver:
https://lore.kernel.org/lkml/20190820145343.29108-6-megous@megous.com/
Proposal rejected, since regulators need to be handled by the PHY core.

This serie try to handle this.

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

Corentin Labbe (5):
  phy: handle optional regulator for PHY
  net: stmmac: dwmac-sun8i: remove regulator
  dt-bindings: net: Add documentation for phy-supply
  ARM: dts: sunxi: move phy regulator in PHY node
  arm64: dts: allwinner: move phy regulator in PHY node

Ondřej Jirman (1):
  arm64: dts: allwinner: orange-pi-3: Enable ethernet

 .../devicetree/bindings/net/ethernet-phy.yaml | 10 +++++
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts  |  2 +-
 .../boot/dts/sun8i-a83t-cubietruck-plus.dts   |  2 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts |  2 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-r1.dts      |  2 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts  |  2 +-
 .../arm/boot/dts/sun8i-h3-orangepi-plus2e.dts |  2 +-
 arch/arm/boot/dts/sun8i-h3-zeropi.dts         |  2 +-
 .../boot/dts/sun8i-r40-bananapi-m2-ultra.dts  |  2 +-
 arch/arm/boot/dts/sun8i-r40-oka40i-c.dts      |  2 +-
 .../boot/dts/sun8i-v40-bananapi-m2-berry.dts  |  2 +-
 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts   |  2 +-
 arch/arm/boot/dts/sun9i-a80-optimus.dts       |  2 +-
 arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi |  2 +-
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts |  2 +-
 .../dts/allwinner/sun50i-a64-nanopi-a64.dts   |  2 +-
 .../sun50i-a64-oceanic-5205-5inmfd.dts        |  2 +-
 .../dts/allwinner/sun50i-a64-olinuxino.dts    |  2 +-
 .../dts/allwinner/sun50i-a64-orangepi-win.dts |  2 +-
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  |  2 +-
 .../allwinner/sun50i-a64-sopine-baseboard.dts |  2 +-
 .../sun50i-h5-libretech-all-h5-cc.dts         |  2 +-
 .../allwinner/sun50i-h5-nanopi-neo-plus2.dts  |  2 +-
 .../dts/allwinner/sun50i-h5-nanopi-neo2.dts   |  2 +-
 .../dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts |  2 +-
 .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  |  2 +-
 .../allwinner/sun50i-h5-orangepi-prime.dts    |  2 +-
 .../sun50i-h5-orangepi-zero-plus.dts          |  2 +-
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  2 +-
 .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 38 +++++++++++++++++++
 .../allwinner/sun50i-h6-pine-h64-model-b.dts  |  8 ++--
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 37 +-----------------
 drivers/net/mdio/fwnode_mdio.c                | 32 ++++++++++++++++
 drivers/net/phy/phy_device.c                  | 20 ++++++++++
 include/linux/phy.h                           |  3 ++
 36 files changed, 138 insertions(+), 68 deletions(-)

-- 
2.35.1

