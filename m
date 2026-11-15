Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735195;
	b=m0Xox/rT4RfD2S3UHEFC/zcMhnTiGpt8CA85QYGqR2WWlugqgVnZ0KEtZprrtuho1DF2
	 rMa4g1eRINNiB4EaEXwFw5M0qtJ7Nh99cSp6f+QWhp8O3sAUwD32YC0aAwlfsCbvC5uB0
	 QA5wNix+rlePFJxmR/KtnTgCCOx/CH4hOcpqrVl/ZRjIq5R6SHiMmWEWO1ZxHjw2dUwPL
	 FUGzuk2Ef26tC6S8ZvoazyuXN3gtgLBmAWABskZae+Ghz16tGbsOGGP+AHppkiZsMu14A
	 BA0fbGTUtH9pklPfWK2cRcg2qOB1aaSHHt8DYwXUvKjCEdOu+86Appi/qgp5I03fhbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=R2O9ixsjiKLUJuRb29OcTSyZsQI1rKD89T0Os+kzNHA=;
	b=WECto6tclkgaseOh/4Sq2JxJ1KKWX7LXJdGd3KYGAiFS5PB6KBoVXv9QjRnt+zigKOJI
	 hnAFWTPuKep+l8C3tUqVyoM2bp9ODP69Fq6lTgK4ghP6bBdJ2cnxap3vjZ08k2McCThmA
	 BM0Tyb0rx3pKUsSrDhW83wq+dI6gLkg8CzQAB5Nc1mtpobYiZn7DpYiIUJON1nNU3mYOX
	 PVW97RBdsR6z0J0fho8X4cSglqSNmYrspftJHJNAUY8CZQPvA2YmyxNPgkpDH5xqMRqIC
	 pajRubBAEAPAn5q2yFJ2IcHChkwJhg508hxWvl9xBXly47kkGpAfkGcnJqEp+GT0lnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iR1q1aZ6;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBF0606A337
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCBF0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iR1q1aZ6
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-7190d9bdb2cso2300014eaf.0
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 01:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735194; x=1795339994; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2O9ixsjiKLUJuRb29OcTSyZsQI1rKD89T0Os+kzNHA=;
        b=iR1q1aZ6oJ7Zi3OzIGRoQ6ug6X2EWhKtmkuMWW5ySE2BkYPSijfbwnlcnk1XWHwE81
         p/GXrJ/tIIDEqvu0XzAq/FupF5zAQ/AlckK+E1YI+85uVXiGVFYTc6Yl9P7mD83HP19J
         fjOFA2+jk69rqhmTPGK/2NS0fBjvOPTwK3czESwNsV2+FIeLq5oKFOVlEiAQgpnwlsVT
         TP+e6v2nbx4T9pQ4a40sfC4PlYQnHPVpnYPSXEtCj/AKMN0716jyGvkAe+VGbbt2hjmT
         32j3z/aUH0yHfNeyfY1rHuBld95VEU7GlIjXYvWDo1HxRZhXJ0cX/vPNxzrLs7G1ZXdi
         leQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735194; x=1795339994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R2O9ixsjiKLUJuRb29OcTSyZsQI1rKD89T0Os+kzNHA=;
        b=ewJeq2qqlEfTEP0GKb7NClCrHeteyfQeP161wenwOxaW2wixo9jvgTpgjAsKmTgUVZ
         AiEBCcV/t3UBlrvpJ8uxqNwRwu/MjQRHJMUUdBMyn7L3lkk/qEdXJx4sq21zWQe13t56
         YxqeUgUVVxucf+nMsLyek6oNElAtqqBZYTQILymPDJt2RabiSlRyTW3i03H/N570RYMX
         PmfCMJ3TrkF4d+4OZDhdDIHiwDdbZd9ot8PTKcQYCSnPOWQ+sFkXovPMAEyvXFj16Cen
         hM2SWa/oww5/tQug+XBY1aWhu41OxCb8oCAIoKcDkdPmfmuR8pkbblUZ12KLk27fE0y7
         h1vw==
X-Forwarded-Encrypted: i=1; AL+hErEYh7N9aNWvNnrUcYsvfP9zL+n5kMGWcykkIM1qN97QhIGyvLkNmGpr1rzeW2qGHUJjFH0bzWp9AnpYlQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8sHJyM7b3ULQ9efnQgO2cFRad9K7ea00a1UKBNlPGQ3tpLTMH2
	/a1BUP3pFxCRDWgok7M1OyFRE/JteFn603BHF1A0Q/5a8orb0H1Ls2Lf
X-Gm-Gg: AYBFou29qwSOUf9cW/+JgBAyKakhqPDAI+jZK8eAnT1RAJ5CRo2ZkG98glmfP34/8lO
	0ibgItj2N2SY3KGAVoPWUXtPxAxi+xASTpGxul99YLcCZMV+KSuWWFgYYL5ANc7Qgx2woHrOgkt
	ZDYf/x9tdULB5G+iQQUKAwuWFFwVh5oGsPYIP9waxGaOWDpAgoSqd2NO8IyvSV479ikC0uS4Ziy
	M3Vz4Vo8CnoqeBhZ7V4GWo/yK7UxLrjbDYp7ibjcXGt4l1KKtS5pmJUag6oi4qq8xENN8chJQd1
	8F41lg7/OJEv0Fg8MM2WLk7AhwI2kIoqf+iNzDQLESRTrFqn9Qu0qvwh0oNeCPQhUB4adLkTtV+
	MtUqNwIU1Q4ZaF2FmDfkry+WhfmIMjqy8AjD74dEShbGBUmwWLfQ98b4R/lgvucDCLV5r1QUmzr
	vgkaTxtdCvJEcUJgfNRql+n3VswNbe2/W6/GsD5Ka6+ltmaVE/5Yf5/KBcL1UFlJQXrIUpbQrw+
	g1tcN0EOYhw0qEY28kBqs+mtUll32RRhXLV2dVKI+qBKTIseUEz0AJ6JhZ2tDhEDqihMeXR4VBI
	hKtiZOXwsj16PbxcipLMtw3XeD/CUmll1K00XXY42gx9nxcnBrkSeNJwri4OPRzC52kXQL0Afxh
	VVFcDPnL4X+ZLCJoahsPvi0YpMaEXSjtA9NdYKDJIHtVVVnMU+s3W0YbDULUmcvQQF1/cH428ry
	DVn8f6gJQppLGy464cD65qczaGxOo1tJQbd202qplwb19fkmte5Gw=
X-Received: by 2002:a05:6820:c3d8:b0:717:da:ba3f with SMTP id 006d021491bc7-71ab4fa7032mr3576066eaf.18.1794735193626;
        Sun, 15 Nov 2026 01:33:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:49 -0700
Subject: [PATCH v4 1/9] dmaengine: sun6i: fix physical channel index in
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-1-043cd476a45f@gmail.com>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
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
index a57f530c6f70..885cb237b2b9 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -605,7 +605,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		sun6i_write_irq_stat(sdev, i, status);
 
 		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + j;
+			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0

