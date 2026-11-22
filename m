Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333588;
	b=x9pEzNaCfQGPfS3NnmCdRNwsnOrO5ad3xs1E453GA4eBx/9fgFS0lRrMpHRC/roh8sYJ
	 YOF5MJ0ZOwio9Ad1qJJJTPifZJc/A7b9OFc2qeCrg86PC9+8NkAp94PYOrsUrnsFk8kSG
	 nrehIBuW9HMs1enRTsOKv40P95okJM0/mwmUsBD7jCtMdenWUKeG4BNuoGVm/MSWdNkSH
	 21Fb/PxFHtF9JeaLU0GCd9WSN36P19OfUU6V9fiYLQxFB7ZNVADKgDWKj/t1HC9TUm1uN
	 ePJIk8V9S9X9BefnKGghA0KAzfEttTdkbXrQ5YPsrxuQnA/kPF4gLszO1sP5wWR2d5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=5rIXOAbRqzpNweQh5zZVLwYn2XFN8mtukNpU08cq/RI=;
	b=m8hsvyC493WKZSjg6+ixAGvgbaWZLXxW5q5vXIu4BHsyykz8d7v+rimGh9BS4mypvOEk
	 LGGDGYSSngU4OTq1nIQJwjOG1nb2xrP4xpQco3ygkjT0gqH/zmPq82ALeOWDVGyNg9fZl
	 WjiYLOufnPnOsdVFByqiY3rOkVT0VPLyVa55EWOh8sMXZW+w5pKbJkzrCVspGal+Tdlv8
	 OpCk0nVACnfqvsKWFrh+3GmxOhV74ro81+R7ffqRnLNADXBFVb6gta3tGibZssdAEoCum
	 VnhFDEkjSDuPmr/GOz0WocLdVX/ewqnvGLwPzFSbO39mwSxguXHfFm3tELihRn4Ae0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TN47CEOx;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A4A606A32A
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 07:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6A4A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TN47CEOx
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-571eb508edaso1026897b6e.3
        for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 23:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333586; x=1795938386; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5rIXOAbRqzpNweQh5zZVLwYn2XFN8mtukNpU08cq/RI=;
        b=TN47CEOxAMdTG+jDnCCAlDsG7qiHU6Z4pfJ8HIkR4W02ECpjCYvOQA4a6pOp+xm7rr
         w4MlASVthO/wChK1Ch1a5veNZVqdL0TzpqJRWsMUcXi3AyzqTGzCzxcVpJiYhNG63aag
         GwL+d5PFLBval0jqG2mV7qjS1T7b+Hz8DyagdBPxh4NmWdCNXXmpguCB4mV4vnG6chQL
         dkrzkTzvowF7JED4+smmNbmIdaldIblhS03qeemqkXQXXCpujmEd5E/kaGovpUoViNrm
         HFJ2nfFotZ6w9kk8lNc85qOUH82PxxVlx4JPeSHQKFW1mjUPZAKbkA33lUILFohRE2Gx
         wZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333586; x=1795938386;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5rIXOAbRqzpNweQh5zZVLwYn2XFN8mtukNpU08cq/RI=;
        b=YkmUi4gOzgmFkhOp+obzwsIYNrsT9i8gxjaKG6CCoGPT7/1S0eT1ywI3cpe+XmAd1m
         3rV0Wzif55BNf9WzKRHvYmtgPMXCQwV71jifVR4oF2loU2i+k5rQo0cmxR9G+S5h0JXR
         s9gWevhKak3GWLlUSMGInLrKHk9mQ2XQwcnYplwpKPOIRz751it+17c9dymv4Nzr53q6
         D8eHhb1wow9G+HS5+gv3Jf70+W6+b9WOHkZ3+O4k20C5+7taj5O6/H0sY+vQtGO9bQxa
         b2vJ5bfnuDjvif06jjs+hG55nibQmbPH6IEVuFbU0PRj9zdEIGV7mJhtWujlMN0D744b
         F0kQ==
X-Forwarded-Encrypted: i=1; AL+hErGd/J0j0cogQFQ2gj4HTbL5KpVPhm8JIGY3DHWWlf96U4hGl3JKBUA6vj5ooJzvGmhT6VtmpadI6tGoMw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9PIKtAul0WOkIm84gLTaoBuDF3uutCdTIPW83L/CCmoJgxstJ4
	5pvvrG1jHKPebZjLqj0uIJJW0xFexZDrIJ+8p68P+MgNVyT/hOiXhDnH
