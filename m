Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB773D88EC
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Sep 2026 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035947; cv=none; b=Bzs7zmPWIQokrO/MvXWUfVawoar8lWg7dPUOcZRHnW+W6oSFEZjWJfCTXOo89SSosrl0a+Zrgmd030+SHJ7JZZiRsfIcZSy30lzRdwcl+xpVALZ+ccgzx+kVR627I7vUVb3BDDYqrO2DMOGB2mxYQl35RFyREQAWYxELbidKxpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035947; c=relaxed/simple;
	bh=7qUwZtlr3g9YvFUyXqLdgxisTOChhV+RcK33AC98QRc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kxcFysjnz7YANoqhIqlvn/JnkdLorEq+mKbpFmP2X8O7YHpEPAL5qp/ZVY/RkbJuwmZuuFU/XnhhgektpaSxPjrZTADgFDhvTE2cLxDhPogteDLOq6johA1Y3t2TF1MBP2brwmIjyMbGsETIvZY+q4JhPfYeOkdOgCYnqnGbdeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GnwpKah0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GnwpKah0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-484392e3d33so4914569f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Sep 2026 03:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789035938; x=1789640738; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+7IJqvcZA5OncSvcOJnYdP+bmpbkD68/BvSiNe18T5E=;
        b=GnwpKah0/gDh0YsRA5NkuFQlS4W4zkUUX2Kskgagwhi5aYJ3s3NG+62QNG/XiH2TCT
         66AzrcQsBZPWoqG3QNiB8Uxi8nHO4lxMcl3LlHrmC0s73CMO6n6AlWFunvePbSev41vu
         C27XFVqWCkwwZZaNOXLN6Ci38tEMxBH1/l7r9npke3lPdtAPC7Og/qdFZSRmXdEZm3g5
         Bmj+fTsNqdDRFZnLLBm4GonMdLht93I3ZyCi+OdmYwrAA+XNEz+d4SmTH1pckHdbiYli
         7kLsFpQSR78O9dSj4IiJyM27H7YjvtDGsuuwOTNu45FAy5uVMz0KqCSGa/k+1T6yMJux
         p9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789035938; x=1789640738;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+7IJqvcZA5OncSvcOJnYdP+bmpbkD68/BvSiNe18T5E=;
        b=devAEmV4O30b9MU2mYRu00B1vjpZYTgOr/t3h9j3Hg4Al3daX+4a2bXHEj3SOnu8MN
         TFXXCjWGj5QbsFqg22lW4ni71vm0s+69min4bzuegC5zCzhxohqHhuizhRQQNXhDTZuf
         o8Xp3KSiM0sBgq2y+BJ817YECGbFUGYJzXPM2W9avVVjf2uWjo+q5JrydiGuatXYp3jc
         w+RJz0hc+sYoICifHreNx9hGGXo+kQki6HM+ZH+l4TXtvH546NdzIbQiMMhTBc76jF9w
         k4Rf5OdwoJeVLXKU4z/5wt/xvDniVaYTxBtpLckBkJJqKDWc+IW6NZjmrR9KVCZ7FKCL
         2pWA==
X-Forwarded-Encrypted: i=1; AKwUvBygMyZrzJQCwFVgp4Oyg9PRL+xtKihduLXX9/pCZlJbXCu3l3ciuDYsneklDT7TJefQE69Dlmgrh8ss1w==@lists.linux.dev
X-Gm-Message-State: AFuF++ktr5i+CbN1RqZpTNnGOvQc6r3RX03KVC2pa0bk0DNWeniABTP6
	iTxYdskmPKh7haOQyCBjH4gbRV6UHommta4DGgsUanWZ4g62HUH7MAbzOrUqniJ8aVU=
X-Gm-Gg: AYBFou3N+rlHqi+2uz1hTH1pDalAYNIyH6R4NJtdBlKY+2bjsQcxQeVNpYQuIVRL0zM
	aVo3GZXsZTecIZs6mYvMhDHx9KIDqSYRqDDxQuAU1ea1OoSg9sgAhVc77OgWoZUl+UwU8XO9HM5
	hFwIlPsE6Vb3fmaeNaHREl4AmevheJ5Q8eV85uP7x0I0bihLumJ1jWu11PG9bUDfHnM/ij6VcNL
	bu40/2ZSyV0cJrYVHEuS0dHSynxjOO5GzLOUz9UghfIAwGSPLXGtGDP/LQ/WRo79xqThBZs+D0p
	8WrdTrprRRpYXJkAshu90p4qpq2ZIhHxfM/ism5HBIwAG2ApNRRahEM0DxiZ708Jy/MS46Ubnze
	Bdv+Wno5IYDkU6zsv02zesbfuRmFk5ZWvlEjgU73QXbCvLB0MbmNi6sP8aOYTWE8b5f6lbjckRX
	nyXdY9T5Z+cPkYr14UqMp6om/eUeB57HDHKdPzJ8jbG9JSWjabKgiqV8CuOb3NlhpPY2+ovwWnf
	PpOKTm6HSaxBP2c6dhpIsO8fBk9
X-Received: by 2002:a05:600c:4e8c:b0:49d:93c:d903 with SMTP id 5b1f17b1804b1-49d093cd93cmr287529095e9.20.1789035938072;
        Thu, 10 Sep 2026 03:25:38 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bfb5sm70880845e9.5.2026.09.10.03.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:25:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH net-next v2 0/2] net: stmmac: Add support for Allwinner
 A733 GMAC210
