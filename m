Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F305128E61C
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649350; cv=none; b=U0anLx7wpVLPyfQcXPe1zFRXKurF9hTkry8I+neK4iZ7ugpbPvmybo93CQRTWcJBahIUQ5xQBHImDG84wM8KwqWKcQPcfabqDx/LwOPJQnI1EuuXjCM+Q9wt3VCkEEqtw4mOtQh3a8cGza0ydoza9fJruTw8xWYvcWuzbTJRXWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649350; c=relaxed/simple;
	bh=Hm9q5o2rYDsqjHYjSj1Uvjx99/3HGNtWp9xI42EEBpo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UcvwJvvZESp7yhHawZtC18AqQDS0b/FfgwCTJ4D4FGgLkdddrnOIJFxJKPihfhRWBGGPDnjrDJblQh4sUyPPVCR0jY01iGEt64NBPi8nynzk2JQvCrw1uVZbygRNQNjwczftGCxC2KnT+R1fQCa5nOoA3K2ORMnwakilCZ8oiYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXzdHy+S; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXzdHy+S"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72c1425fbfcso188867a34.3
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649347; x=1747254147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6WxAsVZwuIlKrsCCu5XYkgSaSZ+q+xbI2lg/jdck3kw=;
        b=jXzdHy+SfdHoyTvmdhwRH6y8yr2sjpcq9bOaUjp4d03UUVfhEMZ+V88oXUi3Pp8+Lq
         Cv1SKHfIfm+RR0NPM82+eDhf1pI3+lKJ5hHiqnBmrKq6Pv6+/xlOkJ5bUH9dEkHW9cy1
         wcggLV/Tz3N3kRIDDXv0CQ0UEDChP7UxyVF+W6dwDX1U1VMh3EjASd0crQRrrjoTd3Zo
         v9/wi3LJBrnA9Socc/eBSVj4rXS+JMh0if3Na8hJFKpXub8bWAqgbsBSqZJn+Ya0160D
         cStpTRXAj1f0jJQWjfZhnrBYXdBFQykh5gqgUl3iq0jY+5dTyv74128rOQo87Px5t+SX
         6B+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649347; x=1747254147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WxAsVZwuIlKrsCCu5XYkgSaSZ+q+xbI2lg/jdck3kw=;
        b=Zwu8IBTn+M4UAbyGJklWqRTJofQPFlIgVY/9jwY8OXw6Us+TLcknaLKpCvBkmXEkk7
         bws3im1IUv1Nlrt7vlLy8aCavMenq6mFH7gU93LFqMuQbYLnFXk78u2wN8nrZsDBhT2b
         6BGiOYeG63ZGujzI6YSIKlMR9J/1z6Y3B4465IGurpvy41qKVJM+/529KdommH8yZaJm
         nlpMJgP6hKirRnFA+kFUCXuN12R4IsT6p0xhY8wm28R09AnlyCbLycIWEspktUBT3ScR
         cV3GUT7lwcK/SqHZkaa+UlMUsCKiGml+GW6ULHI9PJf26ywJ/SLQL5WTEzaZ4QN71jao
         oF8w==
X-Gm-Message-State: AOJu0YwkmCuVp1yegfQnS5Sberrmwd62rDWWxCgeAw9VYNbgUr2VnGBI
	ho9oZTtGy5RV9aROh/GUe1EqmFvEaJJmj2YGGOss5oN+sWYuJ5pwLBbAeQ==
X-Gm-Gg: ASbGncsC4XlcGC3oyeGvqi9zO4hxOK5oC16PG3GSdEkpLgWrGcmdzS6OhEYVjr8duJG
	wcnPexFl9CUBBbmoCR2VJY7ZStvYshtzHbOJtGnXvbR8jYVdga99+idHPBoxEAkqRryA95JCscH
	FrtkliaaFjca4c0UyTjQpXduBe4kQnMHqr68LQ6j3AQWtUAHU/YyPCQgQTnhGycQJWw+UMwewgo
	jt9lxKe+bfzctD+PCJZrpEJrKb/fmpImeEjrX2vgKBNNoaWMed8qfYlgWJbgzI6ZK4xbyVJSg3W
	jcdhRchnsWhQaNDMaltgWRyIUS7u9CIrQF8aclNDyXFMTWodEz+OtlUjLB81
