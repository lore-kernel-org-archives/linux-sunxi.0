Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730655;
	b=srwUH3d+aYZzRk6Amr+avs+AhLEVd8MHK9wqFDYJLAQeAfbQHV7aseH6WJjDMSBdFlh+
	 F1gHAe0tx3CE0OHQTAO1xptA4j5h9zxuIivKARbf6OruwM8GKCDV4/IknRaMIhZCe0bvf
	 7ox4WPv8D9qHCZdpcquXMASXyIHzC3fx+Sd/QRvXjahuR4N0XK+0cDnh+93+IKRqOfzPI
	 7oYgF/TsO8RDwG3T56kFg/9gcsvnokwWYYS0Q3xVlw7ATWAFEbjpKOeKEa56MJT5jyK9I
	 Kf78apDuvDPv2fJZB+q0Bah9e1y12Zev5JJSqT1jKWXUJY58SlA+AR7GJ4jpdUYpC6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xrBttNfHIp1ZblNkZtgms9+zlx0LAPZlPGiQYyXduk4=;
	b=PIWjNlKN6W1M6tDaJy/TDykmyt/yO3Im/eh250oJI0XCuEShmTW3IWoQJbrVnyVFngUt
	 esaWKgE+gkZFN6UX+hYFcokVbKU7jPVWgCHv/iQwAGgbwO7k5rOvVzeVRRlKACujQoRUS
	 a6OkAddZYfaX4wow0YQ1/nAJePEjSfWEvqy0FAzEj275V4voTCm8Dzkfr2FLSEQq+2mAG
	 ewfO6xctLM6WqRghFx+FcEHGUplIOPy6vvMaGiZzZXEnTFzZMfByLrlOJyfLfscf0e+kf
	 Jw8clZMoqIDw7vkA7dUjJMWz+jNAilf4qsOfYAONJgS3KM1ilNym7hGTNbcGCLUvgAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F1X7LBU4;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9850606A338
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 18:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9850606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F1X7LBU4
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so45780775e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 10:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730653; x=1794335453; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrBttNfHIp1ZblNkZtgms9+zlx0LAPZlPGiQYyXduk4=;
        b=F1X7LBU49W/qd9gS+6AgbdGWh3KYMPCWwjq0Mv9KVghfSZB/T3ySq6NCDhZtqngw8h
         R2XP4LOVkCKuH5UoDztKrmcVSd8hwqW0KDxEi1CEJB91P4zwhBZM4ct6G4QbTUHGv5go
         Dr9NPPN6/fDuXvG1dgaIwcktWu28/QDoQF2oOazwPf/WyUrayvf2mKbrQgJiug3HayFp
         t8hG5xOoU2JMqc34Noo/ZUC0rQiNvjj5c4eN7xEgKcb7ZVuSz113EDHC6jXDd3Zc6XND
         oOLIzPaBrSiZgvL6t8O2FCF+w5rFGofBPSh4Nu/4hKMhPindF8g/tb0vo3ydJ7DiQ9WE
         LPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730653; x=1794335453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xrBttNfHIp1ZblNkZtgms9+zlx0LAPZlPGiQYyXduk4=;
        b=eSAo6DK5m1rRB7/i5QpGxm01qIRwVCrybDNotXJD9hsNAz+gDR/QumyuXCaj8wthO9
         nH7Jo7VqPRequs+x128kWNc4kCbZcQ+kOJ4MLcDRQf+gX15k3vaA8kwom9t8XwgxbBd6
         7QCWEjfnKuC49r2Dy6ZhJ/9IAZZmN1gmvz9EPimxULneCY5fwapU9YZ0qOmYYhe4OaEu
         c1jB/GicIq4PMLb6DP5j1BEOXNfs9laQMaej0XVDWJaNLNxMobyPeO8ua9eOTRAbiM4N
         EYTISKEbP5VB3bQo8gzJUiEuDWMOy6wgQhNfz3XxSi2nhCfu+RwbLqHsq8Njdq9M5w/L
         /Ktw==