Date: Thu, 10 Sep 2026 12:25:25 +0200
Message-Id: <20260910-allwinner-a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJWFomoC/42OTQ6CMBSEr2Le2mf6E4G48h6GRVseUAMtaQtCC
 HcX8AIuJzPzzawQKViK8LisEGiy0Xq3C3G9gGmVawhttWsQTGQslxxV132scxRQ5VJi0yuDcRw
 GHxLyTOqKODP8LmAnDIFqO5/0FzhK6GhOUP6cOOo3mXTAj2xrY/JhOY9M/Gz8tTlxZFgxVeRS6
 FoV4qnV0lkd6GZ8D+W2bV9+z4//5QAAAA==
X-Change-ID: 20260731-allwinner-a733-gmac-support-163bde10c152
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Andre Przywara <andre.przywara@arm.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2982; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=7qUwZtlr3g9YvFUyXqLdgxisTOChhV+RcK33AC98QRc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqooWdOxAijB+jJS+fc+wC7Ey7871ysV+SjXf4b
 Nbhv0NnxkGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqKFnQAKCRDm/A8cN/La
 henXD/918KHss64h9WEI8q+zv9g4EDRbjvrn5GDcLZ6kxRcq4Cq4CW+zC6fvSQ3qg/cCngZ5Gld
 LktODbMz1g/VLuibDxDkP1r8b2Mpj83kJiR86padlPKOlyQeUfmejmMy5FzC5t5d49kEC77KwS8
 CUDsf2i7NhfsxqgFc0ZeDuU44EQ+02pvHKItXbAQzpGsvIjF3AA0DWzEONfnwvyONCJHndkSbfd
 0uyts01se2An64GMtICogGNygSaK0Y7+Ko4isgbioxJuB9hJgd26dP86aNtpimyAczCqiSFDqxU
 21jmXAjAr5ff3qqzq6xfOG2k+dr/1p94ttFS9bTG63ogRSEnyb1Hf2lzbTBaGRQu7aXRGX7CD4S
 G9hhtgZMrHKPqKQLbL8gZCQ6f8bBClbHPp2ZaB6I5x2+CrXCnfiOYliVbtmNVMwLRrAgyDrqFUR
 q2AmDPEYgW09v3aPl28CCdxGkvVx2c1wygS2x52UuugVyNge9oIpfFV7kTlXpm4od2hdpE5P/VX
 fGUrRUJ5jLLJ+0/twR64ARZEYzgs0c/VMecuv7d+PBpaBFUXENEbxZKA6dbfjHaw2tGleg/jNbS
 Xq3xMCP6hBv7ObaQJf2hDYYeevyktHNPM2pZUc7EJz9WOy3F6XbMIfQNh+1JnmZFeRm4+RHn82A
 A1HO2hQngziPiKw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The A733 GMAC210 is a DesignWare MAC 5.20 with an Allwinner glue close to
the A523 GMAC200 already supported by dwmac-sun55i, but with a few
significant differences:

 * The glue configuration registers are a dedicated MMIO region of the
   controller instead of a syscon register.
 * That region is inside the controller reset domain, so the reset must be
   released before the configuration is written, and must not be asserted
   again afterwards or the configuration is lost.
 * The DMA channels have their own interrupt lines.
 * A PTP reference clock and an AHB reset are needed.
 * The controllers do not require a power domain (AFAIK).
 * The TX clock delay value is 5 bits wide instead of 3, split over 2
   register fields.

The DT changes for the A733 and the Cubie A7A board are not part of this
series and will be sent separately through the sunxi tree.

Tested on a Cubie A7A, RGMII with a MAXIO external PHY on GMAC0.

Problems found while testing (none impacting this driver directly):
 * Unstable EEE/LPI: If the device stays in LPI mode long enough, the                                                                                                                                                   
   link sometimes (but not always) goes down, coming back up when the device
   exits LPI mode. This is apparently due to PHY, the vendor driver disables
   this feature. Solution is to use genphy with eee-broken-* DT prop or wait
   for the incoming mainline driver:
   https://lore.kernel.org/all/MN0PR19MB609154F210DF84DCB29D3696ACC62@MN0PR19MB6091.namprd19.prod.outlook.com
 * Tx-delay: The vendor kernel ships with a Tx delay of 1.2ns. It may seem
   to work at first but breaks under heavy load. It turns out the vendor kernel
   is configured for an external RGMII clock but this can't work on the A7A.
   Th 125MHz input and 25Mhz reference output are not wired to the PHY.
   Most likely, It was not tested on this device. Using 0.9ns Tx-delays works well.

DT example is available here (gated on CCU and pinctrl mainline support currently):
https://github.com/jbrun3t/linux/commit/7b8be41a4130d2471b187b3a1ab33643970ef8a7

Changes in v2:
- No driver change since RFC, just more tests.
- Rebase on net-next/main - proper prefix added
- Link to v1: https://patch.msgid.link/20260731-allwinner-a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      dt-bindings: net: sun8i-emac: Add A733 GMAC210 compatible
      net: stmmac: Add support for Allwinner A733 GMAC210

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 130 +++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c | 145 ++++++++++++++++++---
 2 files changed, 242 insertions(+), 33 deletions(-)
---
base-commit: 211f2a875f6f447745d80d5762d6d614503ac84a
change-id: 20260731-allwinner-a733-gmac-support-163bde10c152

Best regards,
--  
Jerome

