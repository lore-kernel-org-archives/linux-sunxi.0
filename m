Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E1223C9
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 07:36:13 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id p16so9059373wmc.3
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 23:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=behpqgNTXreSZukfyARZq1T8Bw0AtPtkMcPJmTi9xoI=;
        b=FuYvOmmzTyXyt+6y7IakaZ7B5oewGa4eSDsx0PQNoyZ652p85IY2AmgRcnKDzeL3hQ
         TE1xgJRBwg5lnn/uEZ/nQfAxywv47e1X4ZTAR+qZlrmP9a46M673+9HHny5YS+rLGEBZ
         Wjr+exnPowaX0+gx1X8ukUDWlGf3eHYJzbwd+DKWnVud45pyT8DMD/NQNs56KQaj9KeI
         UFpmKQmODMRXTbje5I+2z0oJnnL3lydwURT/iar3nJwt2GXZsfxgp0z/lV7bpQun6ZaJ
         J/NxDx3DzDqtUyvZ0T6UeiaiYEr4shR1xWIt3f+/EJ5qPPvFgYQez8K+wNZ4KnOEgwVX
         +Peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=behpqgNTXreSZukfyARZq1T8Bw0AtPtkMcPJmTi9xoI=;
        b=bxLxefFb+Ptv9jwoCtkGTAI6T5Om27V0fXWeZO+BF0kAtZltHjf8dlnp1X8vFpn3GR
         lTKBOtE7+Um6RzruvWIRtaB1r+Q7+CCt6gWghoi8yYLqzy6fD0YWyjtXEyDJCpuIpoGr
         1qfG4zQCFF+thv3+gETsXCMRk20Eaxa0Qhvr0PHhEKqD0XCtV9l3EseI/21g+mdmae1v
         9Vq3gRNjnJOF8wvZzNb7is+krS8+ezTNcTMGQ2aMPXw/mu7H0GDAk3b8k5L1yVJ8Mz6s
         t1Krwbp397kzRWlt304f2WgZFfjvaHZOHV2dQRTTkqyDYs56LEpxYKdaFD8XRHipNs+O
         hRzg==
X-Gm-Message-State: ANoB5pkwch0wQ32AnBZs2n+xTpSrY9UVfJwZoIOUYozFJyre3l2Ng8tW
	JuRopkBig4TyLh4+v3nYsOEbzQ==
X-Google-Smtp-Source: AA0mqf514eXOs8uyBoURxGkasNRtcd7mDPPW/TXifbyM66DF+128CCiNBap+QgSvaeiXW0fT3u91aA==
X-Received: by 2002:a05:600c:4e04:b0:3cf:a4a6:a048 with SMTP id b4-20020a05600c4e0400b003cfa4a6a048mr59983wmq.202.1668497771567;
        Mon, 14 Nov 2022 23:36:11 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id j13-20020a5d452d000000b0022cbf4cda62sm13836811wra.27.2022.11.14.23.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 23:36:10 -0800 (PST)
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
	linux-sunxi@googlegroups.com,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v4 0/3] arm64: add ethernet to orange pi 3
Date: Tue, 15 Nov 2022 07:36:00 +0000
Message-Id: <20221115073603.3425396-1-clabbe@baylibre.com>
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

Changes since v3:
- fixes kbuild robot report

Corentin Labbe (2):
  regulator: Add of_regulator_bulk_get_all
  phy: handle optional regulator for PHY

Ondřej Jirman (1):
  arm64: dts: allwinner: orange-pi-3: Enable ethernet

 .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 38 ++++++++
 drivers/net/mdio/fwnode_mdio.c                | 31 ++++++-
 drivers/net/phy/phy_device.c                  | 10 ++
 drivers/regulator/of_regulator.c              | 92 +++++++++++++++++++
 include/linux/phy.h                           |  3 +
 include/linux/regulator/consumer.h            |  8 ++
 6 files changed, 181 insertions(+), 1 deletion(-)

-- 
2.37.4

