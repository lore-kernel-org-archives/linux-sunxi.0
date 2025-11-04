Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BE52F12C8
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762261751; cv=none; b=SJFRXR9FTOlzjUay+nHqinmBAqUmM3mawD4++0g0xQf5MOoDNBgUN2+oos33+hKbY8k90gqVECA3OKlDj0xhsWnylhV9nfk2Fyz3y2ZnbwOnDfYV9LbCzXUNbApx2bVXlzDeJiCQP9SoJv1nhnz+56bMAZZ3/Imy+QwRJunXONU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762261751; c=relaxed/simple;
	bh=27kqkXSD5Dzki0U4bTNuaSeqDRFBWPYuP5DPJT8ZFZo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O3Y9Iok/zdUpmdzY2w85jjoG6uVJcMjEhrNxd8Lx27niB7vR8lw9HO4HH89j6XOrs0GpowfWvcSMLx7Zt1rPAqetwop2vGHVgd+8LQTzwPyGU06S2ujAYWOpi4kh9G/LRVIHgBUj+rHYDGqbus/KKxKkH6L/0Y3DxL1KkVo2TdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PXx+HWW/; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PXx+HWW/"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-429c4c65485so4134771f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 05:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762261746; x=1762866546; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FxK9/M5N84FExLoRTW+PNKgn9H8+1HjlE5VylpeIsHQ=;
        b=PXx+HWW/F+YCwNZiQcMGdwPlrPGBORhUVJGqn4E5muRLTbNrus8zccOOf1kRltR/KT
         JkaqHg70UrHR+evaH/4eG3ULgw9i+pbV+i8EJ2BQmS6nwfhsGlELeh/WgwuOwR0Ttbeo
         zjmzq3XWCH9gSjQmbSWHAydC/r6b8B6FbkwYIJUH0SRW1nr82rmOsdvMOhJsgR8+5qeK
         +mTqVWzJVwYCRDmqn2VyBYxe8xyG5gXUWw/OPmZ8LdUPXunc7+KSRQfrQx7M4QQU2Oib
         Cr68LFQsCmKVbo3XElzLYos6Fo2Kk7qn8HD1qyh/YSNaUVL7UWFFZS8rv/lhVYPoRqmj
         fV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261746; x=1762866546;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FxK9/M5N84FExLoRTW+PNKgn9H8+1HjlE5VylpeIsHQ=;
        b=i2zOqfnZord3WRHaNjFuK3rOahz8VzZFqhLQRcCQFSzxs5tewPw5khXP309QeGtKw4
         PaDGboG+QkxzA3xg8Lur6g1SSu3h+x71WDxTDQT4vBmLgeLZGTDZADx3mt5A255S2ihX
         NBa1A8o3BqKaSbSn6jmakrqfe4JXV2SliP9gy5dBuJ9SmdnGloMeYlh/Ekwm4fTYepSu
         dWbc8ZSTugWfYV6gSRS/RgZSXzOjVN/jkZRhqVewcMqEUxdIQuFrnniPs29lkakLnsox
         dXZw3cOURLIwKIugpHB+yDdo1cJl7wp6Cv79WG2ZmFeTsRtIXRFJMC7Rs0mZtZFcRwTd
         EwMA==
X-Forwarded-Encrypted: i=1; AJvYcCW0fKaCg4suft+c+mcrzYrje5N6IfAs8otCUQNNqJ5DDt6qzyEzH1FIQyXcDjPdXZinDIg40FTI5ndLjw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNsnhlq8Oqps/fGIezi6m8+9AuueDr2qsLB3XRn0dCMHg0YfA3
	HeTyZoVNAEfJ2g/gB41xDWXDNNcPA6pMWSqrph2wNJ7VW+iW+xXFS8MvLoDeao22xiQ=
X-Gm-Gg: ASbGnctRgF3xw2nADufWy37YQlTiNDeLR2UwdIzBSd/xRap8CIuCWlCQsviG1UOaG4N
	DaaWxYJjcXgXaquebl6nUT8Cv7KqfIOdTHyr5+376xgUx0YegFr9t8fK/mBP7HQ5eXlvhSa6+2X
	EmIWACsJslu0OqAcXRgozaTw/KxS0x3jYmgwhuA0ThPQNKfbMU2d0WZAbwZIp/Z+y1eBk04yqIT
	N9zbLPsaIiE9a91ZQudPPWj1QRuHgSBc3vstQFG2kgdECwf8oQRGtH+qjL9VayI+3cRZZGqv2RO
	sH/UAcOjFLHYWF+nQ6ZflGIEGoD3/MaC+PEb8GCfX95sxiyQWAb6lHFcq9derQlEr4tk3cNN+Tf
	27HOE3lY83rZYo5ROd18xNdeuPx1ZzzDaV/1APjvslTfYtDgCw62NGCKFXeRk21I47R19sg==
