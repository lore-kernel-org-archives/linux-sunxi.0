Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729480;
	b=coieblXar/8drxCRFp1xeFApoPqeyXDW+Nxtt79Hbu7bYaVYA6dTDVHvabTkT3RYS0fa
	 b5Ul/sLWM0oPpEgkjszPleqBByQwe3jnzZ51XMNgJRpUwM4DY1j7cRQWT24KjTAscyHhM
	 gl/hfCBtLx+EhnTCXKaB29k7w+XrlRhPNkXpdO0TUxdXUObtqUg6F8IF02+3a0grn6iCs
	 hE6DEjSfRd1+PfdlojRtz5T1zfQPwl25gQEowgmQ98SECxVydHz6xw44k0a7mkojnIQOo
	 jHDXLlC2ubcJI3NnUT1zE26ahpDgK7aB8W5Wo3n85fgrBr1Kj8HWtghgyHmkakh2wfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cLndCsyaUJbef6+HCqjnikoRIrtmLL/VU/FOWgoJqac=;
	b=wUtVWbXU9O4M6faqa8CH3VDmMiqorKlIwIr2jhiKTyQ3q13rIyzE8Ucwm8u81tqsMjNQ
	 z+SVIBfRsXAW2iYgMAgyHJd6q/rdE8qUg4sHEwUcOO+lRp9T790R5q7LQbtWW90AugpuX
	 z6fCHj6FBCgu0pa5ihp+J4RJ2zGrF1jAk3+qclopsXVQlOEoSUb91e9IReG2CmZjfQFpT
	 hDjXZ/ZLJL3RCz1R37z2h4BE0Ac4Bfm+IDxmlSKHK25H96F9rlyVfnzeyzo8mMIwNdFYm
	 skidPKpGmkOQSibO1AyJq3LcQ7hbbB0a82Aw3lzpcYbjSRdDsomehRbfnxapQVDsEEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Cc/qlcK4";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1705D606A699
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 21:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1705D606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cc/qlcK4
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so6319642f8f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 13:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729478; x=1796334278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLndCsyaUJbef6+HCqjnikoRIrtmLL/VU/FOWgoJqac=;
        b=Cc/qlcK4bJD4/JrLy8Hkoboe6gzL/8iD0RWR6KbpZ5nZHk17eGfOCwfv27edAcCSeD
         tctQJtgGdwEq0P6SqijFNse704QsmOlJDsW97yNYW9RhjBzbO8kdv2/skVTqay1qVtlF
         cM6fhZRpi33/12odcO5pIMvilMn4OXzP4bzcYO1JBkxbaj54rnRp6ruuj/HTC95vIhSS
         bAEVXg6tvtFxfR+mFGw5SSFUZe+vUgiYQtINJTLyaGWZBAedhizNynGMTaVf2kw6o0iY
         yBztIR6rGL56pntYP2s4ozMpxyg5k8Jgd5uEV8hyBanoCEUE1W7UAouacgu5vtMhBelc
         sVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729478; x=1796334278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLndCsyaUJbef6+HCqjnikoRIrtmLL/VU/FOWgoJqac=;
        b=V1Nu3CvfQhFlpJA6TE45XhYRRHX8XgDXtVKLsLC1EnJt5XIQqofe66dIkk0xR4LSTz
         3tXfR8n4meP6hsAgD71H4YSDu1qZecIcTK+s0OncqPBOUCXRWtHA6zGfvxN+f3nWMZLb
         UKF5ba3Pp0dgmhEU7UvE7USE8gBw9iCJvoiASTXRhFZ/tfffeaibcwcDiJ6bHX3Va1xF
         2cBZLCsQrSiMqV2ziW/yM+sda7wZp4KF1G7oIXPgqTwEbJCu/1yioYJda7vy63H/5LjV
         QM5sTRt81lG/YXmTqrywXifq+lgfNikHMwJYnfIKGf5FFLXp+/YjHKc/sSA+BP5rYIC0
         R3/w==
X-Forwarded-Encrypted: i=1; AL+hErEsOx1fJvCpe5BbMu97duUPBmh+fj1sERKu57GqkVSdjkaPDB4C8Aa5BKghzUYYikSrWa4LCGYKr4LKWA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+4G+PhwrMyuE6mCggrWms66RYLUhjyFLME1RalWZUu1O0+C1i6
	KvbGwjXJbTrsoyEopDAVvtQkAMxdH8lYWzOrpB1voLgfDgpCbyXHePza
