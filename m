Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762531;
	b=0rnQAUUHii34Ykkaid4YC9n7G6ef50zDHIH3ga2dvsWXfrPa1gOlI6PPS7nYU9a5/Nm4
	 NmsYpinNtoOz1KMprooKUP5Myt28x6qDMgRWUFt8K9mAnD5ucFiYfBfLFK1WXZbhuHpLd
	 FPSyPwtdKWwdUMHwWIN/nsswZivf3yG21wmx7/sJzzWRVDckgiaFv9zqvKWFX8JY1FhzT
	 C0ZGjkyJAURObWEpYR73QpY7d+Wjx9vrY63Aw5tKkbK68tY5+xMLsbhXSX8wBm9nf8yn+
	 UmD8yCQ6cbKfaM7RgfjHW3MDb5Rwe+d+R0WMQagscpdUvLYPG9/tvG1y2D4R26ozbmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a+xGChd51pjAnzNAyJIB1hBECSnermEzAtXmmjhgIfQ=;
	b=y8OEoVigB0O1F45idgB86x0Xa4PRr4cIe1lRlAZ+Gk+0j7OEDYLXBi3qvpCjTuGKs544
	 wqaNYyFWNFkVwQyABw0sA3OemHntL+CfPyeC5TmByRPstKzliIF41UmeVX3jSx8tVFtQ0
	 OuAr215Zhhx5Z4i236eybsOukW6c8wIK57rfUurLQcgbnPAmZBO4TilI+fdjEZpzjxFji
	 FYeEHhlFjfPES2Va8daHt94VbKJEGjJBQoMCbOL01yu1xXnGiUik86KuDgFzXMG8kMZoB
	 QRoO1l7JE2AAY7HpXVWlizF8z6aSx8+a4SV+1dUkREagnL5JZUg//HGK7zFAugHVN7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vOWjVwUp;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75AE606A31C
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 06:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B75AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vOWjVwUp
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492690dd5daso5916206f8f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 22:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762529; x=1796367329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+xGChd51pjAnzNAyJIB1hBECSnermEzAtXmmjhgIfQ=;
        b=vOWjVwUpN9l2jqR35hknhGjQU8ilSZwYJ6jdmabcFHdCaZwr1sW7oQZk48gy91dNkr
         oO99EZYG1oCgWKVMq7dFpJ9pu3cArTXacJXRqBLj/z8LJN3b3x6XyDNI4Bsxk0LrJuoT
         J5oHukRouq1VTzEYS5HPGhYAq2BO0eUjOyNaT0UqFMhnTSXijPERUKZ1sTSo32jlXJWn
         UExY4GFuxF/t/EaJqmFKWlZPAwrElgyOG0j+uz0HUgY+J0gwuoOjYyiMZFOtFNJ0s+N8
         JGJIOoCRtJ2a1fl3DAs8yN4cB/vAlHz9q8T4y/lG9gWzQyWVQ3gXpH0/O1abK4EGcQBB
         RynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762529; x=1796367329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+xGChd51pjAnzNAyJIB1hBECSnermEzAtXmmjhgIfQ=;
        b=Hx0GFaqRVsutKVERtevvpJVgnCmlVawpBbqmvD7KZCDsbOdz4jtD3TS8nJtvhXp75t
         pe+Sof1gV0DllNizjt3vyLjHq0NE5B/UEnBaQvteBw0fPuGDasDDYwGqSdLNwo1YRgle
         YutbmDZLpauB2REF8qvjj5xAwILC3E3NoQP8ihgiHm/o6KjMXc6qMjtYL6SrM5YZSjZS
         gjcSArrlw17R3u6guatt5QJXj7tBJDM4ciRL1YYCExwkaglZyDFcHMYvT9uH+EyAOYuM
         FNLkPabkp/H5UTlSlOxYzUQ7yCh0JDSJraChfVhN0s2H//zbizQhwU2ig5TNloI7IJyK
         p27A==
