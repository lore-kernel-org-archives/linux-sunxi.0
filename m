Received: from mail-oa2-f17.google.com (mail-oa2-f17.google.com [74.125.231.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0021D5038F0
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Sep 2026 17:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789667724; cv=none; b=uxopbl5NXU7NyDo+BkrJt4KJ9DRKIcI5TjEsNF+WyhmhINE2vDj70iPFIBISj285Bn6r4E0eC8lg+lVsc2zxDOPP2yd147RLGK9jwDe9gl5RHtpc9235IdUErWUyKoCVo6s1dE2w9ZkzSILouhrsnEOyCymwNVuCl4MZ5xAaGOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789667724; c=relaxed/simple;
	bh=V3VlQ/ggAL7FMDjaee6fyKxwwR97SAVyTjtCuxfkY6c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YVuD01HmrO7Myfy55iFKTd4fXwTIfnffy4XvIm/L6Q9Q+5Ws1B9NBsk0YxRKNjFjBYAdDDvlUvowmTFn6eXy2Zz4FCe0Wuk38/bWDIYdpkbifyY8KZ/x1rV1ABoLLztehbErOYyp8HWlq345zgxuMnUQ709+rLDEKibIjJhuQwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrQaBGxq; arc=none smtp.client-ip=74.125.231.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrQaBGxq"
Received: by mail-oa2-f17.google.com with SMTP id 586e51a60fabf-466cc88a0d7so623348fac.2
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Sep 2026 10:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789667721; x=1790272521; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rtt5XejF/bWF3GOuFvls4LbhkcGw1Hah+9I1v10tav4=;
        b=PrQaBGxq1eChEL2pEqWbncABJ6DdEAcNLXCX1zmvQ4sCFtA9WTGdO8McznFfciAAmz
         7fyWV3ri+y3gr1WBAcicstk8HZcld9MGj3Z+aS8NTaDIekEagqYqQueHz7/6/Fdghb2e
         Gh+n1UQom864OZ5umQU0/aDh7caWsmUcSXFvQe7MbFTJnQN/HSl6+VL1GRPmPJ3H4BIf
         0spRnFp+ucn/4Ks8Ko+H0N55TBg4+uRdHxkeIOyejxsYNP1kcMleKUDLkaImoTyuw0ds
         GsASKfwv+OzCTJ+T8XhHzrNtfzIdp9VyZHzEBHSs5M9V92VAPMjjKl1LxfqBqBbjD/YF
         Mlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667721; x=1790272521;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rtt5XejF/bWF3GOuFvls4LbhkcGw1Hah+9I1v10tav4=;
        b=pKhdKU5z8BZiygoqcSpTwB3J3TyS7Q/9nM+y4HxWFfFgL60V15zIAFtmGXfZJFwjmA
         M81hC3PAl7fQHGpx3D6MP06c17PPS8vU2Tkn3Ah5ZBxe6YvfxpYaQke7uT1s8imw0on3
         0TnJOHwhU24YZX6KQX/S4ryN8olm9OT9YKgS9nGb/jY8nHbKQ+DmH1vH+DJyk0Mtkn+H
         uKo+bBkD2BINzztp6z81+vQVDaSHx8wsVAJa+dVd5fn/RbpKL8sk+1YcGMHvHH36O85N
         5znT2Pr/QBoJ7lPRFMmzF87jspjK8M2zRGU5nuWHZiPI9eG2eHBXDq0euNAq3xKEhuXV
         4pFQ==
X-Forwarded-Encrypted: i=1; AKwUvByGf8UkL+Hrt2AEl2gyi7wPTXf5psFgTlvFfOz6eqU8WwobzSXZIzrWbrL7KvruWigOXBQ1PlGaCcJIhA==@lists.linux.dev
X-Gm-Message-State: AFuF++lL92egCKxzX63sWcyHhFwdi6oXRA4y77Wpk7cpTsXJsieu/MmZ
	Ir/U65/nj5bBRvCFOhEGhTcb9Rxr5uTwRK2Mqy/7mNYOMuD/LgQbvEpL
X-Gm-Gg: AYBFou22hb9pZggfKJ2Fl1hMNaYFrSRuidgLdvwX+zxHZixP+cB8v1ajtKMPPkf3eiG
	iOdsYMgIGRTK6IJptGb3FrULiPG6npXCje0s1s/DigD7xSdXpiHJ9r1DW15amxtd9uy0WCm13Fe
	rOm2juXXnXh4jDmVzrLxyhuL2XKi4ftV8voZBwTS3/rZ1QcBEXXa95r3BlC0l5vvKIUsUnh0j5n
	nZCp0p2xh9uZSUKPnrKOcrA56x+hz/Oo5LFvFqHN4fHmayRgzp65zcGSwpX/24mdPzDuZOQsxn6
	oqeiT358HemGlPbzCYWMFrOQYC4Yu6YAaxlB/IXxcmPhtYW6T1A9IKUU57snyK5GeN2hRpK5gzR
	Z49RNZpi61AyLjM82McBkpGLjWbjVeqbhRSstvXx4EgU2+yKq1JfbAa6NNhWrpffg+6a8+y+n7V
	3OWGE0vOAZDinNOIXt7Zs58RvvKQD0Cschxetw41JuS5cepRVWexMyyGDtM7csHwAWB3eEhbMEJ
	AxZnrnidnCMLvwJC2IeycJQybQrRZsuq0xIu+inm2C2BI1LvqfY6nXi47xVu6ePAfRTCJU3kKc4
	fCADmOWBQR8l6+Z+dsQOuPYVxGFGDAgzUywiC+YVFo8HSh7BJfW8chc5YSSdeqcYSQq8kLPNIYf
	eIVNg/AZbEP3pw7RXNnyQ
X-Received: by 2002:a05:6870:41d2:b0:475:a1ec:9613 with SMTP id 586e51a60fabf-48476c61b11mr7860909fac.21.1789667720572;
        Thu, 17 Sep 2026 10:55:20 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-486ab6c1f31sm578446fac.10.2026.09.17.10.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:55:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v3 0/3] net: stmmac: add Allwinner H616 EMAC1
 support
Date: Thu, 17 Sep 2026 11:55:11 -0600
Message-Id: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42Oyw6CMBBFf4V0bU1fILjyP4yLtgxQI8W0tcEQ/
 t1SXbhwYTKbm5l7zizIgzPg0bFYkINovJlsCnxXID1I2wM2bcqIEVaRhgrsH2o0AQ8VrTCMUlM
 cKaaCHwivBZNKoVS9O+jMnLFnZCFgC3NAl/cmEa6gw0bdbgfjw+Se+YNIc+MjK3/L0hBMm7IFo
 hTtannqR2luez2NWRHZPxCWIJwxxRkIAqr5hqzr+gK92Q3iGQEAAA==
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
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
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

First move the MAC software reset from probe to the DMA reset callback,
after PHY initialization. This lets the MAC and its MDIO bus remain
registered when the PHY driver or one of its suppliers is not ready yet.
Keep the separate H3 MDIO-mux reset sequence unchanged.

The AC200/AC300 EPHY driver and package bindings are already in
net-next. This series separates the H616 EMAC1 MAC driver and binding
support from the earlier combined series. PWM, MFD and device-tree
enablement are being handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- Add a prerequisite fix moving the MAC software reset to the DMA reset
  callback, after PHY initialization, so delayed module loading and
  deferred PHY probes do not tear down the MAC and its MDIO bus.
- Preserve the H3 MDIO-mux reset and propagate hardware-reset failures
  through the normal stmmac hardware-setup error path.
- Add Alastair D'Silva to Cc and rebase onto current net-next.
- Link to v2: https://patch.msgid.link/20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com

Changes in v2:
- Drop EMAC1 TX/RX clock-delay property support and keep the existing
  RGMII-only delay descriptions unchanged, as requested by Maxime Ripard.
- Clarify that EMAC1 connects internally to a co-packaged PHY, not an
  external PHY or the H3-style internal-PHY controls.
- Rebase onto current net-next.
- Link to v1: https://patch.msgid.link/20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com

---
James Hilliard (3):
      net: stmmac: sun8i: reset the MAC after PHY initialization
      dt-bindings: net: allwinner: add H616 EMAC1
      net: stmmac: sun8i: add support for Allwinner H616 EMAC1

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 13 +++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  | 66 +++++++++++++---------
 3 files changed, 55 insertions(+), 26 deletions(-)
---
base-commit: 26ee8cd69d46a14b37ba5e512084fe80d730127a
change-id: 20260914-submit-h616-emac1-v1-143703842abb

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