X-Gm-Gg: AZFdTZcKg79LVnsdB92Y1RJ5ZOtGz87U4YX707KmLEHYPWVilJAIlFEkjv/eOslm4eh
	YsTUB0x553ou3Aui3W2t0FkgDOYTUeP8G/VGaRzSrnJDihRWRW5mCgh/cQFTjZamYiok3kjtb8q
	E/8ieCTt5grrDzrsJjdu6h9lMcfL37BMgdOLoqmLslRO8hoKSFJ7J44UdIql4tKPu9eL5zyP2wq
	0hLjW/0ThEFdrOrenoe1aINIWVjKGvUo9qVFccXPQpk1T5rwXIODu9m37ZFILEzFeoYhMtSoIrM
	IrypqF/yrlqT03NrjSZyQEYlPUvHaCwVFZPvMgBxpxQECzPtgO/CREPxlJ0Wt+B92wgDmlTh8ja
	w1rIG1XmEhcB7SrvKj9a3BcHm9gbO27rIGkjr96jQkYLmtY5yz6LY9lW34OAFRSpLFGAb/MSUiz
	13CVoJTurqO8nLP0zyhVxW0Ip2ZRbylx+P4PNMnAn+j4QMdzXSgnbwuZiNRdcI1zfxrIPJhRUyg
	QX0kt7GwyZXU7n1Da7Bp6VGzBVoCnW8rgNIkNOiAHz/quaJH99bBzqIuaZM2Ky5ettyVUqEf53C
	Wyo1GIu8aeg+e7GFVGKKoiLXdl5WW7cnO7Vn//kH/dtpmjcvBHs+HI4jYQokpPq0ZdGiw8E7Y6u
	rt8cRcu2J26d2eAvO+AJ7pHRhuqKhBkWJAuSnVFE6OgO0SvfEeVHsDnuSrdnHBTA+PlvLUnpbk+
	jbujq81pzfcu4GXWwJo5nu8qiPFzlqaxNfMJfT+YvK6p0RRAWgmLqEy8Jn0wgJgAfR5ExGVP9+F
	S0Ho/Tu5umKfgrnfyFfUn/OW2b8pC5hmcLTuOBfaHgTYkDfeCB+anIO3f41He0=
X-Received: by 2002:a05:6000:2607:b0:48f:bb92:c5a7 with SMTP id ffacd0b85a97d-4abb0c5d665mr44566145f8f.9.1795729478381;
        Thu, 26 Nov 2026 13:44:38 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:37 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] drm/sun4i: Add H616 display pipeline support
Date: Thu, 26 Nov 2026 22:44:22 +0100
Message-ID: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

This series adds the remaining bits for the H616 display pipeline:
TCON TOP, TCON LCD (R40 style) and TCON TV support, HDMI PHY, display
engine compatible, DT nodes and HDMI enablement on several boards.

TCON LCD support also covers SoCs with the same die and full LCD
outputs, like T507: both TCON LCDs share one LVDS reset, so it is now
requested as shared, and TCON LCD1 programs the second LVDS PHY. TCON
TOP now also routes LCD TCONs to the LCD pins explicitly. Dual
link LVDS is not supported by the driver yet. As on R40, only two of
the four TCONs can be enabled at the same time, since there are two
mixers.

HDMI PHY tables follow the BSP: PLL settings per TMDS clock band, like
on H6, and BSP specific values at CEA clocks, including their 1000/1001
variants.

The series is based on linux-next, since DT patches touch boards which
were changed in sunxi dt-for-7.5.

Tested on T95 Max (X96 Mate DT) with a 4K monitor and with a HDMI
capture device: picture captured and checked at 25.175, 27, 40, 65,
80.14, 88.75, 108, 119, 148.5, 178.2 and 297 MHz. 4K60 at 594 and
593.41 MHz shows a clean picture on the monitor, which reports
scrambling, lock and no character errors over SCDC (channel 0, the only
one it reports).
All capture device EDID modes set and checked twice, plus 15 hotplug
cycles.
An earlier version of these patches was tested on MYD-YT507H (T507)
with an LVDS panel on TCON LCD0 and HDMI working at the same time.
Shared LVDS reset and TCON LCD1 (second LVDS PHY) changes are build
tested only.

Best regards,
Jernej

Jernej Skrabec (11):
  dt-bindings: display: sun4i-tcon: Add R40 TCON LCD
  dt-bindings: display: Add H616 display engine compatibles
  drm/sun4i: Add support for H616 TCON TOP
  drm/sun4i: tcon: Request LVDS reset as shared
  drm/sun4i: tcon-top: Route LCD TCONs to the LCD pins
  drm/sun4i: tcon: Add support for R40 LCD
  drm/sun4i: Add H616 TCON TV support
  drm/sun4i: Add support for H616 HDMI PHY
  drm/sun4i: Add compatible for H616 display engine
  arm64: dts: allwinner: h616: Add display pipeline
  arm64: dts: allwinner: h616: Enable HDMI on several boards

 .../bus/allwinner,sun50i-a64-de2.yaml         |  20 +-
 .../allwinner,sun4i-a10-display-engine.yaml   |   4 +-
 .../display/allwinner,sun4i-a10-tcon.yaml     |  11 +
 .../display/allwinner,sun8i-a83t-dw-hdmi.yaml |   4 +
 .../allwinner,sun8i-a83t-hdmi-phy.yaml        |   1 +
 .../display/allwinner,sun8i-r40-tcon-top.yaml |  33 ++
 .../dts/allwinner/sun50i-h313-tanix-tx1.dts   |  30 ++
 .../allwinner/sun50i-h616-orangepi-zero.dtsi  |  25 ++
 .../allwinner/sun50i-h616-orangepi-zero2.dts  |   5 +
 .../dts/allwinner/sun50i-h616-x96-mate.dts    |  30 ++
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 420 ++++++++++++++++++
 .../allwinner/sun50i-h618-orangepi-zero3.dts  |   5 +
 .../sun50i-h618-transpeed-8k618-t.dts         |  30 ++
 .../sun50i-h618-yuzukihd-chameleon.dts        |  30 ++
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |  67 ++-
 drivers/gpu/drm/sun4i/sun4i_tcon.h            |   2 +
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c        | 170 +++++++
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c        |  15 +-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.h        |   3 +-
 20 files changed, 895 insertions(+), 11 deletions(-)


base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
-- 
2.43.0