X-Forwarded-Encrypted: i=1; AKwUvBwAD6rH4IjLSnzeIFXrIF4V7N1b9EalptvSbGYpQ2/FPPaKpJ0+12t5o+9IhWFKpZlv7wxw01qu3iMpRA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9/5hHn4z3lP/WUaxVd8gqxfSTuCndpRt9DfgPYl7VQkbahcxyD
	HE8GOjbQcqHkV0zTEyRoiwTDsKlFWbBK2RLlTh/tKK+7+b0dTRi3Au6NLz80ZQ==
X-Gm-Gg: AYBFou2mFWpedd/dt2Hy1e386HgYuqCh/bbjl5gFl04rmFY1G6EEywM9BA3LluHvCMp
	6VZDGyz9j6Hm9RmJpvUYfhzA8eSDokOvYkvGUIyR6Td9N6bnb8kMiEDjeO7IbkQUlJo9yCUgrT7
	4iyK4x8QH1ib/gy9gT8ipFb4MXhJk3FczaBSKGvmQdKvPoSkm7pQu9l48Qcglm8mseISE8QGv35
	5sVZQ1WDPsQiwLzA/tp+602EXbuaKjBaxsVE5ZQu7MV8LJlT1cdLxXrZmih6TTmam9cl9yhsCwJ
	mja4iDdoa2UjMocwxENvhjoMb/mogSH7tidAjkegOaYM8ZylbzYMEWBAqzgQdrt57zQLlLBPYr1
	PJW9yfNtq4Im66MvHEjJiqidZQqr4oi1Cgf7pEXjVxeHEAUaFAfHMM2jsJwKbvf6bsTGrqzVYRS
	yY22gPcI9SAi6WUnel0jQD0t/yTqE43mwcMouba4SqZD8LU5u2OVdHzRionuym1H5dN5p6OHl48
	uTAj7JH7plgTcvtM1NBgHuOq/N/V6mvjbW1nHgR3A7cXBSDU3N+kdDTSNmPgt4EdcplDwsFJQSO
	s6QyA/QL7anvXFxl5AZy4r+bdOHku6Hp764Z1FBzdesUxptAWUz/K8jVOGEhWC1mRc9lCnr5SCm
	cmolZ2cuTX9rK8fZCKQ+Faoa+A/m0X2pe0ulayOaY8bQOBULYh6lWR+EgAVvqcJDguI12NQTWvP
	6TNeivCwjI8AufDP/cjTVBca7K/9mtW9AzLgw5BvfzPe/qvwkBg3dSTFO0/QnjaEvRSVmTEWbDR
	CwS3w+qsX8qjGcH72oLF+NL8351cOocRL9uzCYPeOUiK9MsZg==
X-Received: by 2002:a05:600c:638f:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4ac17d168a6mr314385885e9.10.1793730653132;
        Tue, 03 Nov 2026 10:30:53 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm146339785e9.14.2026.11.03.10.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:30:52 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/4] mmc: sunxi: Set the IDMA DMA mask
Date: Tue,  3 Nov 2026 19:30:28 +0100
Message-ID: <20261103183030.81078-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103183030.81078-1-jernej.skrabec@gmail.com>
References: <20261103183030.81078-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Controllers with a non-zero idma_des_shift (D1, A100 and H616) store
buffer and descriptor addresses shifted right by two, so they can
address 34 bits of physical memory. The driver never sets a DMA mask,
so the default 32-bit mask applies. On boards with DRAM above 4 GiB,
like H616 boards with 4 GiB of DRAM starting at 0x40000000, every
buffer above that limit is needlessly bounced through SWIOTLB.

Set the DMA mask to the range the controller can address. For the
other controllers, it stays at 32 bits.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index 9744b6b860ac..479420071c2d 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -1385,6 +1385,11 @@ static int sunxi_mmc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = dma_set_mask_and_coherent(&pdev->dev,
+					DMA_BIT_MASK(32 + host->cfg->idma_des_shift));
+	if (ret)
+		goto error_disable_mmc;
+
 	host->sg_cpu = dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
 					  &host->sg_dma, GFP_KERNEL);
 	if (!host->sg_cpu)
-- 
2.43.0

