Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8047B2FC899
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763216056; cv=none; b=dTwS0XTxONHH7DUzWHvyR78DPNcpNdf4vwtT0E3iPjFnnOePP2XOAVNj+2AtFoV3oeqTjN0mlU1W7ADU5Y6QLo4xqVycZjucTktB9SBnE5lgmQi+W1oSF3GYVYWytWkHnk+OV/ox10Hi4ZHtgMeG4r+UuPrzDabT2+12bjID2wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763216056; c=relaxed/simple;
	bh=vHkwErpfhnxxsv02IcLQLhIy7rGI2ZohNEYD9R+2700=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=URMUt7IG/zkyp+z1O7g6wqFlrgiQNfvLnWfloli4DR2R173CIrgBtLEDx6lYOtOJoNYlrvRAELSitc7nYLk5EuDQRH8T4vbPScrnVOgNf9OxUOX9vzDrc8lvugWrzJ+DT5FttHS4z+WC7kb4WmSfRcZHn1j1oxfCc0tlWb43pp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrzycjAk; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrzycjAk"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so4713679a12.0
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 06:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216053; x=1763820853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tO9M0rK2lTwB71cTYp3Jpf3ChX0WRs4mW1Amu6CT/w0=;
        b=lrzycjAkZc544lizZhj6esGvI3gp9mcDViQ/5sBLMO6La9oxUDjCDCMBU91JY83xbQ
         63OV1xgirx3uOOA+Iybn9dfMqLs7pxsPCJbDYqbXQ8frPyLNpTRohKFcPwBJPq7knK/r
         AgYLbDNAtNQi2KDazrMpTNgluOLGca0NbudDXVAEmf2JELyn2vdfWVT0ctUuxPx3UIQ4
         kDQb/pepc2APu8jCiFQG8aCJn61F9H8HP5dV+qtZ8K/hZ6JRCcW58sgpFrOBa9hxbQ5K
         1y448j8+hXz1JWJCMygDoNcGUwzmXv9bUJS5wE6SM7nFiuGNjt9gLP22DhgO0UfXgfNc
         gzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216053; x=1763820853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tO9M0rK2lTwB71cTYp3Jpf3ChX0WRs4mW1Amu6CT/w0=;
        b=iJMKb6LjmBK5XDHHOMkgMJLzgtlo9MQU7S/ivNbHUZTmw/Z+AWexYVcB/FwM2kurhv
         j+HosbR8R4bx+5fFalmBNNUb7eylaJMXd4O+H9hu5Uo7sWQ0/kG9e9UU547tC6uFHTua
         6ypyA+T8ykma4794Z7bTC9yKbSEHZsvQEvgeg/h3J4Y20rfiZacNE7UJkWd07RTql68u
         qarOLzT9pdQTV7S6mZAKQtA5oNg9QwGoBjOt3s9ePwIXl38EzkH5SvJqGmN5PZjR8v7l
         7AfbvUOOC36/jxUxD0vdAbDA93bbF/FPsXoIBjnLt8CkOSaIkz8JWMEc5wp3aFZsw++u
         +o9w==
X-Forwarded-Encrypted: i=1; AJvYcCV2cDCBgoaDLtjVpdfu9cnbBjjstmZm6kXl+CpqsdewKWpPcwnmgGPVJMCsUljwNjznO3VPmndf+SSFJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCW3wwMoZByjZJUGBG1zrY3v5/SJSkHi9Lr5wcOSprBape7/ZH
	N2h507kGlI3CHn1fQO5m4v0GmLjy3gR11uUeJf4DCjW+GryjjTdxmQFM
X-Gm-Gg: ASbGncsSqkFEqbnas5ok7YZOOFEgAaV4trFGSsXvN48h0/0T1NJ35RjUBcb4ym9cr4u
	sJXWk7Oz8HbxA1VrSgUrlvvNckutzvOd9JjG2hBLDvGNqRAvbm1LSZQzsfaeNPihiaoQJwMb/HN
	vqaUcH5Ct7XaDeNKvyo3oI7usk9otgWvOAjEQ3/Wegh/BVBqWFARnKzknLlqG+NpL236cHgziD4
	RjWQ2g8yz/IVSjgSpfWdmIon2wclly2dLgRszFZ1ESqzy+l+O0y8Jg1mzCZ7i7ondMC3yQrDtla
	LaYdH+aNK1tgr/EUQAbvMiRyOxYr/TXtnWsMaHTKwTlsVtPkmhJDFxvN7Rpoc4hxVtu8sb46lQF
	3W5yZ6wOyiYwx07HiwLfykGlTdFSGSN6K2EJ5uPOuD4sBG/2VSGnw2Uoz6OthxjCtNEq4dFh4wh
	c9w0nNzEhk7UgCLtNnIsYE8jDjbViKmrWpg3cVBKOb+62yg9FHkbukHpob
X-Google-Smtp-Source: AGHT+IFp+Taw68EnwDXLkJFHgktvsI4Q2Kx6E5s2D/JuSsEx96b8Hqrxaybkmry8X04xeOfOSy8LRw==
X-Received: by 2002:a17:907:25cd:b0:b72:6383:4c57 with SMTP id a640c23a62f3a-b7367b79f4fmr713777466b.55.1763216052568;
        Sat, 15 Nov 2025 06:14:12 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:12 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/7] drm/sun4i: update DE33 support
Date: Sat, 15 Nov 2025 15:13:40 +0100
Message-ID: <20251115141347.13087-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is second series out of tree which aims at properly introducing
support for H616 Display Engine 3.3. Previous series [1] reorganized
driver so proper DE33 support can be easily implemented.

H616 DE33 support was actually introduced a while back, but it was done
without fully understanding hardware design. Fortunately, no user of
H616 DE33 binding was introduced, so we have a chance to update bindings
and introduce proper DE33 support. Issue with existing binding is that it
considers planes as resource which is hardwired to each mixer as it was
done on older Display Engine generations (DE3 and lower). That is not the
case anymore. This series introduces new driver for planes management,
which allows doing proper plane assignments.

Remaining patches, which introduce all the missing bits to fully support
display pipeline on H616 SoC, will be sent once this series is merged.
WIP patches, which can be used for testing purposes, can be found at [2].

Please take a look.

Best regards,
Jernej

[1] https://lore.kernel.org/linux-sunxi/20251104180942.61538-1-jernej.skrabec@gmail.com/T/#t
[2] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/

Jernej Skrabec (7):
  drm/sun4i: Add support for DE33 CSC
  drm/sun4i: vi_layer: Limit formats for DE33
  clk: sunxi-ng: de2: Export register regmap for DE33
  dt-bindings: display: allwinner: Add DE33 planes
  drm/sun4i: Add planes driver
  dt-bindings: display: allwinner: Update H616 DE33 binding
  drm/sun4i: switch DE33 to new bindings

 .../allwinner,sun50i-h616-de33-planes.yaml    |  44 ++++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  16 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  53 ++++-
 drivers/gpu/drm/sun4i/Kconfig                 |   8 +
 drivers/gpu/drm/sun4i/Makefile                |   1 +
 drivers/gpu/drm/sun4i/sun50i_planes.c         | 205 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h         |  43 ++++
 drivers/gpu/drm/sun4i/sun8i_csc.c             |  71 ++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h             |   5 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 130 ++++++-----
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  10 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  36 ++-
 12 files changed, 543 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h

-- 
2.51.2

