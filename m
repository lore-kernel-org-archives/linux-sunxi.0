Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328751;
	b=USqxn2tBrmDKcsHIBynJSNnmhC1hj6A4BEa/0GfU9ywd9PF9lL8SKrWry2Uk3zjPK5Sd
	 Pa97/VOYLIjVzVjJzyVuEj4/9eVhwaAPl/kWGBJ1miSAxoVZm6Wz2tFXK1VT4faSkAbCS
	 mEj6qdb/VjVgy7lkMV+kz+bxQbs9wpAlTK7m43lrS9QRANbIhZkROlop+2cXCa8xppLxA
	 VMkWCdiA6JQg0VU9chB16YoqyvscdC/MGgHdWNAbxT47EWEl6xbMutbzvX/qkqHNT3G0Z
	 I/5AX+++x5yzscrdW27H9UgeYEUGiw3u0cAAWVdZBxJbNcA+4Nm0hdwXtReF/0zIq/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GnMoHkTM6iQtkpAgle+3oy1uhVcPxUIIpLVPaorm1V0=;
	b=sKaS4vCh/1dZHiU+14EWap/YdUzC3rYNvrFEXnNcPCip9FFFKBREteLi5Yw1AQykHXin
	 DoMlQqvzL9kYfP41nNt3l3J5JLd+J5eZg2KeXwO0b5MK2bs7xy9jvgL/RemKdhMqLfv9K
	 5+PTb5EGiPBEwNtATPi7m1Gyifzy6FlZJoQ9NDMr/INcsF5fWn2lSyJLSa6+53I5xKnV3
	 uiRxcx9TxoexcD9B4GhNLzMRXuieS8S6NFXLNniqRnSew8sVB7dNRM0NSh84YFKoYX1jU
	 vxLnJDJldTGT3JjJe1MoaG+OUPGcLKDw4K4lgJnYNimq11SAyrwWv5Ei7KPT1+Ix8XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="G/4+AJGj";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE637606A209
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 16:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE637606A209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G/4+AJGj
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1931905f8f.1
        for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 08:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794328749; x=1794933549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnMoHkTM6iQtkpAgle+3oy1uhVcPxUIIpLVPaorm1V0=;
        b=G/4+AJGjdKAhf3l0BPDvjDKU5HPW4pgImJooN0B+K84YtD9If5rdIG5mEep6XyxYEz
         vNF1DW4xowobWcCT60Tp+6RYiiX3u2JjJytp4m+n2W4IAkSHSx2jmGWjmenNpWCGU52D
         wuppAJYLP9hmqvqURkBK1eOsGAj/B3p3wEuokzFGrqbKN4xspla7NZBV6uqCS2zYQd7E
         S1L95cpBPqvOost8ypNSVnHFyh8rhijDF+eOQ4bVnRBIeJpRvVPYmxtuKDJmx63AmpWG
         U1nMOtdmVwOiAWbAQ5W6H3j0uYC9ehTn51faekrHFNPm1Pq4vicnVog1fX+5iyjKzDNC
         /RUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328749; x=1794933549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnMoHkTM6iQtkpAgle+3oy1uhVcPxUIIpLVPaorm1V0=;
        b=fVaZ7+H45vHXHTbFvYOU4fvj5usjNlc/bVJYF50c3LcZdohLmA2tBchRh5pJMJd5R/
         7TRou5afG1EQ6Tgk3Vb/fTWPrVB03sew+Bsffy1/h8XzXn42SmYjzzoDYOMdy9ImfPfI
         5tD1SC2rRE1lv0sd7DN+hVIvQOybja4Z9xXg5drKlpowaQAX4oSes25wUkhohKn0Mnb/
         JogSdZcNRLc/WSiz/FYKud6JdXxUhZH14KMApetu2wWFca+3wlyRYlKhKIzJABv57R3F
         vq698tpQjDPO5VgWY/UdjOzfMYYvZIWku4Um5ONG+6HynBC+ylqG4TXHKVY/yKmXxQ0u
         HoYw==
X-Forwarded-Encrypted: i=1; AL+hErGkrn+VREUw+FpsZprAh5WuJJIUG9wR2B2gfVMiG/hyt4RJIl/SV+zTCAhPKZOxKMF8lNquZSB5L1X5uQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8CIEfIxYHkmldbiVamIsV3l1fqWJ17syiWVCkju0U+I8DZi0W1
	Nd949GqTSm73CKNiSRJFgZpgG7kJvYt3Ag0iJ0OWJEkQqXmX6pts1syQUwRcvQ==
