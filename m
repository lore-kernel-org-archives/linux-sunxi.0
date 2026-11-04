Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818235;
	b=0k5CfFkpoEY81q0f874AV84453iay/rTw2dL+LYtE7zh66uah5o+i9dUEyvtkk5UkCca
	 C5oOYYqaT2mCQckdFuqzAncnQ3Et8nkTh7tDLAMFCN9gOFQVpc3Y9e8aRNuboI74LQBGh
	 wCbungYlVKjNCe+xrsVVk5q43W8xVbuB/DnOEVEl6geviP9ALEy5zopKSLZiqJaBC4LP8
	 2RySE5BrJywzoDqbL5o/Jx8TjJDVdqtOf/U3p78FuKCQXkFWLcE/shxcGHplEIvold+2P
	 2uJ0kHE6oY5iavH6gFkWXvZ0MbrS7ij5kWpwizkf9pRt1kYPmpjmkw2AoxHzYWaNm8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XtfG0KAvDIbko8l3jdeHS5xdiecERegTmLWZYC1nHEU=;
	b=qsZSRJ169+PurKSqKzsq7jCTzAOhkZDSO76wRMV4/fqdAyVCwlh+BYIGJJlrz/z2B6HK
	 hOQ09lUsRj98ilcHKGOuySSK/WtP9iKa1gY/mpy9e44KQn7JCi6ta3SatAxvw3LF5OI39
	 8l1MLkfBaRi4JjKzxHvICWY1xNigrnwQacfPfN+e7Qgx6LDAAUhU1WH6WGN091SJHHiHF
	 T/4Gr3IWdmXC0DriHHVLCL2FrtAESK6Isin6JG8GADxzoPm/mIfB+s+pGcGyeIHBvEoWs
	 PjO6uhL3SvdRoCihLwDyI2lEKign6Ys0aGLgrRq5QqknYrlnKALVU4lOPAUj1AvYKZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DLRVghOZ;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4332606A331
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Nov 2026 18:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4332606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DLRVghOZ
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso858639f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Nov 2026 10:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818233; x=1794423033; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XtfG0KAvDIbko8l3jdeHS5xdiecERegTmLWZYC1nHEU=;
        b=DLRVghOZPh62ev5MTpeteLaFTlF+n9gf7X93wjvcP6YtRSMIQnvSsKJcQukUshS2MC
         Z3nFJ7/xNvkfGJTem9FOuS0kx71UH8xAG3qHqdmveQftTcjN5FpsM3EyXytMnI4ILdRe
         b/o8w7oQ1tYaYGx5RSX+MrPA70fUKdsIATy1vzL85jf9vo+wdyU8zDIx57lsRRawVOtz
         ExbbLX2QRo3wQJUComvxufNb+jgZVfKfubl2Vk7Z9zsAzSzTQaJHto6oBshedeoyPcOZ
         aDEGOoJvrZw2iYQZ0yyp5oh6tP1SoNu11bm5T7AoUSPaKDF2fBn7fQcB300dQ+i7fB78
         gzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818233; x=1794423033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtfG0KAvDIbko8l3jdeHS5xdiecERegTmLWZYC1nHEU=;
        b=htNzrDriyE0aB6zqBFUZGojIzu32gcPhqrMFNviiq0htviuN9gmr0l9zMaJ3qoBmoT
         4eHXg7A/08wyusQx87NDEoUTDR/iN8o/B1ErNfynxPqaOncQcFpFHnB/SqB9k5IVxiu4
         kQHEN16ZwFpNvN1IxJtSyAtK4Qf8QDWBitZ0H6oweeig40dRZQ1/mftccg+tfoJQzW8E
         zsm4iZS56Y7iAmjmvg7CDc8zsCjxrEhUJ+vkJeURgauOupkmH0GT1oD1ld07znVLj9Su
         g3Jhpolw07BdpdoH5KPm9NkT6AS/EgKPV69p+74Opjc1vFcvGGg/nIWQGcuYmArKkaVG
         HQNA==
