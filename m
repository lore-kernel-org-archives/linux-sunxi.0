Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717792;
	b=Ev1a02vuBfaa6n/BbaQy1+oGD/0XHY5UB/VceznL5w1ntLuc4pAOB/cvggTeLrWHOpMh
	 F9bnmPxjFo7s1Uyx6riPdqGhOeLc5ubXTPvo9EXGVdnb1ddkKegPe7LZ0i3/E/hH0HNgV
	 cG09sNQTDBttin0FWHwY2JAweHuGHokmKSgxbWEMJm0IE9J6d19XEIq3BogQWTRPOYUl6
	 Y8rOcYP3FoNKCpxkWbYnP8B1MvNeEITlRCZaNki+EocBOkvDNPU14qv07d3v30ud8/THT
	 C3zS4ljWGu+6eQKkavQ4+ZPIfpO7RO8mEanrKmwBOcKXaSD+hLErO6/r0e3SUP6BXcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/q8f729eKxMWvV8pzxhn9Gn25ubKt4vbGrfRah8m1Uk=;
	b=q9yr91mggHN5I8SpdjZieLe3jler9xNvq8I/0eXZgNFNRtS+Cx8H9i03n9ZW82sJa0cK
	 ze0h6tQp+MsDPt6Q/YvpWv2WWUdB9+52xS3BbUByp/wNa/rm0cweIcaTuVvUXSUbGMPsR
	 fB5t2f6DNupC4vB6pYiFyPjqcEgm5Bmt8bglMfnaQvjoTbIURe6F16tO9q3vSSyI5k222
	 23wk1tzKf0c4R2myHvAe28r0rVxxii03Hv/A0jbIuyPiAbXigP+Ra49KBoZHzbLXg7jjR
	 jEIgRgQJnsGUt/gpzuLFs/3+ArKZS/KHk7X+cWCiEAss4IZoWPlmpuVh4xq3BG8/nhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D/yksuZ8";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18FD606A331
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 18:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F18FD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D/yksuZ8
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a9be758734so4654793f8f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 10:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717790; x=1796322590; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/q8f729eKxMWvV8pzxhn9Gn25ubKt4vbGrfRah8m1Uk=;
        b=D/yksuZ8vxCrWjwLvMIp3h7zGmvu2Ub78RFa8FC6bWmKj5DsewLCzw6eIPXVuVZssM
         BDdUAVHNJCs8TjEg3s7nmVsi5cBgyFKFxQWmT2umzVFYpqsUCEHXryYDiFIkuOT1LKZd
         yV/6sIexvz41romJyWLYVXwBJaJLdKFdQILgB6mCH2tNKA8+4mpNsSpzft3Cop12EIBe
         67Li6mffN84EGiTPhWm4W38BuRqOHRR3hhfiXCtc+F+TqrkUhbspIm2orb8M2D1Q49Ej
         gBoi46LWQVPQajTsxuWyF1VN02aENeBoUIp+EmgW5iP1msw8PE38MlEs8lCRnSLK2EFB
         qTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717790; x=1796322590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/q8f729eKxMWvV8pzxhn9Gn25ubKt4vbGrfRah8m1Uk=;
        b=yhGQD0CEtPTG3XfgdL3KpWOKrb6Qa68Cx/YAJ3z5Z7FEM3P2AzeSWhHwnDc5FBb3Q7
         PAVcPcHKGV8j5wsQroznuksxkcnSl2r00ZyXuwr0CT2G1StCETeuvBYZEV3wCypVXH7h
         BHlFaMBGOQ8GtS1MxOOuHmYKM91DKpVoVmY56y2hTuxU7+n6V1Fl+BFulKo8dYjelKgX
         ZfH7t5oI1XLcBnvPs1c5yaXP237DEH36IfHsDNInPzet/RBmhqRRthwXKz2tdlWiG0UB
         AC7cdjjqVyJHdXJrp5IaHKwFawQwOqkhf7lAztGq3gauTY+AvU8Kq0ARegoFMO0SL59y
         KO6g==
X-Forwarded-Encrypted: i=1; AL+hErFpTCQRLLr3VntJoXRHR+hVMWHuUWDI+W8kutDEirnP0bCV7FOkPt45j+gG3d7ZFDelHY06+19+HB67Dg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9irfiQe60ZnGaxjbl0t56ncuhtkQMl4enJRo052LxVIk0lTYlm
	Y8cB+BsnreFLgwUeei3qguGmX9NQUgMDs/XURKE5YQtziaHxQHrV0n32
X-Gm-Gg: AZFdTZez0tOYIWm4Oxb8uTosHHsXR/JnceUd1AJbVuO1JNkqgmPAaunhlpzHg79qaJl
	7RbkZzBVeqqN3U0GhE7yMYgWixB48RVsS7Lf7Ipb2mmgRlq54XPPvcXCSVetzAeRXFTmBmUyeNg
	bSwx/dXbBT6j6NuUJ9QD1uOyRC0uqWsXBN3A8r5mzKJ0k3yiwrw5UGSr4siHKdIgJgebgTqkuDn
	KpvAS1C5nBrRfmKrflLg619hmv/qF+MDsDivXwW4YTxyMVRdt4wEJ/ZpdzU8QJPZzUjDvO6L7kf
	5NEBjy+wiuAUW/thmTN6F+tTMGS+9q7ca/hEYLHr0lEtlelBU4cxLJiNu/xybfASZT4QLjI7JWR
	qU2lfydTF9SdWNZQ9aL8oq+60LMp2quG6UGFAHo48qxZxDTcOYjoUR7dxBrT281V8i+9q9d/h2k
	eYKHX1tvnbJpCOR8F9x9RExHMqJ7LU2+hoXU9LVR4P1YfK7eZloUsEoqWsYS19hKvTKou4jx13K
	rgSZUOVAIG+ycaxVpSXFBVwxHQvFdxzASD+utLD//vHr2ib4uh6EEMrws4hC3gyw6nhagj7/lJX
	s1D0YQjxD+NEtOnAIwrIfO5vB8uH3VfLU37uPMR+NvgeZfQ3WNlFp29Y3ah7hrBStayUOGlYkMx
	NYYZq5dvB+UfQ6Ka5QjOZ9Ih1XkQKsbmSgR4gnEBPA7E/OznHnc1fco2xARFBfwWs+IeM+u2mHc
	n/q/vJAMHUpszuWjJOnkaxO9d7T46x+bjW3B84x5mp+bNtUMBCQ54J0s6EopKpq6tVNB4O4cg9d
	JLlg+usOfphz5ywxTMhwBscIGJtNw1qtJqqs2YYhQ==
X-Received: by 2002:a05:6000:200f:b0:4b7:6dcb:e906 with SMTP id ffacd0b85a97d-4b76dcbea3emr16532367f8f.43.1795717790229;
        Thu, 26 Nov 2026 10:29:50 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42382159f8f.41.2026.11.26.10.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:29:49 -0800 (PST)
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
Subject: [PATCH v2 1/3] mmc: sunxi: Set the IDMA DMA mask
Date: Thu, 26 Nov 2026 19:29:42 +0100
Message-ID: <20261126182944.3136900-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
References: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
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
index c7fda9c66537..c53d47576864 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -1390,6 +1390,11 @@ static int sunxi_mmc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = dma_set_mask_and_coherent(&pdev->dev,
+					DMA_BIT_MASK(32 + host->cfg->idma_des_shift));
+	if (ret)
+		goto error_disable_mmc;
+
 	host->sg_cpu = dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
 					  &host->sg_dma, GFP_KERNEL);
 	if (!host->sg_cpu) {
-- 
2.43.0

