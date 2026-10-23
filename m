Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798714;
	b=eQeNnB/iV64yMDDAmOtOr61dgX/0YVM2RLOgJZApML627vKbFqQMggXND6yt4XUr1eiF
	 C3Y8YDbsZGr//uRFORGNyfUIjNEU0ivQSv1i5eprn6Ew6GPE44RRDwUWO4ZJ5YfhMtloU
	 EGjYNAlFmCxbgEtepwprmRrn0+vrdCH5OtcFoDmcAtux+82Jr86I1OvHb38gS/x1ho/zT
	 mvreOPYbKKM/4eDaIwpnRlagbeVM7GbwQYREsuIisnqvIXNDVAzCo32d5NWuOD9ku8Y16
	 1NFViD+FTc5f3cCZV0aistSWauPCckz52NXK2z00R3y/J4O2E4fKF/Mcvk2AezUL57w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
	b=fn4qYMTZz7S16A+QJBFu6UfXyuBGcTlZ1SjnsGg5IvYliOEiatN5Bf4T2KzJlY0Jra6T
	 xJyaaLb22TqVBk1oSs4I/Z4WhtCHXhjx3AlgVImjvzp9jLLQdOvuTMpGzg0O4NLE6af9+
	 8myj1isPth83kcSrVPDTHFNdfjuGBHi0duFnNJI50eWNrbFLcc2nF9r88ZDGCbNmlTkis
	 IReQr67m4WmPV+yFVlfy7M+PMmzZN4vOaUPe7dnO0sSklkUUDM+b/lWT0UQfEPsVpFcAQ
	 2gK60ZywqyKfIdDmzD/Xow+Qqvp6ibHZtTb0D+KasiISCDpgtv1fN5tUCn0gAX5/vuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aAlFuimZ;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2D6606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 23:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE2D6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aAlFuimZ
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4b190cdc9feso784268b6e.0
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 16:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798713; x=1793403513; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=aAlFuimZhZncSqE0Q9BTF9TD7DLMEdaESF1btOiKsys8gpU4/49GD6TBWJFs+29Byt
         2Ko+4U2GXhPbF/rLSfb/0zguU1UGcJDel6LF70i6QzYpFt64xCxk0HmKeMz6mx6nJmHE
         tP9f4klWDKCUC0HpiYtC5vV9S5NAGE8+o3TVDVZLACnzPFJKWi5BdwkJEZxP4uPWLkxi
         7hKs1LLp00BKcqz59D3knbuDOuuaaPjkxBEM6FZHvE2BMYyUOpsVjufyCxrHEQ/d1Tbd
         phJlXl27wURh4OZ17miXa25GPjQykf4BlEkLT9HE6Abf2dxvC4+AwpCYkzoUMEYEDKnk
         xROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798713; x=1793403513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=M5qcfQH/8xS0KcfcOkF6OsqO1Vpi4tfa49yI2sD6OCn5uoUddLXKvhNh6IxK+mlFOZ
         kCCD/PwE4NVUrgcFmCPknC1ZNLzxp1FgWu7f1LfrzzIxRMa9gPyJGqJCiKta0VoWRfqO
         zhkBUg9XiYNsAUt3PRFhDlEhopGS4WR3w816nrDCp13hw7EJH0BDQuKsOtELXAL3idYm
         muPrY2aN5tIX9+jq+n0spIgQEGO5OdhOZjaoou8+jhm10DX1IOO8YP1W2ZCCf9h7h9gI
         1XnPjT7cmOHtcpSQZNUA2aEhULTpty0yT1N5TCXcizhietYTdHuJ+L/SPz2dnnR0aZ0P
         0tDg==
X-Forwarded-Encrypted: i=1; AKwUvByFlwUqrQcL/b546a95OnAhRsgbHK1QwRELWA+MBaEW5Pa2asa9IBcytLg2OSNhI6GoSDNkk8yfVG9VFg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKe8Sj68kLYp4+WnihwRDqnAxkOV7s6UOLj5pTgscC4b9PolXBZ
	7lSS7ByIjQbzKg9RcuoPu0b8TWzVbQQp1u35DtGFuHqhSRmYadMH6IMf
X-Gm-Gg: AYBFou35oOYsyyxrOn0BYQKd0q5uKrbjZalsJpp0xARNSB6WCv/dcO60vjlSbw9D8pw
	nYL+/LNszxiKSxV4iJ/jCvaD5+Xrja0O9pA5c6mp2yGAhz7w9anfqAXOQZ0L12efQlzLBntTNY3
	4bC116RJTLrZRmiEKSnK0v4JJtlkY4evUisZTARmiFoohu38NVSg7myxXv0qaxYzUMWtkctIZme
	5DSkVAdPxOlxjlVvKbGD4PtB/FFndb+IfHsmMofoeEdVjg8/jBQW02EbnVv0e2fnr+64xr31m2f
	DMLPrPogON55ZkRfihEVX2/UN/UB/fN1l44lvJm5oB8IwH3idLWkal2XlT/swVE6EIweaeS0a6P
	F2a/8tvNvTjL056bnH+zlU7L3fXq4p5VeyigGGr2yJ9V1n/1Ww+xjFaENgoo+E0CMLbUEMngcO6
	iVsAreokEOsIsWgwl+Ji3Fy+xPgYWDq00HjXsGR4akkCeuRWtTwr6wSEiVvoyy9ZpMFDHFBIcVD
	IcRq/0c/C73IhF7goYE1sVSvCEdkHU8JoJ3GahGZrI0QILCJezS58RFC1n+1CbvRaBbcGOfOxFx
	N69Md2QtC/2fwqe58ytl9RQvVrHNcX8n/CQ7iv0gbjfDodloVKEv4MZBHdZcScVvIDPKaw18uuA
	SD5uVPnGaUINZ4I53kyOqNF7fWdSAwERdpSrCJqrdwDNpW955ynjVGNmELzCG77PaZScIct9/BM
	d8q4E=
X-Received: by 2002:a05:6808:c1b4:b0:4ea:b0ab:b753 with SMTP id 5614622812f47-55c0028c346mr545139b6e.50.1792798712613;
        Fri, 23 Oct 2026 16:38:32 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:20 -0600
Subject: [PATCH v3 1/9] dmaengine: sun6i: fix physical channel index in
 interrupt handler
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-1-ef1acb0be768@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

From: Hongling Zeng <zenghongling@kylinos.cn>

The interrupt handler iterates over register banks in the outer loop,
but the physical channel lookup uses only the inner loop index. It
therefore handles every bank as if it belonged to the first channels.

For controllers with eight channels per bank, interrupts from channels
8 and above are routed to channels 0-7. On A733, each bank covers one
channel, so every interrupt is routed to channel 0. This can falsely
complete descriptors for unrelated channels and corrupt their data.

Use the absolute channel index, calculated from the bank number and the
controller's configured number of channels per bank.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
[james: use the configured bank size and describe the A733 case]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 8752969366ff..9d94a37fcf10 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -603,7 +603,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		sun6i_write_irq_stat(sdev, i, status);
 
 		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + j;
+			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0

