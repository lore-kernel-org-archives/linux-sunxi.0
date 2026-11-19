Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110884;
	b=VBlk1NgzY3q785smgkSXRhQtBMhZHef8a6zelKpQvYVpuVm+MTHrjRDJA+OkiCbGr7Cw
	 D4deBmG3wSBQJ8pmP55nnNqLAATwt3A70/nkC6SbJdIme6EiNmBJzN7i6oa3ZmUYp6UPD
	 MpdV47U9+6Tv9TnPY/dZ+J9FN30qxB/MNjg1IRq8XDguHN0GCmczGDKdcyDxT8wTHo2pf
	 NR06qw5UwJIDPO1fNoCzGCKVGZFzoLoes4ORuJLM6hBaRCL/kXUNI8PZMMHl5IZCytg3C
	 7ITQ0yRaW865tyjSAAuM8cFU1oaVP/5Xg6J7ey/txNoLD51apTrRcInXowpChyOWKpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0nkkB75c4xO0BDbMTd+oRdUsHv55miDUR/T7l+kfobY=;
	b=3aze14VL+Pf8SVi3gfS+8dplhi1eEYW2EtHWtkP+W3H0nZ+U3ET7xNt9Q+hbvOLnMPfm
	 mHXZUqskN6uJjvJNfbsMeuP+98qtp7a7+5Bd75w5hEkPUeYvKI6dyG+S8O//in5JSz9ir
	 OnUi2PlQWK3n76LFW48uHmo7WePYgoigcho9AjQ1PeR4LLJMEnT3rhLEPcZnEPVSEXFWa
	 P20xBYN47RHg9Twt1tlyKTjtee3jdLVeH4N56z98SxVoPwlnsyc6ix1Ff2Up/dFoQvjF0
	 32nf4oz1QWpgqp+5jj1S9582FXr8LWZSQdqutxcxeEFsoQyfnphPK56gRCr5WX6jURw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PwtLi7+3;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B443B606A32A
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 17:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B443B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PwtLi7+3
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so25141485e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 09:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110882; x=1795715682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nkkB75c4xO0BDbMTd+oRdUsHv55miDUR/T7l+kfobY=;
        b=PwtLi7+3D9TyWL/vTXAJxZBa+rhBx/uhpE/KViPzPqE7Z735q5G4YbfDBtdMIODK74
         v1iSphE+r56/3fKatpwDCgik1EFbPPxwI0FODYqVUMTQK8uQJfoyNxlHCSzJQcAZ4ar1
         22hbxgRcdu4iR9cTLqFhPX5N3jw25V4WXS0LXhBqiokrLKOk2kRb5BKeEgc9ES+w5NHC
         /yoQRsZSPsWZFmvDk70hTfn11819+VPRarOPlR8Ar1s87vo1pe0JSCVN5fUR/oKQxtLW
         bNA0WsZ465G3OAxgHXRnvz+UC7QqulWjSAjVmpRJWCzEl3WAIQXFHi3CKPjdKTFBPa1P
         4NkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110882; x=1795715682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nkkB75c4xO0BDbMTd+oRdUsHv55miDUR/T7l+kfobY=;
        b=Lkqa9iEk5g20YPJ35oPYhmECyQKnmEQXYtpHUob96/k9fvhaf1YrkJFMEK5l+Zl+ia
         BQLK01qfuyrXg3FpyVnMxbxdUN+JKoFlWmExhfD9dtGgD2+vioMOFHM893MWGKFkNBsN
         DIosxC9gJlOXzPMxE5w+nNPHLl5X2fTng/jDEpvoGlg3i/wFcSH0nBbczfckkwIusqJq
         59VP4NGMG2mdnLxfDIHDB8GsPNnuxzbGowYLfwNfFQyOo6mC+mLShZq4TQd4UhnXr4hT
         MfyvBXJQWAWrc7/B+V4ey/KWkJrFRkZIjLcxWd49HaUj28rnhFotsSuJEKwZThyijlDH
         1aLg==
X-Forwarded-Encrypted: i=1; AL+hErGWQBtd7LXaCotox9CCqwWxMNqTpb4LXskFe2dSRAprRtCf36fWFzcZwyFzxwxXSb6g2JxIy4BnXm99Xw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/lnd1LcH9Zp9zBQ9PIfOx6qJqe/LKpxP7ljKNGj/xhBwJcC53k
	tNy8v8TCJYq6NdnR3UBVPXpOIZtqvhvBeivnKEtNvcxhf6ip6yKfokaj
