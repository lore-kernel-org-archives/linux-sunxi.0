Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E523B1EFE
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 03:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528107; cv=none; b=TZXpGnHwAGih9qSVdNr7gJMRVMaW0DY/xH3t0dxjP8gXSvlv/D+p2UjMB1MEJQpJfU/aLESsCGUw4Vl14dYLm5JSnzEGU/FCA3TWCnQkvTPQWmr6oeuI0dv6l7qBb38MzMugTJuYUz20uQMcJyiP4jurh4Ti1TLU3v9PkWf82RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528107; c=relaxed/simple;
	bh=QHVgJvpKezcvlggXMVVjq9FpqZ5k0yxkTV4q1VHG+A4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qZ+70K6RPMdSipATH7E/KGTuHuTwSqgxuteu8cJgH5bKj3OC2IJPjovM3utM8bx893KI9toR5GCAOYKwbSoU4QuQgzpsZ4J4baORvbnhf/lNUkmPaTGLy+5Su3p0iW3oRXKOukEgR8CylQ75B2Uy7ZzxwsbDHBuHb6m2fLmYlcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jebi0stR; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jebi0stR"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-80a71781323so201073a34.1
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Sep 2026 20:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789528103; x=1790132903; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QS2BYMR+x6ZlCVJM56HodZfD/aY2Xxc0QJwlrpiO7pc=;
        b=Jebi0stRqG3oOwf5aCG5KaL019cb2lhAZo97ixPXl/rFugwfPihkLxgunHM7zTeuZr
         +s0p6ZCBeHTzOjZ0bpmaZodrJ/Bo/IO0uahR5iMfA+oUdBMlN4gYhkZahuf+qslCgbei
         v2CeDdtmTI0WzoofcgA1qGBw9u7f3S0T4gMBb1Xs2+4wj0tfpLdZ/sWtM4gvrtYNLIeq
         E4tkItlMF0XZtO/NTA8IJ7NYRqycMLFgGP5iDYz8x1K7bNJt1V0/9S+Bkl6jsJa5RT8p
         iNP8yvNl0p9XmMNy2vebgTAuf4vM+BHXDHV8mA3RLEbZhZEFcrhe90mr8dok/lZAXF1y
         z63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528103; x=1790132903;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QS2BYMR+x6ZlCVJM56HodZfD/aY2Xxc0QJwlrpiO7pc=;
        b=W52Vc5umzepXW0OGnU76cXAQnftQ1TPikqYJ0kIO983SrFj1K1RzA1odZ9IRiGaDo9
         iqwbCOPJuB7+DTiKwgjxa1UwtN/o59FMDgYWpz30sMMYyLAYJNmXjIe7pY4B9HNYnhtv
         HKZ8aReN5wIOD5hBGF50B07eWD92ikNbhO7SDYUMjMYcuA+gU6C/ORErfps/SVC++0Ly
         0zd1WZNANBtkqQu0qienMlEiYHXNkWnkCwfGDRImH+OEOzrcGEMfs4rt2Fzflem5x4sB
         Lu/KRIYSyKD3wacjsZ7ggMaB9t+0rdEFYpSdeWDJtBHJsOuMLEtfWP4mpG6wvj3JzCKv
         EUIA==
X-Forwarded-Encrypted: i=1; AKwUvBxssFvxSA6nO5LW9wT0iE+ozkAczyP13smyZck4iXrk0bSXxjtat/lN+qMlfGU5oXCIxjhz71nCMCGR1A==@lists.linux.dev
X-Gm-Message-State: AFuF++mlbGTSaiO8yinRIyJPYb/K6lO6gCIKPd2DVO3G2Tw4EYF8Nw9+
	29rCXlF6TEQlq+A8TMYjitR9ZWBneoH8bAjZaAWrOX4n9K695Oyruaot