X-Forwarded-Encrypted: i=1; AL+hErGzfE/V+YdXaf2TzcLOCOPLE9+yMQY6VOO2GI198vewZFrZ8huz0rCbxKK4SegWodUIRX9dd/Nm2bsyZw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8So7KVkRyEJEbz+Gz+Q1M4FOU8K3K05PZsvyRzSX0pXD58OfWI
	FiOzKkJTJP5g9yTvYZ4h/FZUVxtO9UPMiPZtIkx7ncLYFNb3sA8SYlSS
X-Gm-Gg: AZFdTZeTXzEYDmeGOHiHd7VuB2K+pB9wcuNM9kkA7vR0WCr69K9gR3Hd69IVOTE/zCr
	3AgvHtbTO5fa7iSwsnDg9X7fz/q66TdvC/ZMBIvgXaIwQqzcVP8bHf7Nbf2jkeYK/s62acJxdm5
	tQKWVumKQuL6l1wZMDAQMDuhp1GUwrcoXM6hzDau9GPK20fuZJUNOfuCNsvCifhFI/J5d6/nAjq
	HH7JNhdVBWweURG9udKQTzzJJ97LkDUeCKaWQ0Fi8ochx2CrtYGQqTW/1YPzo42SJubapCofhjV
	0GvdrssQQP50y6kMHJSToDlOOKi/pDX7yLr28jp+N+cApXD3NvoQkO5xx16U336kTVI7HAlfP4m
	x7RtPP+9QgxYoaoXDPO33OtrV70Jjrbsyrk0qInI+emXKYiieueJKKyiGOT7XDSM7p3j+pgDDIp
	bQWfwBshfk2awohLo8zKQFMCfxvkOiy14RSqPyzHIj/K37+bGuuKv8INRgvAqEdql97djvi42Or
	Y+/+kuoINEiWUAYkSBzpVnn7f+EaiafvB9XJOEedjchq4MZIatILHyV7pNkr8TjFpB9VuQ+Ixio
	06SzSn5mYDSc0YYVxZZ0G/xF/96fcuCDpiUD9GE+kadJl25Tbxz/1QEKOn7lH7t8f0XpcW2rZg6
	wXhw7WlmYt8rPomUXVtOhmtBQ44d5aUgQZvqmJdVExDgG4F8L5GrwT0cZrlOpDt4FF+LFMxfqrU
	6qVSTh5JsH8GhJZpMhvGsyJtxRCiPvarCYPcOcJIxQfP73IMsDHDN/plwAB/vMwSvveNhWLZVDU
	pilCVr9u/qgaj7aUzHtdGzjJecFWF6mjCad+xwV5Icnr3Y6BPrNeif/epshPpE=
X-Received: by 2002:a05:600c:3b1a:b0:4bb:875b:3d91 with SMTP id 5b1f17b1804b1-4bb88820bfamr501199575e9.30.1795762528879;
        Thu, 26 Nov 2026 22:55:28 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm42574611f8f.34.2026.11.26.22.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:55:28 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/3] staging: media: cedrus: add VP9 decoding for H616
Date: Fri, 27 Nov 2026 07:55:20 +0100
Message-ID: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
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

This series adds VP9 decoding to the Cedrus driver for the H616 video
engine, which runs VP9 in its H.265 engine.

The backward probability adaptation is done in the driver with the
v4l2 VP9 helpers, using the symbol counts the hardware writes back.

Patches 1 and 2 are preparation: the output line stride is taken from
the capture format, and the format check is moved into a helper.

Patch 3 adds VP9 decoding. Like H.265, 10-bit frames are output with 8
bits per sample for now. P010 output for 10-bit VP9 and H.265 will
follow in a separate series. The decoder core is reset after every VP9
frame, as an H.265 picture of another context decoded next fails
otherwise.

The series is based on my Cedrus fixes series [1], which it depends on.
It doesn't depend on any other pending Cedrus work.

Testing
-------

All testing was done on an H616 board (T95 Max, 4 GiB DDR3, VE at
600 MHz) with FFmpeg's v4l2-request hwaccel. Hardware output was
compared per frame with the libvpx MD5 files or with FFmpeg's software
decoder; the other capture formats were compared plane by plane against
NV12 output, using an LD_PRELOAD shim that forces the capture format.
The 10-bit decoding itself was also checked with the P010 output of the
follow-up series, which matches the libvpx MD5 files.

