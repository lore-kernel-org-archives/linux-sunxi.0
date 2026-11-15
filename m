Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723082;
	b=hBaaCK2KgKU2bNSES5PItxg8IfRxPxcjxix7GV9BUwLiHsvPi0rjIGe62DCLQppHk6Ok
	 hctlwm/jtURx5aXBO87igAiQicCXugBZclIr3buXMQOM+q0Hm4vkEUYXvgJGxT1hzjJ4N
	 YcYhQVzha6qenn5b+/0UGJcctBsaINaK0gCcg5/7Sk0VA1+V+qbiXCFNp1XfsQlQtPsLk
	 qFWIGatdxe/xLaCG1CaYYJ9PLG/FHq9Lmrw5YSW04dtO++0iXVUxEowsKrK5RPmnAAtS5
	 YZmoWVjiyuq5OWXXp4Rhmzw2qvn6LZ3rFfPIUKxXCf6hpkMFAgMyeCO2HvLewKs+sdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jucsGGsP4A94CkjewiCz+sSfRnTZY+EbzcNS/u6Mk/w=;
	b=F7n3dKBp5+himVVJ8EgiU9Ru4Tp8oUVqOO30VsznOOY+Eg+9nrRIh7acf6eObIt73U9H
	 Ua9oSHt2rZaIOW44EdCQFxbfXCOuJiGt1Hy3dJA2/DnbsORx28fShHWW8LoFno2//eBzC
	 6yvUjDCYAep3P1Y8ZHaUh64IwEirU4Z1k+6guowWGfEgtNWAiD1qIY2xfGxbzL7/Edo/v
	 kYDRI96bQWTc2kQIpBDQxWekIb1hXXrZl17s1kVOqyqI5Iau+xfQ28zICIU2JcUX98DAb
	 A3MM2Vo2luWF/hGVKABSREuLzAcrK15ff38hu6kLRVPR2HyRSgQBaDbLZujAwS+NYqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dU5V4wVn;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8011F606A32E
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 06:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8011F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dU5V4wVn
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1152385f8f.2
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Nov 2026 22:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723081; x=1795327881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jucsGGsP4A94CkjewiCz+sSfRnTZY+EbzcNS/u6Mk/w=;
        b=dU5V4wVnXeoYjyLR8q+vCnGNQiHMVBHDBUQ5xPEJGbPd19/P5sluo/u1ZUViWEmp+n
         rnaL0QDqpK9AN+wFG4lTPDUAg02KbQRYOaD34921XQExOBOA/8lEmrOy++kpQ0DpitS2
         5TnN6FIqeqt8Ff/3G66PzwGDQRtXd4co4Zkagn+XBLZTog4CT9hstueb1aPqredv6eya
         zKLghCQ7vt2yxZlmbbRjEI4YMnctp5Ub8AHyRi3HHjU43l1r89X69X8Nj6R7k0x/fEdd
         wtrcwHSZnqhWu904VI9LxZ8GDVG5UU4+vpoiWwY4cy7qIe7d/u9YeflYDICxVLXWRjbZ
         amIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723081; x=1795327881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jucsGGsP4A94CkjewiCz+sSfRnTZY+EbzcNS/u6Mk/w=;
        b=gCyBd/ihT3dm6Y83/qw4MybkTvJP9GHo4LnBkSRGgJbWQojywqxs2wkGws40bOKfuS
         W9GzqOdGo7WTn/fceS6kSbZlJRbsKuLp3vFJD7E4ACl3pLZrWvIVWx72mWnadBSpPYNA
         Ct5LdDLekYWUNyuoszkCPnLMDedMFlVGl66FmicMs5vj8qgkKbiWpD/Que6rxZulJElQ
         ch15SnLUBuC/pTmnb/lc8RLsMS9sJ4JAGPJg9Gm4F8EcDmjz1Weh8M7GsGWPAyScEOQ0
         yEro/1IjleC8IhDGtL1UnxP9/DpW4t/B8z3rGMOnKNlpT3ubDeWUgASU+4nZlXx1HnSl
         KBOQ==
X-Forwarded-Encrypted: i=1; AL+hErHJLL+HPDNKM33FxGru3J4vKcY+9HCQfFGmhZI24HeTys+Br8VxrihMSxWbfXDrCwp2lbEgFHoB8DFxdA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/vvLmBU3DfhglsgdFOtHLYlDU2jL9rDr/4KkRejdoDnIcC/x4H
	O2DBmYeagtOGSCb/mARUj+9cb59sCBaarQPniIp7EBSFngSb/Z5F9Z7z
