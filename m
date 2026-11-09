Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246667;
	b=iczlCtVwH0+w8mf+94UYP4KV1Rh31wlMjjMykIRdL7pBU8NDuyLu91XLh7I1PVhxIXc4
	 Mr8NWBUT46ZSgnb195kBPTFDkUsxqE/5WG7qw8Ia8jLOUhP5EpbZBAlRGL/i4BqoFXXIG
	 nzg3K7IimEl2Z2Ajw79eDOxmwby3XzKkbv1Ten66iOe4bkie07UQDLIdg/NB1LEBtSAnx
	 aKJAiqqeZdA0pIsadSH+O+uHPxfibTOTDocapdL9T3cnXc2rQDdDDaYgqET2fogTXProD
	 T7nUbjDFOHCnQiyJj1oH6iBJBGLjW7ut/vmNCWs4WCccvZtl0SFPZeCFLJtsI7go1DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t2EBWm0WsMjUhoHR6YsRGN60RmHktL80iMChWst02Po=;
	b=qxRG+7KgAMuLeB1ytNA1KlQQggDW9ef+wu8fJele1aj9JE9oUUTNLd4JjaMnERZdsrlD
	 kQRO9IJS3MjBvTFesDtbjkISgfh9cUQmo/JE2M+vxk6oXiOX0w2F0c+lhGywFwfYSX/v6
	 KX3+UdISsChpxA5xlYyzbV0v3oyV0hBpMltsJ5nCddF/4qpDFxicoYFP4IrQBIxOeYNJs
	 U+ZwS0P647thdu/T4JKib80CJVU/7FokApmCtVZpUDlFEpVNwLYmZX5dLB9XbPo8rYd4F
	 6zRTioas31dQfsChZtISpQG5Hu2USTTeSEMlxoQSalke3qYWncXFgUgVC03LXgGWXQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WkrHQLad;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3FA606A331
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 17:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB3FA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WkrHQLad
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492690dd5daso829650f8f.1
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 09:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246665; x=1794851465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2EBWm0WsMjUhoHR6YsRGN60RmHktL80iMChWst02Po=;
        b=WkrHQLadvu+NT91SRMzMLbVYkHVroI9pO6jMHtX0Y9Q4ZbvrWHv4x5aciAGYqufd/f
         ErmEgFy5IzbBKic/vdRGNDUzMFnmNHiWPjPYQfSePdSMzOWf6+C9UnoRQ8sxKPYmW3lv
         2ScupWl+v1Xjx0+YZiL0J2eDPFCHM2jKH1jGEy8/aoPuZLuSM5lz9l+QQeMIyxMYpVoq
         pXQZa3/zQICmVRAPUWyJAKDy4BdNcMrwBEn9OYJ9jWolpcHvvubFfeRdx4/6PyY1gskO
         sj61dV7B1EuhIJA1Xi4cSQ+wcYsvIn3VPq+gFosoeuUHcOcOOd/GpImNVNqg7gkr9sJM
         2oAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246665; x=1794851465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2EBWm0WsMjUhoHR6YsRGN60RmHktL80iMChWst02Po=;
        b=XHkRWY+ywslYRG0mLCFUPdicOvbJ6ch4SuRathMwTVfE2RvxRLyOEV2elhRGgXUk43
         vicSoXfHLYaGZRPiYpez9GSyvxSie4SWuSY9t/eRIHKECwFeVjRn1b2Jdh93oeC7PybP
         jLyaGBy8sMcgnssftJKbRbvcJZIv4BfWNtcaBB2QgYN2CKd0CDddizzCUQ87HhSdInen
         oitsAygF01GpFEU4KhPQ3Rn572+wz4mdiiwX967JutGMzMOd6WiqMTgBblcxsUJovGXq
         VNjwwimRicbr1s5xByGfqwUKOE1OeKJzRqf6Hy3huDHsH1JY+4PeoKkNVv/5bl0OWME+
         Mk0A==
X-Forwarded-Encrypted: i=1; AL+hErGj3SnODlN6bwaXj9cfxvBS6qigZ0YJapg2wgsBMChCr3O2ECNF91Ol07XDLZalZiivcLVQxd+IYTl5mw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9YXSEGVCWGlXcPnT+jvz46VIC52XHxmLmFJF8uUZEYz14gX5q1
	di+Uzss2vrTweDAp6hisPqJ0K4zdJOWEFevMYogQf0rlv8nMoJhGyQ/U
