Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9382314D37
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 18:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790535150; cv=none; b=qtfsAgUox6DPSUNSq3qwEexEU/gG/V7I+1+YIkEW/aj11mXCj8dO8AyLK/2nsg4k6BK6YVH83PXZesxnVDldoEMT9Y7AnhM+Lsqa1HGL+kPGxYoozFvmWuqsTV3aRvTB+aYp/WZGLGq26o7knXrLvRwpg+cQkROUCwxe3pDOZwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790535150; c=relaxed/simple;
	bh=n24BezsvECn7GRjO7lY7N/ekiG6SYURBelnbkjTyEkg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SCE/hjNlYv+LS/vpULVCaMjstn6Ukd431Lku4c6Van0eQCuLeU/OxD74DwJesG/M/PHOm7umNXeITYsCZDEoEUKmbIw5TXiFUVrU3mGsVepWLCItB4zv5eeLGnbkrJckTNsyxflovt7BK37xLpsL2eh3NWb02tnOzlSOtRO0Y0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsGpTBcb; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsGpTBcb"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46a63c34533so1791253fac.1
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 11:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790535148; x=1791139948; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lckP7hj0eg5D0nk/YR1XaBxbluMeeizhLnEF9QtDWMM=;
        b=fsGpTBcb32mZL9lpNZDZp3nMCuRRZPeznftSNzsoGrs7KxL8qgZDlXHarSvXQzY8RB
         QZLyMHiWEs6wjFr5cR6k0/kQ816c8yURo/v/S3Q1ymsM7xNstUZQl7Iin0X8dhqd/Qiv
         lCSnkKp+fj868poBxcoAH+eYnZmaajXTuDik4QvwlPCNg6sL/P6Y3enRt0LJ3Fx4SuwY
         ia5gVSdVILScLT91uY8ByWzNJF7LPlp1k+xh5lpYVyqfFHhw+0wvKX7F9D2MMfMn4rrz
         aEJarZefDnNcH0cjBUfIsYWBWakAHDMr1JAY99k/o5Rd5VIpaJ5yR+vsH1tNxFvHiC2F
         wm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790535148; x=1791139948;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lckP7hj0eg5D0nk/YR1XaBxbluMeeizhLnEF9QtDWMM=;
        b=nh5JMSzPpD+cwbLmH4yGYuXPG8PZnccWttmyXYENBPD0gQU/EOWcyZ0CwEu9DlaTwC
         k2gSuI7joCbnn2lx17jcX2ciaoF/rteSCyP+L7/RJEoL56KIA2m3IvELVuOQ0kazKvNg
         GzPmcmtZ9+PTh9sgtXWSWkhiEISQFvyh9KwtL0KQPyQBC8GhJeVQLHkNSUiWRK2qPosU
         Q1+1RY87In0ozpOYd6mSHSDdqlHBC3X8E+7aLUmaFJuZQLUuCMdLLI06gFXm/4NauZYu
         4xPXh1FYFNE6E1Rdd7XqhiVnDTJCl60iV3JPgMBo+7ClCOcjrG3wt13cDBD2oZKku/gt
         enUw==
X-Forwarded-Encrypted: i=1; AKwUvByhBgkrveKeOxtJSPPzSSLQydAefsf5Q5fNv39+c06fsQLgSGZL8V3POoFm9JUSZjZx0LTcsaS4s0KU2g==@lists.linux.dev
X-Gm-Message-State: AFq9FYI7yzhw99k+TUEOqZ7te3sxKfCBedIG3qbYTEN0ivT6wsqsWwJL
	7TDwHFunFl8mx8m/rwl4esBnd2D3FsTB5cNY2/1gdCXSj7ot0kFobWWS
