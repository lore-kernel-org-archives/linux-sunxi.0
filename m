Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594719;
	b=a7zzpYUb3X+mJHBVMKBHr+BPiG5jWkDTOnrMANK0TKtAb0/TYKSpnv6oxSi0JaWmUVCH
	 E5k2TKipsxMeKat1owtefhGTBw+2xvezGhsxoXoDfiwiHf3k4tNCpRnR8ay/u5Tv6/PoN
	 d6x6jTQtdo3ddKOsyVUNErVzdDiXv+hRNlecNJViFumnltOpidg7Je4q5ULExaUL3z/ws
	 qRW2iwhaDQy4qIc401AiWP11JS4oPbftDt8AeaF48qAryxoCIDSDjeJkrOpD+hz6jvfOT
	 qidozu/iJawYy6kmepI6fC3tEI7LznqXb10mYbS4X+LjBFlp2vNksUNFkNh/SGGZqYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Y0oa6aSqkdEr/b/kG325C6urMw0Actusyeo4Ondu2Ps=;
	b=O+jjvnY3IdgtQt83of0E7QoVLJEKby4w7D+ctolEzH1Ey/6+GuYz+UpGaFLEjbmQ9aBx
	 p7Mb8uXMt/CMc/ZlTLqt6XNn3ppS2Dor0ybQpu+4vAnztRlCCF59586Ghwl3C0zqyyFcb
	 zrHuCDtm6HVh6SfnbZz4AzY9qo75K2uZFauYfhE56niTlpmz8s6Lnan8n0mQFr6/MYQ/8
	 4eopnlwhpQI5ya1syZGXwzbVrgsu7+M/i2RaynNEtEewhyatRH5YRM+ZtvyyCkMxLRzzV
	 E4XHC4tWi27QhseMmNweNjA+R223uxSP07veNPPdutHyp1Vu/o0OOMx2FECru27w66A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HAq78cM+;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E54606A321
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 08:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11E54606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HAq78cM+
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-475920b9ca2so1856793fac.1
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 00:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594717; x=1796199517; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y0oa6aSqkdEr/b/kG325C6urMw0Actusyeo4Ondu2Ps=;
        b=HAq78cM+uujlYDCUi7bmLyOmYPvz8QbWSADubJivC/JKK+BR5nquL0y0c4LIkNmvuU
         w+jUyZXTiKA5J3ai1R0kzm5bw3GebncZLa288EZKvUInunHPbs5AaQANZRZ/7TNxfNie
         4w7huYEK5JrMGxwc3gsZlBFgBG76iu+IQ7FVHlml8p9yrt59j5ZPtZGyZqTAGKbsZOi3
         ouD/8QBAJdahrSgoBjrsUtc+NoRsjWUd3mED5NdLxzbmMlqRjipDzi5QAkUpZ+/VkrW+
         RNftdBFlJnrEo/2FYUVzLG55nkyWDY75Kl0D//LybPYLGY6T6uM3DWS+mMpDklys4aN+
         G+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594717; x=1796199517;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y0oa6aSqkdEr/b/kG325C6urMw0Actusyeo4Ondu2Ps=;
        b=riERhdPwJVVNicBUkyGGcljqUpQxG9DtMigP6Zvio6pXoqtJbM4VOuwnKeb5QQO95y
         CKB59to5K1h/76ecd14ekKGDoRnTkvkdPvyEBQi/2NpuYAse7ig7nwWCPRwJv5gR5u5E
         RStGDB7fWNd/wU8FJVVlVUdUUj8b18l+qV3gP0X57f0fabSRWF9No0cPPKMRJUEvn+DP
         NGsj+Hr/Hw/YkTdK/84uuIGQRnK5ovRK8Qz6Wh3tcZy0A2URcCsG5qUriVkQHdxx1AQA
         LnA+FrlFa3cvTS/0Tf2ijSfWy7rd7CJEdUtRYC8h/xy7PjFyG3I2REWUhohOdQY8YtNK
         Ql+Q==
X-Forwarded-Encrypted: i=1; AL+hErF1UzlZjh67M62h9VnZEJKs1OjV+BgOUiT2yLA7mF6l+zUx/QfhszSCItXc7usJf79MgHr3RYAxrfETXg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9ex2YAuS+pgGbLnSFBo50Yb+C79BHGhBbnrZgpOGgW/dvgRXyu
	XxEgC0tgZOK0EH0D9oIkRLQmCC7WzTGzHhoJ1bEN2Eua4jdqTmGPDiHU