X-Gm-Gg: AYBFou1DICXqUmFuFlGYeUvLqlU2qF/jKgrwBz0/UH7kpf1dbWcM2Rhio/U2LeW7CMA
	l7TypIX38H7xONWt8d+6IFcCnA5/u0tXGByLEWCBbhmQQZyoz0e2bYZ4z4AJGKSnnhVTlgAE48O
	d+X930XaQjydtWMx/01aObZAb+mu6/mN8FPJ4t19h6P/yil52LlfS53xoFZqy0gw04frW4iPZiZ
	xxYTiqFt7yZykbmvAudZ9upbX4jBXRhBUSL93hIbUBhgIoBip0lRfkcc+qsHQP7WuUNNLQ+O5of
	9f3yK+p1c7WC6zFHJlhUeK5JmEwB5oCXSUrmI1FjJRMR0XPEI1Gepjg0cIYKgI4XiWKniKA63uE
	WP1pzxagMRZX/tmdvJL1Nx1i83CP/wpGNm/4A8ROW21TLaa+Re+hCW/70gkMAXD4mjPJJcUUnUD
	IbWF0SrbwOE5F1fTGFNK2EE7Ny6VK+P7cNiogvt2zdLaqEXspZ0Mjs3G2H0PgDQdgmtixzHfgt1
	M1gvvXNg5spyTIJOAlXym11s/anF4OUak0XPH6EqIcPxVXzCrkKeYJVOS5gHZt5woLrDK6mnf0p
	esNmvXEfKNTkGRbP0qkiMeSUGTapt5N6Wrv2wCVeyFlqBMzbn73Qn8EUEmYVYW1A70Ek3y8oZWI
	2kkmqpc31+42TosfPQp0VyutYyJzs5y4oQtJDmlkmYJ3Ew4mOhC185pI+hIjrXTp8j7SIXp9XBD
	aXckADvuE9iRD+sV4rQkzhjF5CnsBczSUBWY4m29fy6kal9VR3Z0zE7NH1hVL0/vnUX0l9RKN0p
	a31JKarAqpkUQ0MTxfr6tf7Yazo9reyh9sxjwuvvLY/K+Pr1CdPvN4l
X-Received: by 2002:a05:600c:1548:b0:4bb:7347:d5df with SMTP id 5b1f17b1804b1-4bb88814405mr6842365e9.13.1795110881961;
        Thu, 19 Nov 2026 09:54:41 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:40 -0800 (PST)
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
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] drm/sun4i: update DE33 support
Date: Thu, 19 Nov 2026 18:54:32 +0100
Message-ID: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
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

This is second series out of three which aims at properly introducing
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
implements it. Reasons are documented in patch 4 and driver prints error
asking to update DT if old binding is detected (patch 5).

Patches 1-4 from v3 were already applied (clk patches to sunxi
clk-for-7.5, CSC and VI format patches to drm-misc-next). Plane driver
depends at runtime on commit 63a29fbb4ecd ("clk: sunxi-ng: de2: Export
register regmap for DE33") from sunxi tree, otherwise it defers probe.

Remaining patches, which introduce all the missing bits to fully support
display pipeline on H616 SoC, will be sent once this series is merged.
WIP patches, which can be used for testing purposes, can be found at [2].

Please take a look.

Best regards,
Jernej

Changes since v3:
- dropped already applied patches 1-4
- new patch 1: reject fractional source coordinates on channels
  without scaler (suggested by Chen-Yu)
- patch 3: mention in commit message that driver is hooked up only in
  last patch, update copyright year, drop unused of_graph.h include,
  use dev_err_probe() and MAX_DISP bound, collected Chen-Yu's R-b
- patch 4: collected Chen-Yu's and Rob's R-b
- patch 5: fix include order, use device_is_bound() under device lock,
  guard put_device() in error path, drop stale @map kernel-doc, rename
  planes platform device variable, mention missing scaling in commit
  message, collected Chen-Yu's R-b

Link to v3: https://lore.kernel.org/linux-sunxi/20261115061102.229680-1-jernej.skrabec@gmail.com/
Link to v2: https://lore.kernel.org/linux-sunxi/20260509190015.79086-1-jernej.skrabec@siol.net/
Link to v1: https://lore.kernel.org/linux-sunxi/20251115141347.13087-1-jernej.skrabec@gmail.com/

[1] https://lore.kernel.org/linux-sunxi/20251104180942.61538-1-jernej.skrabec@gmail.com/T/#t
[2] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/

Jernej Skrabec (5):
  drm/sun4i: Reject fractional source coordinates without scaler
  dt-bindings: display: allwinner: Add DE33 planes
  drm/sun4i: Add DE33 shared plane driver
  dt-bindings: display: allwinner: Split H616 DE33 layer reg space
  drm/sun4i: Switch DE33 to split plane bindings

 .../allwinner,sun50i-h616-de33-planes.yaml    |  46 ++++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  16 +-
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun50i_planes.c         | 209 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h         |  43 ++++
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 191 +++++++++++-----
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  11 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  24 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  24 +-
 9 files changed, 486 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h


base-commit: 8e2afcd2b57990465f132367fd8fdc2e55c1adad
-- 
2.43.0