X-Gm-Gg: AYBFou1CfmlaUeeCaBv7kLFOI2fC2RuvCN2Ft4p4/LWxWG9jjzT5jNSc+Z9o7JG6TYw
	KTBU+o/uFL9cSFfKa05kPqudBxDrg53iVvUxqLxGiu3u+a40UcYyH20d1dZOy2avmcwRR0eLPDI
	RZ5suCIaAX5NPu1rsSoQYjhkZ3p8vnM09Yp0cE3XBMsW3tCXPOSJsfw+rfM045spbp5rYvaPFRn
	c6cNZv/ve7hQ44POoqCL7h29iON0fTtHM94TRRQEndqLCX8E5YeQvFNxsciMVA1xMRBS/5DJVN7
	vSR5HqUIiV1MqufCAnl1l/whho+sm2UMJ5EmlprH6/sBVBuXnpdYIPsYj5EShjhfLJRwERjAa81
	zsaUhoZvLibYsZvv07nfvRaAVfhi5RBKc3U8E6wrp1UjjOl2yUPirS3aM0lP0AH+mF1X8adWsta
	gzd2PP3/aBD0jOeHODdwk7AtB+wxPzO6NmbLLAxhUtU8DMsdMjxUrl6hPaD0s4Di8FcLmRkUXCE
	1qpAzrlduCHD8E/v+Gm1OhPrrpzk531357+B5UAbQwHN61fL8zbZJPcILGATqsvl86qK9/yR445
	D9mQ9b864PO9PxPu81eG7j/hrR9lE+6GuyhvPzWQje5EFwbSI+DIK5Nak6nAJs0Xt+VvQhlrxCM
	exfnWTlt+TItRLiCnUOPf
X-Received: by 2002:a05:6870:8893:b0:47d:4a10:7303 with SMTP id 586e51a60fabf-491e69a95d6mr11172874fac.31.1790535147641;
        Sun, 27 Sep 2026 11:52:27 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-494877590e5sm4489452fac.13.2026.09.27.11.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:52:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v6 0/3] net: stmmac: add Allwinner H616 EMAC1
 support
Date: Sun, 27 Sep 2026 12:52:18 -0600
Message-Id: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OS07EMAwG4KuMsiYodtK0mRX3QCzycKdBtEVNq
 AaNencyhUWpqITkjWX7+31jiaZIiZ1PNzbRHFMch9LohxPznR0uxGMoPUOBWhhQPH24PmbeadC
 ceuuBz8BByVrIRqF1jpXT94naeF3ZZzZQ5gNdM3v5nhThlXy+q/fdLqY8Tp/rBzOsFz9h1d9hp
 QQHUwUSzkHb2KdLb+Pbox/7NWLG/yBYEInoJJIS5MwekVukPkBkQTR610jQBMbtEbVBUBwgqiC
 NVHVoCcnVYY9UWwQOkKogNlitgYKh358sy/IFvL5sgegBAAA=
X-Change-ID: 20260914-submit-h616-emac1-v1-143703842abb
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: Alastair D'Silva <alastair@d-silva.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
Mask interrupts before requesting reset and clear DMA and interrupt state
even if it times out. Keep the separate H3 MDIO-mux reset sequence
unchanged.

The AC200/AC300 EPHY driver and package bindings are already in
net-next. This series separates the H616 EMAC1 MAC driver and binding
support from the earlier combined series. PWM, MFD and device-tree
enablement are being handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v6:
- Add Maxime Chevallier's review and test tags to the MAC reset patch.
- Drop Alastair D'Silva's cover-letter tags from the binding and add
  the binding reviews from Andre Przywara and Krzysztof Kozlowski.
- Link to v5: https://patch.msgid.link/20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com

Changes in v5:
- Split the three generic phylink/stmmac recovery fixes into a separate
  net series, as requested by Maxime Chevallier. Keep the sun8i MAC-reset
  change, EMAC1 binding and variant in this net-next series.
- Add the originating driver's Fixes tag to the sun8i reset patch.
- Link to v4: https://patch.msgid.link/20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com

Changes in v4:
- Add a prerequisite stmmac core fix closing the interface after a failed
  MTU-change reopen without repeating DMA, IRQ or NAPI teardown.
- Close the interface after failed hardware resume, and let phylink
  finish shutdown directly from its suspended state.
- Retain DMA and interrupt-register clearing when the sun8i MAC reset
  times out, and return the original reset error.
- Link to v3: https://patch.msgid.link/20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com

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

To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: LABBE Corentin <clabbe.montjoie@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>
To: Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
James Hilliard (3):
      net: stmmac: sun8i: reset the MAC after PHY initialization
      dt-bindings: net: allwinner: add H616 EMAC1
      net: stmmac: sun8i: add support for Allwinner H616 EMAC1

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 13 ++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  | 69 +++++++++++++---------
 3 files changed, 57 insertions(+), 27 deletions(-)
---
base-commit: 014d795c73837ea2339a4ea8e8f82c6e959b845d
change-id: 20260914-submit-h616-emac1-v1-143703842abb

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