X-Gm-Gg: AYBFou3J68adoekQ6iVDazv5UjGkRbyQRqmomZAzHGJFnIM5Mi9yX+xqJNwRHnFAoZE
	I8Ypwg5Pg4Y3yVIeeAwRuGM8bln0tt99PHSyQ3eBBVD+PPYZ/1VRvLAmA6zTX4NBVGIL9duSWRf
	nfVw4BJsTkmfWb/UFoeDQTNHg4o+bZGbZRFS9Dz47sQsNhKrI417pDTV7fiokyCClilpYA76jx0
	SO7udGhfST4Y6dbbS8OPJ45Bky8EIwHuX3HhoE2UP1ktD4PZBWWLJkQVjQ6c0tXOlQMVrJz+ZJ0
	n1x8kssqwEgsuN87mGJ8IPVtfWbu6s5BfI9VwyvOcyBqv2pRxV0Wb5bmCC1jS+LIYkmxUzqt/1L
	GHQMIhaqOGgeU/dKOYz7zXjN//tZPmuynoTuKQLloNvDn6F7996TxxCdtFusXr1Hu/GFiIp7UNR
	qtWvkwPIPwyEte0uPDfXTvlhWVFLg6Uclt9qilgZoxB+sG7By90MoCy8llSG7VvXpXRNWkMHciE
	a1Qa2CeIwjvwxsd2A/QGjcVrJUw0iVOeLM3QMgCl5jgtt5SIn9Z6QR7eXKjCiD8v1rwpl9ibt4m
	pJHD6+0lTc9acwCxV/KNuo5kz6ALS/7a5HSQTe0OqbUYArXYHzDJWZ2iNYpG/qphTrNV+yCJvDB
	Q0iPUVzHWUMMU6fMlLDT/ctakWGyS64ldJ8VtR0KkHXDS6eXJ2LIABuftz4l8YjG+Xd3a1nj7CL
	bhXgBqnseaHd9VfU31V92kEzQPAQZvDM3ljjBAoLkmGgk9EPAN0G2K9FphgFsmgjtacUnlfR8MK
	YIM1/mP1zE6Aq7j1CqdrX+jJ4h4q2AeMFcO
X-Received: by 2002:a05:6000:3c5:b0:48e:6419:ddf2 with SMTP id ffacd0b85a97d-4982e641f54mr399339f8f.17.1794246665055;
        Mon, 09 Nov 2026 09:51:05 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:04 -0800 (PST)
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
Subject: [PATCH v2 00/11] staging: media: cedrus: assorted fixes and VP8 4K support
Date: Mon,  9 Nov 2026 18:50:05 +0100
Message-ID: <20261109175016.42061-1-jernej.skrabec@gmail.com>
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

This series fixes a number of bugs in the Cedrus driver, found while
running the conformance suites and comparing with the vendor library,
mostly on H616.

Patches 1-10 are fixes:
- patch 1 fixes MV-col buffer leak when the file handle is closed
  without STREAMOFF,
- patches 2 and 7 reject H.264/HEVC SPS and VP8 frame sizes beyond the
  hardware limits, and fail jobs whose picture doesn't fit the buffers,
  preventing memory overruns and hardware hangs,
- patch 3 marks H.264 long-term references, which fixes MR8_BT_B and
  MR9_BT_B conformance samples,
- patches 4-6 fix MPEG-2 field picture decoding (field height, field
  order detection and references of the second field),
- patch 8 enlarges VP8 probability table to the size used by the vendor
  libraries, since the hardware uses the area past it as scratch space,
- patch 9 switches H616 to the 256-bit DDR mode, which fixes corrupted
  reference chroma in H.264 and VP8,
- patch 10 clears the sizes of the H.264 DRAM buffers on start, which
  fixes a double free when a narrow H.264 stream follows a wide one on
  the same file handle.

Patch 11 is new functionality: VP8 decoding of frames wider than 2048
pixels. It depends on patch 10.

Changes in v2:
- patches 2 and 7: check only the hardware limits in try_ctrl. Check
  whether the picture fits the buffers in the setup callbacks instead,
  which fail the job with an error buffer. try_ctrl could be bypassed
  by setting the control before the buffers were allocated (Nicolas,
  Sashiko).
- patch 2: describe what the HEVC decoder takes from the SPS.
- patch 7: limit VP8 frames to 4080 pixels in width, as the frame size
  register holds 8-bit macroblock counts.
- patch 3: pass the reference type instead of a bool (Nicolas), and
  keep the reference type of the first field when the second field of
  a pair is decoded into the same buffer (Sashiko).
- patch 4: halve the macroblock aligned height for the boundary of a
  field, like the vendor library does (Nicolas).
- patch 10: new.
- patch 11: set the DRAM buffer sizes only once both buffers are
  allocated and clear them first, so that a failed allocation or the
  data of another codec can't leave stale sizes (Sashiko).
- collected Reviewed-by tags.

v1: https://lore.kernel.org/linux-sunxi/20261102170303.1973892-1-jernej.skrabec@gmail.com/

Please take a look.

Best regards,
Jernej

Jernej Skrabec (11):
  staging: media: cedrus: free MV-col buffers in buf_cleanup
  staging: media: cedrus: reject too large H.264/HEVC SPS
  staging: media: cedrus: h264: mark long-term references in the frame
    info
  staging: media: cedrus: mpeg2: use the field height for field pictures
  staging: media: cedrus: mpeg2: derive the field order of field
    pictures
  staging: media: cedrus: mpeg2: fix the references of field pictures
  staging: media: cedrus: validate VP8 frame size
  staging: media: cedrus: vp8: use the vendor probability table size
  staging: media: cedrus: h616: use the 256-bit DDR mode
  staging: media: cedrus: h264: clear the DRAM buffer sizes on start
  staging: media: cedrus: vp8: support frames wider than 2048 pixels

 drivers/staging/media/sunxi/cedrus/cedrus.c   | 40 +++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h   | 49 ++++++++++++
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 66 +++++++++++++----
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 32 +++++---
 .../staging/media/sunxi/cedrus/cedrus_hw.c    | 14 +++-
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 74 ++++++++++++++++---
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  8 ++
 .../staging/media/sunxi/cedrus/cedrus_video.c | 15 ++--
 .../staging/media/sunxi/cedrus/cedrus_video.h |  5 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 72 +++++++++++++++++-
 10 files changed, 329 insertions(+), 46 deletions(-)


base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
-- 
2.43.0