X-Google-Smtp-Source: AGHT+IHoe0JkaM3Y80DR2zEp9shvUEEimkHkCWgil5PClaq/7bVrL+WbGs9IXYdqS4P+pZ1L1ee2tA==
X-Received: by 2002:a05:6830:348a:b0:72b:9674:93ed with SMTP id 46e09a7af769-7321c948d40mr427028a34.24.1746649347434;
        Wed, 07 May 2025 13:22:27 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:27 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ryan@testtoast.com,
	macromorgan@hotmail.com,
	p.zabel@pengutronix.de,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Subject: [PATCH V9 00/24] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Wed,  7 May 2025 15:19:19 -0500
Message-ID: <20250507201943.330111-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

I've spoken with Ryan and he agreed to let me take over this series to
get the display engine working on the Allwinner H616. I've taken his
previous patch series for Display Engine 3.3 and combined it with the
LCD controller patch series. I've also fixed a few additional bugs and
made some changes to the device tree bindings.

Changes since V8:
 - Combined the DE33 [1] series and the LCD [2] series to better track
   all patches necessary to output to an LCD display for the Allwinner
   H700.
 - Added a required LVDS reset as requested here [3].
 - Added compatible strings with a fallback for
   allwinner,sun50i-h616-display-engine, allwinner,sun50i-h616-tcon-top,
   and allwinner,sun50i-h616-sram-c.
 - Added binding documentation for the LCD controller.
 - Renamed the de3_sram device tree node to de33_sram.
 - Corrected the LVDS reset for the LCD controller binding.
 - Removed the PWM pins from the pincontroller bindings, as PWM is not
   yet supported.
 - Reordered the patches so that a binding or a device tree node is not
   referenced before it is defined.

[1] https://lore.kernel.org/linux-sunxi/20250310092345.31708-1-ryan@testtoast.com/
[2] https://lore.kernel.org/linux-sunxi/20250216092827.15444-1-ryan@testtoast.com/
[3] https://lore.kernel.org/linux-sunxi/38669808.XM6RcZxFsP@jernej-laptop/

Chris Morgan (24):
  dt-bindings: clock: sun50i-h616-ccu: Add LVDS reset
  clk: sunxi-ng: h616: Add LVDS reset for LCD TCON
  drm: sun4i: de2/de3: add mixer version enum
  drm: sun4i: de2/de3: refactor mixer initialisation
  drm: sun4i: de2/de3: add generic blender register reference function
  drm: sun4i: de2/de3: use generic register reference function for layer
    configuration
  dt-bindings: allwinner: add H616 DE33 bus binding
  dt-bindings: allwinner: add H616 DE33 clock binding
  dt-bindings: allwinner: add H616 DE33 mixer binding
  clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: mixer: add mixer configuration for the H616
  dt-bindings: allwinner: Add TCON_TOP and TCON_LCD clock/reset defines
  dt-bindings: display: sun4i: Add compatible strings for H616 DE
  dt-bindings: display: sun4i: Add compatible strings for H616 TCON TOP
  dt-bindings: sram: sunxi-sram: Add H616 SRAM C compatible
  dt-bindings: display: Add R40 and H616 display engine compatibles
  drm/sun4i: tcon: Add support for R40 LCD
  arm64: dts: allwinner: h616: add display engine, bus and mixer nodes
  arm64: dts: allwinner: h616: Add TCON nodes to H616 DTSI
  arm64: dts: allwinner: h616: add LCD and LVDS pins
  arm64: dts: allwinner: rg35xx: Add GPIO backlight control
  arm64: dts: allwinner: rg35xx: Enable LCD output

 .../bus/allwinner,sun50i-a64-de2.yaml         |   7 +-
 .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
 .../allwinner,sun4i-a10-display-engine.yaml   |  39 +--
 .../display/allwinner,sun4i-a10-tcon.yaml     |  10 +
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  34 ++-
 .../display/allwinner,sun8i-r40-tcon-top.yaml |  13 +-
 .../allwinner,sun4i-a10-system-control.yaml   |   4 +-
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 224 ++++++++++++++++++
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |  64 +++++
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c        |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  25 ++
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |   9 +
 drivers/gpu/drm/sun4i/sun8i_csc.c             |   4 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 168 ++++++++++---
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  30 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  27 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  14 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       |   6 +-
 include/dt-bindings/clock/sun8i-tcon-top.h    |   2 +
 include/dt-bindings/reset/sun50i-h616-ccu.h   |   1 +
 21 files changed, 597 insertions(+), 88 deletions(-)

-- 
2.43.0