X-Gm-Gg: AYBFou2taSecYJPtYeCFMnmbszqypI4/coNOw5fewbxtm57UqFPTZYsrSiBIEXVp0yE
	2sXv9Ih2fJ6UQux10MEpOR9GsKtehquQNJmPdzmEl+UjcfL6NMMbcs5+kU7HNtQITpM1372xWNW
	fLEZPLWMXFtI0/OLEjQBx8RiVVyEBKU9TwWWFvVHjN8jcHmjwmT5lg9ydpvb4Go/ZYSHSoEFxRg
	/0YVHPGDhD5BtHrXF/i9euDQVPJpQm5Y5eSHvV/NDo18+PzFG3YB6xQ1blXkQtRaXbjwMw6HTe4
	VW1LSOLo0lONjN4BQQA8xGWZRMksH2GHhoTvXHMJ0eSz7QqRrsd8tF3gwpEEVR/1bxPPrW8naeu
	LijGXNigLzMQsL5ClM4NP4LlDD6320APWrmaQjo7NdSaNK1l5lhOdy07Dz02JUuZJhB0gVhz0XD
	DYTpKpHDpUjKpT6err5J/fBhxcaBeXpeaii+FWMB4c6Ed18sLWIEgLcNcdsJmNXjM1lt7cQMhVT
	ZTNg0fNupViveeR+gpKRzxcOkHw/p/SBuir1p3jJG3/Ez5ywc6GJN0Izq137s0gOh01m70KPLnz
	Ji0fl8j9LadHunJ0TGmTvZc+Y00VvDHQjPgt1ajKjL5G+IirwvyMozQk728Gj6srZ2GL67S7/wL
	A0dEG4zIIlRHSRwv/lPKEuXP/0a3MMk5sAbhALTH4VeGtImCNO6HbCe4eOwgx7VDaFvSSs0d1kb
	YxeFzKefL9iGmhf/cb2O16rl0NMmkuqU95A5tr0kwoLHmAwKSfZJiVz1jr6jRES/OdP/FQwx4E6
	0YLdD3Y2vk1wA==
X-Received: by 2002:a05:600c:4e56:b0:4ac:aae6:6400 with SMTP id 5b1f17b1804b1-4bb55a48042mr148514035e9.13.1794723080596;
        Sat, 14 Nov 2026 22:11:20 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:20 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 0/8] drm/sun4i: update DE33 support
Date: Sun, 15 Nov 2026 07:10:54 +0100
Message-ID: <20261115061102.229680-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
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

This is second series out of tree which aims at properly introducing
support for H616 Display Engine 3.3. Previous series [1] reorganized
driver so proper DE33 support can be easily implemented.

H616 DE33 support was actually introduced a while back, but it was done
without fully understanding hardware design. Issue with existing binding
is that it considers planes as resource which is hardwired to each mixer
as it was done on older Display Engine generations (DE3 and lower). That
is not the case anymore. This series introduces new driver for planes
management, which allows doing proper plane assignments.

Note that this series intentionally breaks existing H616 DE33 mixer
binding, which was released in v6.17. Old binding can't describe shared
planes, so second mixer can't be supported with it, and it never had any
user - there is no H616 Display Engine node in upstream DT, rest of H616
display pipeline is not upstream yet and no other known DT consumer
implements it. Reasons are documented in patch 7 and driver prints error
asking to update DT if old binding is detected (patch 8). See v2
discussion for more details.

Remaining patches, which introduce all the missing bits to fully support
display pipeline on H616 SoC, will be sent once this series is merged.
WIP patches, which can be used for testing purposes, can be found at [2].

Please take a look.

Best regards,
Jernej

Changes since v2:
- rebased on v7.4-rc3+ (mainline sun4i fixes)
- patch 1: explain in commit message that DE33 has only one bus clock
- patch 2: don't register regmap with syscon, drop preset plane mapping
  and reword commit message
- patch 4: don't expose YCbCr color properties on planes without YUV
  formats (kept Chen-Yu's R-b)
- patch 5: collected Krzysztof's R-b
- patch 6: renamed, get mapping regmap from display clocks device and
  add device link instead of using syscon, defer probe until display
  clocks are bound, set drvdata only after mapping is initialized,
  register driver from mixer module instead of module_platform_driver()
- patch 7: explain in commit message why old binding is incompatible and
  will not be supported
- patch 8: renamed, initialize blender pipe modes for DE33, add device
  link to planes device, limit DE33 display regmap to its 128 KiB region,
  print error asking to update DT when old binding is detected

Link to v2: https://lore.kernel.org/linux-sunxi/20260509190015.79086-1-jernej.skrabec@siol.net/
Link to v1: https://lore.kernel.org/linux-sunxi/20251115141347.13087-1-jernej.skrabec@gmail.com/

[1] https://lore.kernel.org/linux-sunxi/20251104180942.61538-1-jernej.skrabec@gmail.com/T/#t
[2] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/

Jernej Skrabec (8):
  clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
  clk: sunxi-ng: de2: Export register regmap for DE33
  drm/sun4i: Add support for DE33 CSC
  drm/sun4i: vi_layer: Limit formats for DE33
  dt-bindings: display: allwinner: Add DE33 planes
  drm/sun4i: Add DE33 shared plane driver
  dt-bindings: display: allwinner: Split H616 DE33 layer reg space
  drm/sun4i: Switch DE33 to split plane bindings

 .../allwinner,sun50i-h616-de33-planes.yaml    |  46 ++++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  16 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  82 ++++++-
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun50i_planes.c         | 215 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h         |  43 ++++
 drivers/gpu/drm/sun4i/sun8i_csc.c             |  71 ++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h             |   5 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 193 +++++++++++-----
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  10 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  72 ++++--
 11 files changed, 663 insertions(+), 93 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h


base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.43.0