X-Google-Smtp-Source: AGHT+IE51x9w7/hxMZ9PYtS8ESk4KgkwdjVyNKfliIp++ChjMUBtnNjUsSmL+9gueXbgY/eWMabzRA==
X-Received: by 2002:a05:6000:25c3:b0:429:c989:cec0 with SMTP id ffacd0b85a97d-429c989d7c1mr8999942f8f.48.1762261745752;
        Tue, 04 Nov 2025 05:09:05 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9ea1:7ab7:4748:cae3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc18efd3sm4554431f8f.5.2025.11.04.05.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:09:04 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v4 0/8] net: stmmac: qcom-ethqos: add support for SCMI
 power domains
Date: Tue, 04 Nov 2025 14:08:51 +0100
Message-Id: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOP6CWkC/23N0QqDIBTG8VcJr+c4HlNrV3uPsQtzVsLKpkM2o
 nefNRgMuvx/cH5nJtEGZyM5FTMJNrno/JijPBTE9HrsLHW33AQBBSgo6cP4gUZdoRATtYM2tCo
 lIBfaCIYk303Btu61mZdr7t7Fpw/v7UVi6/rVagY7WmIUKEetatMyK2V1vrtRB3/0oSMrl/iPY
 IBqj+CZUEJJ1dTIQTd/xLIsH6aIvcj2AAAA
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Shuang Liang <liangshuang@eswincomputing.com>, 
 Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, 
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
 Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3930;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=27kqkXSD5Dzki0U4bTNuaSeqDRFBWPYuP5DPJT8ZFZo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCfroWcJdifPCL3DqXR4QlKAcd6tQEdpGbNgCW
 Q0tgy82H+GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQn66AAKCRARpy6gFHHX
 cnpEEACoL9P7Ziw7NnZ7jlXuq7UvKyOILSTEZrw4bOjYVbB1okZWNYg8nELLmKc0SWoQh1v81zn
 8jPH/xO+q8aI6WJyCtcYYoYAEbDEbrtPkkbAC9JBR1mQDXuBzUwhYTv6yrR+rPN1VgKpBxsoFGU
 lsvwRztOiuowXcfATN6VcDvribhefA+yt3NcXIKQYnVGQMLUVpsHX65Y4Kuu/7b0+I+REk3PjdX
 ueeB9pGfgvbs8cWR0bkEGRMrOwxNddI+q51rRBf3e3Wbwo3zZ6B5Akb/epU/Bxm+vE9bRHNx+Vh
 bhKSRhAno4uTknAh/I5sXVGLUnS5eFTJSOkME2ySH+J/3mz7cg4rH6aXMborjd0F3BS+zwYJIk+
 Vy3/TIzzfowg6ZmoYhJwVMDNF/KJKIlHM4E7iVeL8BY5UA/EvMv8hSsebb/K+ZzGWFMWxdHMR+I
 qbzm2ZlOv1gA6l+Zlv3jqJia1kgKYBHqCif6ucHCZkvx4uu717BzMa73qdKGhxDDmNV/TYltteb
 g/frzBavk4BzSsb0fEbqf83E8rp02Ks3gYYTvdPdXNf38dNdYvljDIdcDPqgLU/qBfMD9mp3dTC
 5ggohhPVS5WZWsK2NORk/IjygwdLF8oiWlmjh1MzdcMjuQOAvJE4V4SwjKWQnqSCuGO58QdU+KD
 DP2eqomEec9/ZFQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (8):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: improve typing in devres callback
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: define a callback for setting the serdes speed
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  |  97 ++++++
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 MAINTAINERS                                        |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 342 +++++++++++++++++----
 26 files changed, 447 insertions(+), 63 deletions(-)
---
base-commit: 9823120909776bbca58a3c55ef1f27d49283c1f3
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