X-Gm-Gg: AYBFou0X3Tg42N39jXKPP1JqZxkfHcZ0Tur8dSQLdSpmFFRMknZuB1kE+iAFRD+1mhc
	LuDi+/nJAIwFnU/K8HEqf8AE98pKIOjMEsbftsb1oW7HJa7NaNfXnkHz1V8ONuOC8M4mgkYV2q8
	fVjZPGNBFgsf3FPFvymrHa20Rajh9aMCOhUA8OP7p7b++Z+swZq7fxB2nIg4qGVLoh2ATZM7dCZ
	pPmP1xXWsvPkGsoxEfS7fCXr5fU4z+dPBkyjfhZa00N16RE3DP7/833qKNDLHlJy1ko8AblUl8A
	duUiEzMHtvr7oYmhOxhixdWkIVd7bWtsJPOfuFAtFkmbX3HVpUPIsZi5wDoqy9CmRTqLeuEssel
	LDisi8tHrbwuyoL3udBhjQW4yX6jJzKKqJIJZ1XwlQdkSyxnOcnfHKj313tRJi2rsosZvXfhVCq
	sAVL9TxfWgBD3OL4sqP5T6JghkeucpdfIgmkmYhhB14MN3AgMJhfQIYJpJ7csQVILdFA2so02kR
	MnXjGMBBKWnNWFhZSgiuSCwOjX6darDgmaZ3ZVekPQWJXJgF1278WC0FPiTusmvYfyQo9HrN3bz
	ReSTjwtN8eGJf0/CTogzZ6uliPQEGPNl86drMS9evvZxFshUpRNUeWi/+HlV8DUfn14I74BJIw3
	9hS8/VE1ylND5R+bpZgJXpanMTAIw+pMQ42DpKRCF3kOULCFmoG3REcKjYv4TxRhZBly4+4xMSZ
	fGWj7LuhlnjexWeIhTb6bjNp2OKoNG9c3Ks2p75kFwiJzrY1RSt6AUBb0pSYTWfARhbIdBK9pUr
	x7wAKcAM/6l86NQeHMQT8OOaiu9VP6grFhqcXuSSA==
X-Received: by 2002:a05:6000:25f7:b0:492:4156:b8f2 with SMTP id ffacd0b85a97d-498318fccdcmr5748430f8f.54.1794328749233;
        Tue, 10 Nov 2026 08:39:09 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm5888355f8f.10.2026.11.10.08.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:08 -0800 (PST)
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
Subject: [PATCH] clk: sunxi-ng: h6: Keep both parents running while switching VP9 clock
Date: Tue, 10 Nov 2026 17:39:04 +0100
Message-ID: <20261110163904.1098187-1-jernej.skrabec@gmail.com>
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

The VP9 clock mux only switches while both parents are running. Its
reset default parent is pll-ve, which is off at boot. When the Hantro
driver sets the clock rate to 300 MHz, the clock gets reparented to
pll-periph0-2x, but the mux doesn't actually switch until pll-ve is
enabled for the video engine. Until then, the VP9 decoder has no clock
and every frame times out.

Set CLK_OPS_PARENT_ENABLE, so both parents are enabled during the
switch.

Fixes: 524353ea480b ("clk: sunxi-ng: add support for the Allwinner H6 CCU")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index 7fccda96d444..a10f0502c5c1 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -336,12 +336,17 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(emce_clk, "emce", ce_parents, 0x6b0,
 static SUNXI_CCU_GATE(bus_emce_clk, "bus-emce", "psi-ahb1-ahb2",
 		      0x6bc, BIT(0), 0);
 
+/*
+ * The mux only switches while both parents run. pll-ve is off at boot, so
+ * moving the clock away from it would otherwise leave the VP9 decoder
+ * without a clock until pll-ve gets enabled for the video engine.
+ */
 static const char * const vp9_parents[] = { "pll-ve", "pll-periph0-2x" };
 static SUNXI_CCU_M_WITH_MUX_GATE(vp9_clk, "vp9", vp9_parents, 0x6c0,
 				       0, 3,	/* M */
 				       24, 1,	/* mux */
 				       BIT(31),	/* gate */
-				       0);
+				       CLK_OPS_PARENT_ENABLE);
 
 static SUNXI_CCU_GATE(bus_vp9_clk, "bus-vp9", "psi-ahb1-ahb2",
 		      0x6cc, BIT(0), 0);
-- 
2.43.0