X-Forwarded-Encrypted: i=1; AKwUvByg8yHYfYFKnp9rE6+gq9tzS3Zca1HxPFHqo7TGN7wWKbonAhOdeS3T8KVbWZXHIFwyz+/ZJnfaED9WNQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+vnrJXdciBysFCgloQ07naUb1zYfU3rwWJP2JH5U1CKDJTGwSB
	hPPGd8YwBUWnoArtnv7B1fU52CKzU99JX7uVdN02yPQWQIGJ0gHAdES9
X-Gm-Gg: AYBFou13ZF7zLqvAO4AdADhZy7Mp6Wq6h2Rt3pS9/Z/htcCUemduh61wIN6gm1UCdSl
	ligIfQykOvAo5vobGIbZQ8dbS5c1+9sNn42TidqFbhX6ciJsiCjY3SfAByqHA4PGO9AE5kceANd
	lAzpQ24kS2hR6Dz4wmt/Qt3XBfMlKztdLfn0rkJyu62M/F4Hj8mlucCVe0UZzFj5LbpbIaIQOyt
	zg89X8HanLN1RUcmia2rI2zLxbpD34X6rVbgH/l6vcmQE2IadGY+8xthKtwFY55t4KLJ1c9R1en
	4qNlBPaNVH8oJrZ3nt5+0iuobidRB7XVYkKz29T0gmU259yxsIWYzwrr/t042vSnwHVQm00pjZ3
	R0dcS1GbmMw8xgFJ4sZR7oIuQZlxOr3j4C6LhjbADArcpAIQ1MAoegj2j9ysvAibBqV6QJKYZh9
	WDip8P/N/B0phmS0AgRFdXJHjXjg+7kGD/eYaG+prTTq8OGaYfsTwqgkiCWeT1lz731WC0isWN9
	k0HF+7+yFsubN5+v/YzCc5wXDBm0b7VSu4VBDJ/TBuaU58QXog4pf+nXg7aHqEFW/NhnWn4KKww
	nFHlNvS870xtWBuAsdjF+pc2h/e1yWDTQx/xSrAnkFrgBADRQStBGAURK3TAUfDCRM4rRQPmwU0
	5hPdMR6jLKXwzFfp8/0C3Zk2M6yJGzo5kPlb/5GXz1u/xppnv+cB7kU0ReKHujx1C8EAWB3rMK9
	xjyFERYMPs4QwdcF8SRo+2tO3oB5LO3BB5L0HkaT0rS5YPiKw8kI/rXlMSX7yIM4tha2RoDaGUz
	mBvGZfAnp1kAEMYETJ3aDmpCfsyrEDD/XT8miaz6EGtWNKSvc943YQ8GJjtjF8EKTY=
X-Received: by 2002:a05:6000:15d3:b0:490:9fe2:6a3a with SMTP id ffacd0b85a97d-4909fe26b79mr2502099f8f.15.1793818233140;
        Wed, 04 Nov 2026 10:50:33 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea1811c4sm5399898f8f.3.2026.11.04.10.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:50:32 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Icenowy Zheng <icenowy@aosc.io>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] clk: sunxi-ng: h6: Let the SPDIF clock set the audio PLL rate
Date: Wed,  4 Nov 2026 19:50:27 +0100
Message-ID: <20261104185027.883011-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Unlike the I2S clocks, the SPDIF clock can't change the audio PLL rate,
so it can only divide down the rate the PLL already runs at. That covers
only one of the 44.1 kHz and 48 kHz sample rate families, and the other
one is sent at the wrong rate.

Propagate rate changes to the parent, like the I2S clocks do.

Fixes: 524353ea480b ("clk: sunxi-ng: add support for the Allwinner H6 CCU")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index 7fccda96d444..3e8e79871eb4 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -571,7 +571,7 @@ static struct ccu_div spdif_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS("spdif",
 						      audio_parents,
 						      &ccu_div_ops,
-						      0),
+						      CLK_SET_RATE_PARENT),
 	},
 };
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