X-Gm-Gg: AZFdTZfTS6WId8u6A2ZArqAN3U7PXWcV//kUbMIRqkud4KJvYcEqOsWOxc1mY5Sxf4Z
	rFJMilRT153PO/Nw9595UKqU0SKimhH7/0Y/zJc/7NhmXEnENTVsDjXss/YPFF3GDGgeGQVPkGx
	3fnVh8C6FsDUQh50PvKhyZNMzDdeuHh3/KyynCo6uTZ9Q7+Siaa0BWS54QUpXzK2qYp81ISxCdX
	L3c09hdoySDR1YDUacRiveVbmd6i9oi7rOK/nD6iNFOVwXoAQnlDRou2V5aASa78GFEtXPVPbXL
	CS+qXmpENN0g6C35PjuCk+eh7Mh+riDl5lqIs2HuHcD7N7LsiRRmL25kH2fsbXVe/9HUdunrXqg
	grCenHjbDIPaNinsTpLa8/aNUIwyY1OePrCKDJq0lE/vpHntgleyQQngqUKLbDRlNlIyEZ3k+Zc
	OjfnWL5zbVHGJpy8ApEGjhasj1nVG3toJjw+yZswRYJ6qDaVMprIhT2D5ccf+Ge8xhmx3j9mwzj
	z5Bfzw7zlG3KZELi8HiFEdOEGjC6RHb9MYxiiYVXbkUFQ5ziE89EWKdDAgvkYuvj19opjDwtnzJ
	pdtehpRYMqm9PDAjvaMDvrUtXwvrRfwPEldQvCIHlRmTaZPoObrvwoyhs3mxzLLNmlSpHiodEqV
	ym9C3H/2J1tD580ES7lanBSd6rmPNhdm39CWGCDy/meMNFMkQrZUmkuw209S9xIe29RxniK5rXc
	EgYb+ll9uYJyfkj5ja1S6EsMiFz6NKwtkCsXsBh4lBa6v+4ns8SW8=
X-Received: by 2002:a05:6871:7429:b0:475:a112:1270 with SMTP id 586e51a60fabf-4ca12632e01mr2463194fac.29.1795594716914;
        Wed, 25 Nov 2026 00:18:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc55895b9csm14884815fac.0.2026.11.25.00.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:18:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v2 0/3] net: stmmac: support ethtool rx-all on
 sun8i
Date: Wed, 25 Nov 2026 01:18:29 -0700
Message-Id: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WQy2rEMAxFfyV4XRdLGb+y6n+UWTiOMuOSR2s7I
 cOQf68nnUXppiAQQtLVubqzRDFQYk11Z5HWkMI8lQJfKuavbroQD12pGQpUAIg8Le0YckmTCTx
 ubhj4ChyVUt736AQKVnY/I/VhO3Tf2USZT7Rldv7pFIkP8vkh+5yN9LWU0/m50LpE3M9jOdRUC
 tCcTFdrUqY10hBIAxK07MFLUsKSsJ0Gy34jFwcHMNi/wLwnl5cC8cC2oDWZGo20plnrA/AaUp7
 j7fjICgfPP+ZLCK6E1sZqjV6qt8vowvBaHLDzvu/fCvjn5mUBAAA=
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

Add the common stmmac receive and feature-handling paths, then
enable them for sun8i. This feature was previously posted alongside the
checksum fix and is now separate following Maxime's review [0].

[0] https://lore.kernel.org/r/a91278be-9c14-4769-81f1-38497c38c47b@bootlin.com/

Assisted-by: Codex:gpt-6.2-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v2:
- Drop the RX_CTL1 lock and leave DMA start, stop and mode setup unchanged.
- Align the EMAC_RX_MD definition in a separate patch, as Andrew requested.
- Apply rx-all alongside the other receive filters, independently of RX checksum reporting.
- Link to v1: https://patch.msgid.link/20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com

---
James Hilliard (3):
      net: stmmac: dwmac-sun8i: align EMAC_RX_MD with tabs
      net: stmmac: add common RXALL handling
      net: stmmac: dwmac-sun8i: support ethtool rx-all

 drivers/net/ethernet/stmicro/stmmac/common.h      |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 22 ++++++++--
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 52 ++++++++++++++++-------
 4 files changed, 59 insertions(+), 19 deletions(-)
---
base-commit: 612848d37e68b858e15815175f1c5e609e09d719
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
change-id: 20261122-submit-sun8i-rxall-v1-2666ccf2a020
prerequisite-change-id: 20261119-submit-sun8i-rx-features-v1-9177e8328598:v3
prerequisite-patch-id: cfcd83b1605af3856aff1188ef7bdbdbfc19cce0

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

