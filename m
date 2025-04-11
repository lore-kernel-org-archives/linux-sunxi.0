Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710181F4C8F
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 16:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744388126; cv=none; b=BNT3cmY0DjNlpvHvAVhryZJwebEJ4j/XDBLvF19YDl+DzPVmA0+KoMVEAOt/SBM/VG4niCIrtr5OdueIFc9q8Ie7qTzVoOMmonjvP0IQMu/57/qL892CvgEneft4yeYJKiw5Ah+I5/HpG4eZMYsjzWfw5oTwj43mpnjbahq8RPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744388126; c=relaxed/simple;
	bh=ECYgc8/yr5gFpaRdD8zI/+/+O02lM+ZiVHZFAzP9QVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J27tuwe42sVLNGCRvL1bNxZoKW/0UXFKWeWDrO6TwspsVbKJlv7NRiETJVJOZHNkSbiMGVTwYmWOeMp2lbUV9wSizQnJ73WTLtZDCLO4Fam+ywyqmQGF6+NWqLCxo3eB4Y5yUx4uwngzJYW6+ql0zZ2WaBfDfa9tq9iyuvpss6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYU8CLut; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYU8CLut"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so2853546a12.1
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 09:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744388123; x=1744992923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IGNN6aGbKHcH6Capa+ymRdfB7bDOe1OnvdR4NcBsvY=;
        b=iYU8CLutY/1WATt6jlcI3A0QmT0vuTjl+BLL+Hvh6XKL+GPPjJII3/paGaKEqOmNNM
         rRIWgfh/tnJClOoMWoEAL/jAkGxj5FyNSMKyXHA2FB57WOeUo/1H6XZ3QIOWNEWn1qE7
         6haFGk0Fh9eqj0bpS3gjgHeFlSxIptZrR9P/ysU7R+huHhBTxQHlP8kFo7JjBMrfR/f1
         FbFdLZyspDuAvetpwJiBq8tYCAYb8vhx1wNjrxwTOm9+PGPew7qsr+TAZyxzwlR5D9uA
         Zk8BZGFEOMfQ6qQ+1IBvZcTG16HooK8IvnIqqSwuALzAdp/ULxYQhbSPGvhofiixhwFe
         EbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744388123; x=1744992923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5IGNN6aGbKHcH6Capa+ymRdfB7bDOe1OnvdR4NcBsvY=;
        b=VcXuQGHK+fXpx+v6+E/lQyNlSyGMiv6fNx+usrqXRy4+8AHLgcdT9Bp3eOdjM6QUjx
         oN8jcuoMsqK1bReSQtrYSe1CPdzgg+9GmeWDmz4O0ph8iJ1+Q85FtscO7++vKtvx224y
         eu4AMqeB08Qq7admNhyOJKiRQ0HShIyzzl9fAWEWjvxn0m7sV7/ZPm3zrDEOLFmoeNCr
         v1rHl0OUwYyuPaa0s54FDrfOEONwXrthYFfN8fI5xdJyGXIGEbpEKSSZU6gTWPf7KlKb
         4P5jLEgWxToJ4KIGu++7ZCURBKktpXf8yu1H6T4YIPrA+8wcUeq0T808dMVDn3vRgqZs
         nTlA==
X-Forwarded-Encrypted: i=1; AJvYcCWNFDWvzOttKE1vsSeiK9CVb7C1ANwuWAkd1P4Ugxdjcmk29HmsoZne/hqZhUGP5aQVYUnXMnA9m6lETQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9d7N5I6BTZSude1jXMUO/74Uw4bw6cvYna/oL9sKqiaxELDmF
	tJaUYBZ21qiHM9m1pHGTeTRfF6emMyxD3r/fgCXwQ8r8/8qSKJSL
X-Gm-Gg: ASbGncswSfZV8/CBFOLjnvboKkuyBb9lqT1cF+ivZt1hZOfwGrjOKBFymTdHhUnebev
	tL0e9LhsT6tiYNg2epbLfiNeYPrYHThcnJ5JLM0zKG77BUKN1DomcNZi02KpozLX8nJWQoC8WAZ
	0DWSCeGGP4QUIAi0w3OqLiYg7TRRY/Xb18sC7Hwrn/iFJBeMawHk5Q1E5ud3jqQtLe7wlmReRfM
	gi00kEnk41Wy783BPr9y906tLVt7X5afQp40qm5MvA9yrwpPZuFtG0jrcPdveLo8De6dkJza1p4
	j6TD5EPIrlm35cuxZ7hxx44kkUIWodiPOJccz6NOO/WOj+elxQRx1j+Upg==
X-Google-Smtp-Source: AGHT+IHGPQcIH6fxyoGt0YfhSdF0afBr8xnUcPqiyOupXM5CcByh7Q/fMnwhqpNRnJzCSJMXSnSfLA==
X-Received: by 2002:a05:6402:270f:b0:5e7:110a:c55 with SMTP id 4fb4d7f45d1cf-5f36f77aad1mr2867188a12.18.1744388122272;
        Fri, 11 Apr 2025 09:15:22 -0700 (PDT)
Received: from localhost.localdomain ([80.90.89.143])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f526da3sm1136246a12.67.2025.04.11.09.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 09:15:21 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: jagan@amarulasolutions.com,
	andre.przywara@arm.com
Cc: trini@konsulko.com,
	macromorgan@hotmail.com,
	uwu@icenowy.me,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/5] sunxi: h616: Panic if DRAM size is not detected
Date: Fri, 11 Apr 2025 18:14:35 +0200
Message-ID: <20250411161439.4743-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411161439.4743-1-jernej.skrabec@gmail.com>
References: <20250411161439.4743-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If colum or row size is not detected, panic instead of continuing. It
won't work anyway and it's better to inform user directly what's wrong
instead of failing later down the road for random reason.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/mach-sunxi/dram_sun50i_h616.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index cd9d321a0185..d1768a7e7d3a 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -1396,7 +1396,7 @@ static bool mctl_check_pattern(ulong offset)
 static void mctl_auto_detect_dram_size(const struct dram_para *para,
 				       struct dram_config *config)
 {
-	unsigned int shift, cols, rows;
+	unsigned int shift, cols, rows, found;
 	u32 buffer[16];
 
 	/* max. config for columns, but not rows */
@@ -1416,10 +1416,15 @@ static void mctl_auto_detect_dram_size(const struct dram_para *para,
 	shift = config->bus_full_width + 1;
 
 	/* detect column address bits */
+	found = 0;
 	for (cols = 8; cols < 11; cols++) {
-		if (mctl_check_pattern(1ULL << (cols + shift)))
+		if (mctl_check_pattern(1ULL << (cols + shift))) {
+			found = 1;
 			break;
+		}
 	}
+	if (!found)
+		panic("DRAM init failed: Can't detect number of columns!");
 	debug("detected %u columns\n", cols);
 
 	/* restore data */
@@ -1437,10 +1442,15 @@ static void mctl_auto_detect_dram_size(const struct dram_para *para,
 
 	/* detect row address bits */
 	shift = config->bus_full_width + 4 + config->cols;
+	found = 0;
 	for (rows = 13; rows < 17; rows++) {
-		if (mctl_check_pattern(1ULL << (rows + shift)))
+		if (mctl_check_pattern(1ULL << (rows + shift))) {
+			found = 1;
 			break;
+		}
 	}
+	if (!found)
+		panic("DRAM init failed: Can't detect number of rows!");
 	debug("detected %u rows\n", rows);
 
 	/* restore data again */
-- 
2.49.0

