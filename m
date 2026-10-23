Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725301;
	b=spYuu4fHbx9QFHFKNW0JTsFN9xZ53SBiLOq0ZVczCU+R0fB0LtYGTaoSRqTgYxPbQU2i
	 19ToHdio4awKaAHKjvasdgYR94emaqOITzZjOQ1TdxNkVAqfyQKPQl7pvJ+Ix7A1Oq1Dy
	 CGJo+HCAhl3+nuIMdh95oRmjaoavZCyXls8Jz9dfZREql0P34SR2AdL7AEPCvS2pSyuG0
	 ZHN9Fz2XmlOwlxqGdWTQlUkfbvXyXP9lZ6EcZYXkgGgJkA5vAiCOryUJltQITdQR0IFdN
	 lKgZKfZARWOskyYNXoil/AQCzJnSrNlU5yafUr0hx8fh+BcJJBu7TAc5eIpgfNfY0Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
	b=mRZsxaTsXZwywLUzCVLNpS4y5o1E8SJCfZkmIyNcA6dcHZt0dtuwRkUihxMNXuiD1K5l
	 WOTesymFm6WL8YAppXBOsAfroq9hNroOBdTQm4Fqob2Ya22ihHo+YSrljPk9roVgoUwwU
	 lsFIenJ6Y/huHoXt+rU4wF05KdYVQ3HEVSLW/BqA/453K2wc9UmWs9BiD0UoKY714FfOd
	 Fxur6ZmH6jUgCvqYrhEMaaHcQHtv6ibUfaC+sKKKce9zGW9NzPOZRx84TjGSyK8dCHxwO
	 2WqVmtH4F4k08v5K+QQSgle3smWpIaMmdwsiDWDr8r+rO3tXocPCP4p+TwfvhzKSu2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XyLgvxjx;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F27606A329
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 03:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F27606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XyLgvxjx
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-81ba09a5d23so416775a34.3
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 20:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725300; x=1793330100; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
        b=XyLgvxjx1LxD4uNlo3pMMV2x+niQKx+sBK10a724FFqN4S2FnlgPSMy5ivF4QAonQR
         /2nKiftOqeRK3JOcSWR9vjjGI16eDjQaZ/X5JD7AncZlbhv7L4e9oglajl2CNUCJeQnG
         NHNwUebAMKLd9r+rtL+enBtgdAmBVhw8UrYWF9wlnWg5e/GvQXOlGEufH6zAIryPp5vA
         eVF/wBEFwMzWiFhUFwGwoNeQASbw67ivyWfeapYICR4yLLA+EzZPHSIM08WaMAtuGbYM
         c8yjn52cucpIP5GScrmQloGSiwNDZVXJUuJHnrHr5OdsZ47k5fTlhbZIqk+bO7mHWKF5
         T5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725300; x=1793330100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
        b=fVNQ072UgirDcBgJTvQ/OtnV4OcwbGQoUGmWJGYa21SqKuY2+e8I0H9CYGt5qqEP1e
         YIJFQZRtycl6p90gwLCz1yvSQXGAFlT3KD4Ar56eIYZznJpYDnY4AHDQNP4TgLMMc5//
         1ABTqsImOxLYsuJJDgQ+Y1i4uechdoWGKX3SNvD4YnAMhkvo6V3jZOlPhQovnJhIs5yB
         J7wZhY/tHKWVCIoqGXWP60YBQw6eR+jigVlb/+q910E91mFM4UhHYkRheYiNi3n1bZg7
         kBTPAp3B67Vv+hbsMDrnrhu3Pt8TEd3XjLhn4DY+BYBadxKuAe+jRWciPeCjielYlLcY
         iihw==
X-Forwarded-Encrypted: i=1; AKwUvBwuFclJlsafq6bf3cvmIACjQn6QCFRJ2DSO4OyQoThI2oKDO+bEbuQs6VCG37JNhlZTYhR0eQ0jMQZM+A==@lists.linux.dev
X-Gm-Message-State: AFq9FYLEeWFZ6FJIQ5IR7xPcbAzD9phH8CjkDHGqh6VqpGzskbrrhkRn
	/drIGxkD2ublf+FE9vgnZPp4r4hq9eCg4vbi4NJvH7DRBXOOCEZDvl/On944K3mG
X-Gm-Gg: AYBFou3uARTrSwQbYfPlGiC0LD6WRIz7JOXmvR4cGVU60+QeDlTdYnwvwWwARWCzuM1
	RMP0YWKRuW6p65hIProE4Uhnvd0fV6TSR5YiXUUMJs4MlGWdh2RIoQPlTqd31L/t/DwmSjyK/z0
	zdQNTn9QG7Qyla+zda1Zvvq+gdsKJ+LbPPYYWY/Tm3zgOte7CvAA+j/SBcbElo2tdRWBjWfwNy4
	Qq52PqM4o6p8xlSCv/5uK96wpCU7dB2s7eWI5TLq0p4KzWs/m+1NEgSG9slKZpVxTDHwhEEwd8v
	zGrZczbPF7MfAKf5e6tkdeRPCYCicqxpVRbPVetgw7V4SxPUCAB+SO2rK64c+IQJmpMLkpPtlVC
	5JAfyT4XwH3TbBHqn2LLCZHKROpG6SbduomWPzXbXy9pfH+Phb3tuyFV3iZJu2H1kyZVIRol8s0
	0aMprFYjGbeOIBBuPbLjj/S/6QyFku6ytcIHgEu2/NBRlrrUb7fjyEB6zh8kowh/6FlThOMv5C+
	21Q/k7KsaQ2xAIOKLBdxnZmZJvepxQTzFh6oFW95Xa+Sn6wpL8lioj58MqMf0fYh0XTLFybAV1B
	sKb2ge7FUCOWWZZ7r4TC65alTO04i7QYLZqq/gtGa91HnFZbUYKlx3RrjbeT5eOPjPEBDUW5ub3
	yUYgEUIAvTy+L1XD5NgmMyCSIR1yNPQFEtslK3p83Y2UfJh9689ny4HZ72+VqEtW5wXGDZ7bxmQ
	8Kh8zQs4Xs4I2M/RdXXod2jEn8
X-Received: by 2002:a05:6830:34a2:b0:806:9a8d:4b9b with SMTP id 46e09a7af769-84faf57f015mr783469a34.15.1792725300342;
        Thu, 22 Oct 2026 20:15:00 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:14:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:53 -0600
Subject: [PATCH 2/6] dmaengine: sun6i: handle the last partial interrupt
 bank
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
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-2-01085f684c9f@gmail.com>
References: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
In-Reply-To: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The number of physical channels need not be a multiple of the number
covered by an interrupt-status register. H3 has twelve channels and
eight channels per bank. Rounding down the number of banks leaves its
channels 8 through 11 without completion handling.

Round up the number of banks to visit, and stop processing the last bank
at num_pchans so unused status bits cannot index past the physical-channel
array. Use the controller's configured bank size for both limits and
the physical-channel index.

Fixes: f008db8c00c1 ("dmaengine: sun6i: Add support for Allwinner H3 (sun8i) variant")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9d94a37fcf10..0a9645171180 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -587,12 +587,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 {
 	struct sun6i_dma_dev *sdev = dev_id;
+	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
+	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -602,8 +603,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
+		for (j = 0; j < channels_per_reg &&
+		     i * channels_per_reg + j < sdev->num_pchans && status; j++) {
+			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0

