Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FA33BBA09
	for <linux-sunxi@lists.linux.dev>; Sat,  9 May 2026 19:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353223; cv=none; b=bxQsW2FaaaxWbrYdJRDuyg/kWmfx1M6rZYPI72/49NC9Rqou9OlhshQn3oaxKN+Uk3Xn0sjCshC/juUUDqOkWi0M0Ut/lGCrodv0YjvMnNK6HM7aEfuIie81WacP9+bUS3YZSk/+p2uQVmdZDADn2rhC111bQK64WXAz/xM+478=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353223; c=relaxed/simple;
	bh=xA4oLUwYAJfz0ySyu4MhuVl6/+1Zb1gL0iL0dGi6qZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p3hfUJetpPOmGrr0TQISW6hCnnvNluosJa7KVmRVUwpLvyT6p55Ql3nUclEcP5YE4BKR6Kj8CgbV+5J/nE/amqmvIPgqJYFcyCBrjAt0wcSC8IqDKUe0SIXKiaEt1o+Q2zQJnVNr5GIezPMeP02dnuvuyw1eEigtCF05FBaIJNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q0AMDicP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q0AMDicP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso39518495e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 09 May 2026 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353220; x=1778958020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJOgLdtwku62ymp2K2MnoFiWaCIU8dOodRBTGK0ZfaI=;
        b=q0AMDicP2Dggv6NL6/tBrBvnmcPkBpdRVo3rrg5bgopyCqOchYSErcDG3nqvBznIQM
         bVgNgj1IUFVuAKWp/mbWpKmkOhG0zEhZYNUUZe8xJO01czZQBWb70GBA/MM7HjhzX9YI
         9xtGZSnA/qVTDY2EJSnjgiIrWjcD/VNDKy/lvljlOU3IHbq+nqZwGfFAky6MRzr76aS/
         YrSxApRyuDeWpJfku2fTiffPtnXYCGvWgRzMRp8IsSheYcVFdsk5lSmhJ8CMFfMgPpEW
         kPr1rjNq0SoIKfL5PZ2rdbXJoYLOGeNe6kv/oQvIZZId30EnbJfmIrzDOaZSZJq9wky9
         fJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353220; x=1778958020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJOgLdtwku62ymp2K2MnoFiWaCIU8dOodRBTGK0ZfaI=;
        b=lkT2+75asfr2rcUvjYoyk+spFtu87mLJrG+K3rPBAJdNCLMjuQA0Cbxav9yqENA+AH
         p2s1gC7LNzuCIQMTGxj7Eg2e2mNmseEk9PUJhrDkQkXkOMs7J6P8ca/rWt7P+ypdBJUL
         L+Hag3mamWvVvSGAMBeEZUkhgAGgZwX/nUzAlLXqahh2fXf/7fUL6dKu8/lzyAf44ERK
         kOobyu6mY9BfUP8bW5r0+wEy7O0wo8J7/eUvpwAYENL9HWxJTtn/phS1N+Fcqul5Z3+Y
         BZvaWINzZ8DoW2WJnaXDAha+CAI5Fi+A9D3pjyeEg8cPXuGbqrDA/EDGh4bVuRy8OJnp
         hmWA==
X-Forwarded-Encrypted: i=1; AFNElJ8gkMoQSgu0z2lGuYx3AnqaAeZQ6uMSqOdHCOZ0/mstxqyn3xybiOTa3ekUw3kaLIgluj4eyWKlQ07VBg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0gNLLr2eI+GXNLO06K3ZBv0PRTMvgwjxuTofs+HkPb7ThRhiu
	pHz0GzfVIQwOV2vOH4uURwc4TOiqViX7duwbTgnSpCHJj4Ub4H7TYN3F
X-Gm-Gg: Acq92OEELI3JqwsZuqQg3McH1S1XU/PfLvna6CGXJasaQq8k+TAmhRGSH7VCrk2pMX1
	FKOX1mf7Sufp6cMvDrqNAMKAWitpu8p8LJQbHl4ZWgeM5COwbEqzpDbI/x1MvdelJne0Gn+S1Qk
	5u9xyG1JoQX/aicui2bcl7qaFJhlmohSgHljI264f9eSeYKAnpkvh2VW6Vdke7sEnRwj5cErUyu
	vuYNlBoacRhEBK1PgBOxgOVKm2jBBhRgZAQYwN76Knr311mZS3T03pSFHla0DCLQOC3YMi2cuOf
	StrG4h3snOeEIHmAOoHgL6a1GajGDuWObsIiUxAOJgwvPkNtuNg6qLgMkOjmVtaq1gd8qdkiaKw
	scGm3GKs9F1nqw9AFIi8EV7+ir8ovyEOIKSQG26UXvcX1fpDH5CUT2ljqAxv1XQU+ptBLgmlrHo
	zpvZqZ64WwBy+LpVz/pyNvM1Tf4qmTvWDXIdnlh7zsuM47qUkj8+BSrWPWQ1hApd/34tQ=
X-Received: by 2002:a05:600c:3b20:b0:489:1d7a:4537 with SMTP id 5b1f17b1804b1-48e5dfcd4a9mr171071145e9.3.1778353220094;
        Sat, 09 May 2026 12:00:20 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:19 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
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
	jernej.skrabec@gmail.com,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v2 0/8] drm/sun4i: update DE33 support
Date: Sat,  9 May 2026 21:00:07 +0200
Message-ID: <20260509190015.79086-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
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

Link to v1: https://lore.kernel.org/linux-sunxi/20251115141347.13087-1-jernej.skrabec@gmail.com/

[1] https://lore.kernel.org/linux-sunxi/20251104180942.61538-1-jernej.skrabec@gmail.com/T/#t
[2] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/

Jernej Skrabec (8):
  clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
  clk: sunxi-ng: de2: Export register regmap for DE33
  drm/sun4i: Add support for DE33 CSC
  drm/sun4i: vi_layer: Limit formats for DE33
  dt-bindings: display: allwinner: Add DE33 planes
  drm/sun4i: Add planes driver
  dt-bindings: display: allwinner: Split H616 DE33 layer reg space
  drm/sun4i: switch DE33 to new bindings

 .../allwinner,sun50i-h616-de33-planes.yaml    |  46 ++++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  16 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  87 +++++++-
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun50i_planes.c         | 201 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h         |  41 ++++
 drivers/gpu/drm/sun4i/sun8i_csc.c             |  71 +++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h             |   5 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 131 ++++++------
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  10 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  40 +++-
 11 files changed, 567 insertions(+), 84 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h

-- 
2.54.0