Results:
 - libvpx test vectors (303 profile 0, the profile 2 4:2:0 10-bit one):
   275 match the libvpx MD5 files frame by frame, the failures are
   listed below.
 - fluster VP9-TEST-VECTORS: 242/305, the same vectors fail with
   FFmpeg's software decoder (FFmpeg rescales frames after a size
   change, so the stream MD5 of resized vectors can't match).
   VP9-TEST-VECTORS-HIGH: 5/6, the 10-bit 4:2:0 vector fails as its
   output has 8 bits per sample, the others are 4:2:2, 4:4:4 or 12-bit
   and decoded in software.
 - fluster JCT-VC-HEVC_V1 (129/147), JVT-AVC_V1 (130/135),
   VP8-TEST-VECTORS (59/61) and MPEG2_VIDEO-MAIN (7/43): same results
   as without this series.
 - v4l2-compliance: 49 tests, 0 failures, 0 warnings. A test program for
   invalid VP9 controls, formats and jobs (57 cases) passes.
 - NV21, YU12, YV12 and, for 8-bit, ST12 output of 12 8-bit and 10-bit
   VP9 streams (66x66 to 1920x1080) match NV12 output.
 - Decoding VP9 and H.265 streams in parallel instances, in 46
   combinations with each other and with H.264 and MPEG-2, gives the
   same output as decoding them alone. Heavier parallel loads need the
   decoder reset before every picture from a follow-up series.
 - No IOMMU faults or timeouts in any of the above.

Known failures:
 - vp92-2-20-10bit-yuv420: the output has 8 bits per sample.
 - resize vectors (vp90-2-21-resize_inter_*, vp90-2-05-resize,
   vp90-2-18-resize): FFmpeg reallocates the capture buffers on the
   frame size change and then refers to frames of a different size,
   which the hardware can't scale with this buffer layout.
 - vp90-2-13-largescaling: not supported by the hardware.
 - vp90-2-22-svc_1280x720_3: inter-layer prediction from a different
   size, for the same reason as the resize vectors. FFmpeg's software
   decoder fails it as well.

[1] https://lore.kernel.org/r/20261109175016.42061-1-jernej.skrabec@gmail.com

Please take a look.

Best regards,
Jernej

Jernej Skrabec (3):
  staging: media: cedrus: take the output line stride from the capture
    format
  staging: media: cedrus: factor out the format check
  staging: media: cedrus: add VP9 decoding support

 drivers/staging/media/sunxi/cedrus/Makefile   |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   53 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   35 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |    7 +
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |   28 +-
 .../staging/media/sunxi/cedrus/cedrus_hw.h    |    1 +
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  131 ++
 .../staging/media/sunxi/cedrus/cedrus_video.c |   50 +-
 .../staging/media/sunxi/cedrus/cedrus_vp9.c   | 1253 +++++++++++++++++
 9 files changed, 1548 insertions(+), 12 deletions(-)
 create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_vp9.c


base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
prerequisite-patch-id: 032ac086f7ba6944b648a3581a1c287ee06c42c9
prerequisite-patch-id: 30e6f5a647b929dcf501225d403dc1f68436079f
prerequisite-patch-id: 309f0f4b5228ee3b0d3e3b80426429a67e238d53
prerequisite-patch-id: a448a9c72886221eb9b1aea1778a88e163d96309
prerequisite-patch-id: c49f2932a2258bcf000e0e4907e9636b2958b350
prerequisite-patch-id: 3c5110c4b6f13079a09733b972de4cbf38d3119a
prerequisite-patch-id: 78a7e370ba08a94aaaf4cbce49f89432151a9089
prerequisite-patch-id: f62f865eccdab559e9effea5b002b227fc0e3bbf
prerequisite-patch-id: 9a09dbecbbba3731dd2518606a02e12d58e433a6
prerequisite-patch-id: a952ffa6ed148ba0f6b9f5253848b7c8fb2f89a8
prerequisite-patch-id: 9879769cc1ed540f2739c2bf8b43b42a41c6ad8b
-- 
2.43.0