X-Gm-Gg: AYBFou3NKLMbP/jkgvGSkg3h+/+gs9OtUYCcps33i3YRJ/Wn/BXNz1H5ATFloPcdBOG
	TVhb3AcGfb4uq6TI/WsYxrwTneVmtG9IoBJTAKF6BXaemNwno8p3gQ08IAgqvjra+EmzT+pJptT
	Gj30YDNoL7LNG/UoRh5FNVosm4WSBxpW3no9y01FiJfcuFDO5awPQ/IaE5ZNxBb/Oc/HhqdlopN
	CtWW+huwR1ZfDrBlXchl2jebsSrUBVrI4gREgAwYSu4yoOGg0DGLJy/WRp4efkeQPjEOf/vY2K9
	GTUhvtb5HTDG1EqdWOQXUqsDjCVLhMfkOCrRM287RpeH6n+MgwLv9EiXCD5ze9sGspziH8xmoC+
	tuEAAQB0ItLMK6XK1n9zomd8J04RBl/Pgi5p0OWW2oQcxM6RpqrozxJ5cYZ5W3KdQ9EQaUunxZX
	rjJXLLwHmO8ULZoWX1MD/l4qiZHHKOLMmKuKuRcD2dtuYysdoFC62JrQz3xAblMtgiuYEIIkGPr
	KgRAbtwD9RG8QOGwFas0aN/cwA3oeoaFbz2qCOSeTV1Z1h3rHl6AKs8Pgd2nn8pH5mII18rMjJE
	tDYTP3PCWzFnWsdhSSP4lZffxmHhAAvVv5orPQCPTzqKmh0MtF/c5k4k17LyxrgSEu/94uQUpUs
	B5VqTlTJdu4SMp5t9t347qg==
X-Received: by 2002:a05:6820:624:b0:6bd:ea89:56d5 with SMTP id 006d021491bc7-6c7d1fca49amr1195068eaf.22.1789528103375;
        Tue, 15 Sep 2026 20:08:23 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c7a677b3bdsm1718078eaf.6.2026.09.15.20.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:08:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v2 0/2] net: stmmac: add Allwinner H616 EMAC1
 support
Date: Tue, 15 Sep 2026 21:07:39 -0600
Message-Id: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OzQ6CMBCEX4Xs2Zq2/IiefA/DoS0LrLHFtJVgC
 O9uQY8mc5nMzje7QEBPGOCSLeBxokCjS0YeMjCDcj0yapMHyWXFz6Jg4aUtRTZUomJolRFsEkw
 U+YnndSGV1pCqT48dzTv2Bg4jczhHaL5JItzRxI263Q4U4ujf+weT2Bu/sfL/WBJn4ly2yLUWX
 a2uvVX0OJrRQrOu6wcKN2vx1AAAAA==
X-Change-ID: 20260914-submit-h616-emac1-v1-143703842abb
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC supports RMII at 10/100 Mbps and uses a separate
system-control clock register at offset 0x34. Add its binding and a
sun8i stmmac variant using that register. A distinct compatible without
an older fallback prevents the driver from using EMAC0's clock register.

EMAC1 connects internally to the co-packaged AC200 or AC300 EPHY and has
no external PHY pins. Leave PHY initialization to the PHY driver instead
of using the H3 internal-PHY controls. The RMII-only variant does not
expose the RGMII clock-delay properties.

The AC200/AC300 EPHY driver and package bindings are already in
net-next. This series separates the H616 EMAC1 MAC driver and binding
support from the earlier combined series. PWM, MFD and device-tree
enablement are being handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Drop EMAC1 TX/RX clock-delay property support and keep the existing
  RGMII-only delay descriptions unchanged, as requested by Maxime Ripard.
- Clarify that EMAC1 connects internally to a co-packaged PHY, not an
  external PHY or the H3-style internal-PHY controls.
- Rebase onto current net-next.
- Link to v1: https://patch.msgid.link/20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com

---
James Hilliard (2):
      dt-bindings: net: allwinner: add H616 EMAC1
      net: stmmac: sun8i: add support for Allwinner H616 EMAC1

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml          | 13 +++++++++++++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml    |  2 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c        | 16 ++++++++++++++++
 3 files changed, 31 insertions(+)
---
base-commit: 87b80c2f6b05cad9f0ff9136709c62a0f59923e3
change-id: 20260914-submit-h616-emac1-v1-143703842abb

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