X-Gm-Gg: AZFdTZeMwlZnfw8WelH75QnPeSkyasjqeaylY1UYEdejhDxxAXoI64IzQ/urUuZDlRo
	OtARJy/esm/g3+ZIb5uXa35Hvs5VP0xkJrB15YLjmtbJGbuROy97rQNC34AoquFYlLf6ICE+rIX
	uye1Qz/ZaeS0+9LW5k4H6wcBvhoYcsGPxyLWeKDgPnfiG1gAVuzqEXra4rSxd9eBSbRkgHbljeK
	lNAeZ2dqAhIJ8QZPL3hpIYeH2XbEb+mlsFMVqlATYXSBjgPTz75VcLSMlNSKSfthV3GoztEdoWL
	q8BSiRujCY4A/Fvgv71ZkK6lEDace0h8+FXox/LhFenig5OBctwDCqVSJdMpPxOMKDgexopTNlL
	zA5QT2raREj+LyJMg8fPKKHI/ZZoSE4kYMA001JwyclUH6qII4srRt9wmJiBQ41WylhDYQKCOT/
	GpcyH0EP5K0M6obIVKjMaLinwa++0O6mY+VJToHgbYjHJKRoidMVRrT9BQTMcWbyXoDakMuQjaK
	wFBG/Vti/QzvBl3NVrfIt9h8H4YFbleESOCUyGXTcPf8iemH29odj43IMhN6lnGeqzax1RgFB3h
	tZ+VpU/ed/ykmkfM7Jmov4pnXztzEajzTrgu+lthWvSz2TGc8X7G3o7XVItMgpoSuGk+q1aD9md
	kzUPiEGggA8GAHOAqqrkXk4bl/tRubFWNARHllw+ZtmgpB+Vw2M5hDBwrqwfVwoovqcvdAtuuJc
	OteRg4oYamZGpbozdX037qASjn30nRn/vjt/y9hMhzpZtCBOwF83Xy
X-Received: by 2002:a05:6808:6404:b0:4b9:a829:f015 with SMTP id 5614622812f47-57a0b645f11mr8031031b6e.33.1795333586557;
        Sat, 21 Nov 2026 23:46:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34252987sm6121800b6e.4.2026.11.21.23.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:46:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next 0/2] net: stmmac: support ethtool rx-all on sun8i
Date: Sun, 22 Nov 2026 00:45:45 -0700
Message-Id: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12Oy27CMBBFfyWaNZY8E+NHfqVi4TiT1ggMtZ0oE
 uLfawoLxGp0NfdxblA4Ry4wdDfIvMYSL6kJ3HUQfnz6ZhGnpoEkaUQiUZbxHGs7yUaRN386iRU
 Faa1DmMlLktCy18xz3P57vyBxFYm3Cofnp1UcOdRH7cub+Xdp0/UVGH1hES7nNjR0POpJByunf
 q+UC2SUwRGtUTP2sq1K563TaoJ35KF7AqP7BBYz+7o0iAe2Q2PY9mT3zg4rweF+/wOeUeDzEgE
 AAA==
X-Change-ID: 20261122-submit-sun8i-rxall-v1-2666ccf2a020
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

On H616 the PHY can count a bad-FCS frame even when it does not appear
in a packet capture. Enabling rx-all lets a capture see the complete
errored frames the MAC can forward. On this hardware, a 64-byte frame
with a bad FCS reaches DMA, but a 63-byte one does not, even with runt
forwarding enabled. Both lengths include the FCS.

Add the common stmmac receive and feature-handling paths first, then
enable them for sun8i. This feature was previously posted alongside the
checksum fix and is now separate following Maxime's review [0].

[0] https://lore.kernel.org/r/a91278be-9c14-4769-81f1-38497c38c47b@bootlin.com/

Assisted-by: Codex:gpt-6.2-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (2):
      net: stmmac: add common RXALL handling
      net: stmmac: dwmac-sun8i: support ethtool rx-all

 drivers/net/ethernet/stmicro/stmmac/common.h      |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 73 +++++++++++++----------
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 52 +++++++++++-----
 4 files changed, 80 insertions(+), 48 deletions(-)
---
base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
change-id: 20261122-submit-sun8i-rxall-v1-2666ccf2a020
prerequisite-change-id: 20261119-submit-sun8i-rx-features-v1-9177e8328598:v2
prerequisite-patch-id: cfcd83b1605af3856aff1188ef7bdbdbfc19cce0

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

