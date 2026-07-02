Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C6A3A6B82
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 18:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015908; cv=none; b=KYhp2N+dTif8auDsGbusrpGGL5a3QH3rPb06LUaxAVEBr542MBVeWuPweQzIR8/8864zGJrosUbfxRt5XBhVwPdREM5QmWxdaWiZBa2u1bJ5v+To6tBuoksHonmO9NiXTlOljVo4827mzK6JL3C4goP6Pfei8ddwR/UQ5SJkczo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015908; c=relaxed/simple;
	bh=hwCMbQOiZREN6cIUCJHWWmm1HntdXr3h4PlM+Tbadsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2LVJE1N9Jmo/UuEw8a8xWc/mB3MZwhF14FP9FwHmxl2ODoaLnnPdpBgKO8aCpCxDbtUzUatPUIW4lIGB0QiMn+bosbXv1U2oIhCZo0e5mqZqs0n3RB+UVaCQQKmHbLyjTsSKifd1S7rhsYkIvJRA9DJ53wc+80+0CLxYT+mD5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxr/5I1m; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxr/5I1m"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8f186025973so20533306d6.0
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 11:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783015905; x=1783620705; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtCCML4GCtPrAf6qduQMkfSK95cYT1SxvrHR4pZoPOQ=;
        b=kxr/5I1my3xVOCeS9gtJK7liWQXioedUesqm/uAoTWopkxlYXHkbYGswIVb/tHllYk
         eV/C9Dg+llU1SzFGBmttfSsM8aPSO/u92KxMlxwMSLzn2PUC4r1ABEsXLTi8KDsKmt7t
         PSWam2Hc4PEbvFF+Mc30kB2UsAi4u3Gcyk7753gACxCfyTlsBlWWjoLzXg9XPOYwUWS7
         whRkNfLWIP+LOmez2CSFUGG8AIXC+pSVJdJuqRYvond0UclOzQ8K1Bww5kVtonsvqc5o
         u/WKplcbPjLPWoPvEcyllQfHF91hGbjTUdLtUimyX3TcHAb6PZjH8Tq6xOHke/iWRxZN
         pCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783015905; x=1783620705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wtCCML4GCtPrAf6qduQMkfSK95cYT1SxvrHR4pZoPOQ=;
        b=f/xf5tDhXv7rnQLg3XjXgwXHfpGMkhJXQedBhmPYZBB1Dy3LpBzA7OxqvlUnJmfRpy
         0c58rO3qS6lBXb9pX6m27B0/RySwGFUQYuduYrlDa/Mm819hnIBNfsS5scRcHnNNJHnZ
         QFavjEcwKdWIA2B5roZ8oB9jukB0cgwzJGuLfY1wCqNg4GGPK/v/8Nyd2KxgcjQB3Ddn
         RkMgxsp3I3d6rE4Hp0zeBAm/X3wdlo2hfK3NMY9QW39RQZomTFhSoh6gpdFgHMjKoi/c
         7wWbVm6bnp2Xbnu42vT5EA82M6sweR6Ij1pkdc6WdCSx2P1r4ix1dBqRqkpQhKC6sWeZ
         QnpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vpAAxMKrgR3yjwB0m3iv/u7FTaR61qnEpofMe9vlRbbRiqBbHltgROAN38xSv+d+QwjWkSw7BikpqdQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzzX/EkqGn0haOpUZJuoHw74418H2iYJtXKN/aw33ahc1OVAjZ5
	voM3F0EKomIikC0Hx7AGalAgrSclPPM2wQNw2TXOlH9k63xYIcQUmLEO
X-Gm-Gg: AfdE7clxa9MxIe4Z27EzDzQpjsAOE43o1d6Wx55FNuXsDVGcZEr58RGd2nELzANRN/N
	jjZyWmEEZqQ0vsJEwT6umDZy/zq2HCmYHKexQhsgyZqIT7mlzQchByGksvSwxCYreUyvVyGfke7
	xsUBb6RagfzjLBMKP6RWtIHEfDhF+A6MujLNWNzagtLvEL3Sq++wSQNqj0kv+Q7LkIWw8n+Q1QU
	fbeIAiBSVBsf8OjS4U4fkUaczXJtuoMqedxpG8ltbJZohgx6q5Sx0K0cfn2cixzMzOSewbPg/1E
	fBmAKKTkj3ElvJKfznanvtvZS4zLeXx/dj/R29InEJJTT6gh9NQvDJ5iDkaj6DCqUiL0/QjDv13
	E42eFTc7oaFK87TX0YKpel1Lr+kbBoK8PODsB8xL7mmMxJcXA2ElY2KtsxF7tMaQWDqowVPfDl7
	yemVnAvtj+Gi8I2CtJSFy+iFlL4OCk9yv9cci8yq0Reake18Z4L+QDtXEib2N4lORAIQn0ttA=
X-Received: by 2002:a05:620a:3722:b0:92e:4927:1ffa with SMTP id af79cd13be357-92e7825b2d6mr905846685a.24.1783015904823;
        Thu, 02 Jul 2026 11:11:44 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80194291sm274217585a.37.2026.07.02.11.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:11:43 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 8/8] clk: sunxi-ng: a733: Add reset lines
Date: Thu,  2 Jul 2026 14:11:40 -0400
Message-ID: <20260702181140.883070-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-8-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-8-36b4e9b24457@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Same exercise for the reset map: I compared all 121 entries' offsets
and bit positions against the public A733 User Manual V0.92. 115 match
the manual exactly (including the multi-bit GMAC0 entry - 0x141C bits
16/17 per section 4.1.6.212 - and RST_BUS_SYSDAP at 0x7ac, which is
what makes the gate offset in patch 7/8 stand out).

The six that have no register in the public manual, in case you want
to add provenance notes near them (as already discussed for other
undocumented IDs in this series):

  - RST_BUS_SPI4       { 0x0F2C, BIT(16) }
  - RST_BUS_SGPIO      { 0x1064, BIT(16) }
  - RST_BUS_LPC        { 0x1084, BIT(16) }
  - RST_BUS_GMAC1      { 0x142C, BIT(16) }  [GMAC1 question]
  - RST_BUS_GMAC1_AXI  { 0x142C, BIT(17) }  [GMAC1 question]
  - RST_BUS_TCON_LCD2  { 0x1514, BIT(16) } - the manual documents only
    VO0_TCONLCD0_BGR (0x1504) and VO0_TCONLCD1_BGR (0x150C); there is
    no TCONLCD2 register set in V0.92

Everything else in the reset map checks out against the manual.

This analysis was done with AI assistance (Claude Code, claude-fable-5)
and each finding was checked against the cited sources.

Thanks,
Enzo
