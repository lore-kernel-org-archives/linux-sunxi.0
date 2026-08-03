Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188023502A5
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773477; cv=none; b=hiOZPJtpdGFDdAdkr9LpwvkLW3RbEDcCdHvHIkTZ+Yz3XyU97DCQajZi/deRUclSbMWGSRyReGAW/nKAFY4ReafRQwJdWzPQwCrK2fvT+c9SKP9gQP54czw7AZen7mxDlvRUS0rfrGSAnSY/LgLaSKI7HgqDeoO0lP9dKCq35rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773477; c=relaxed/simple;
	bh=aQxO8CqYWIJBy/ebvnHErzyN0uZRNICXhzvqqUiRwII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ch0CIUwa/8hzz1uiLPHmf7pVRzUQfjjcC8yVPawxWzw6PvPFrnzoD6l2xYBvajMGCEX4sZMF5UqozlwItBd6Dor8BssjXxGLM9ql3qgjJWRa8FdSXDNirggrYi8/INCpn/ps4+Go5x/KpYCYh6USpVJAR+odvaW4ehQhOOX5inc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9dhhJ8O; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9dhhJ8O"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so12614145e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773470; x=1786378270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TkgRTuLVuCLYpIvdltmqBCjRKT4GYVnjKziTrqAUoEE=;
        b=o9dhhJ8OWAGDCswRYBwdQFEPfcnWHJ0LhvkBxcLFiyQQgG660sxQpvOurCTztWz2ie
         zp5Wda7ur1boOAiQZKvugnkB4FeO0oYDMUA2sYBgkIxVcfyCKwOjFq5Rn58ZE3KMw6cY
         ca/4mExkonc8zMxmQ9tQVc4psD7sTgPa55T6DV952BsH1uoP2PHk1qa2egSIaJO33GR7
         fLnBIyYjD++RioRvpguoeki9ZfV+xQmIl7vO9S0uyrNNrnF2rmnZYgeSDfmgHSFVzmEI
         Bbb9VV5a94YDSMNvP73awm0mOSQ1sQYeWesVveJLHP4yQhCjyqHMe3jkcDzb7Cymgg2p
         yHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773470; x=1786378270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TkgRTuLVuCLYpIvdltmqBCjRKT4GYVnjKziTrqAUoEE=;
        b=d953zT6zA4/LABLFFgbjryO+iZXhcW+ISldZpQZe2xUYqaci479CIUFzMIwXYBhu8e
         5vZeWbYZ3sNFoI+Ns/W1RvFULXwZI8a177Jp2MC9YfgJEt24BP5gVm/zKHk91ASV64KI
         WgE717Nha9qWa9E59M7zJF80T3EBl5bvaKD4VhY3sZ+EfOHXWlWL8IzNU/OZDlttyiU1
         6uKvbWTKN0Q2mSywRTlhvYTzgAMsmdutsW68cFXbXtuScGVBw7vHWjCVdI8EDtq8zeSw
         +osjKxmp19EH0qgfSM30uiel31nXRfBuilKxmH25W7oKd95hVD+1w0woCGhRNewnuejo
         KBuA==
X-Forwarded-Encrypted: i=1; AHgh+RpjuwGla26InnYjmbmInFdWPjVIFHh4puQamXZ9+Otin80BIiPAog72Y1dwMlgtyA5+jb1QrK0b7jFnzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1K8xcpM5bfBz10p7/ukP8xkIWcvLg4pTzgwoDMOHsBpWf5rj3
	qfYyl3zXq1RgMfJz7ERWbVK+jW+OTyAc8OGChXd+O57a8fo9aOHjHQwI
X-Gm-Gg: AR+sD13q/omRPQo4nTionHahG0oKwCylO+nG6unnNiZWZc/riVUFB0qsFOwsHnwfKCF
	AAiK37+RqT/dK6xvRqhD4DQBISMQNI3BchFtTerVQU64b+EPSXz7b55QnLHI6AqIa0XNFkuQmos
	ioWsQyZhC1odydtYcj2QZI8SiZS5rrAdpY47uoxL/bo/n9JVXw3gK6LZfbg46FZsVaYarGFS3ML
	hTXZHiaBhcfdztEFHhca5I0rSZWSiICMtevx26ny6cyYdWdzVRNx8nqF2RlFybZzYUyJkV2V+6C
	QJeVE3k2fjXJeFHl1UatJQ2I98EXEoX37zUocsShtZLNkRCooJSvRw2aerLdvOq4Oqgy/AX+HM8
	8QT8fzZuuLvuEUM+wbfRKM8tUsLn64F/qcm1F7nA4ccPlgWl+/xXm7Dwq8i91DurhaIz3aCNYlM
	lIQ3NzZBCIiWF/d6Ztm8TQjLBLtPa8TCtx2qFNcC2BKV0parCI0gwUtCvClK3exGAGgh31votWA
	afh9ikuKPz3Vg3RyNGrmbsTP10KNHC5NTPoutkMoh4SEQ3QUyhUtpAMhJxDDTpeBo5S3EL8k0AP
	pumORXPJFYoZW6GZGoOPwY73t/KwBPnPRzmmp43RwZPmoC9+3nIbIQ9NJh0GnQGGzGWlZcu/B6w
	FO1l0J3xUDwWfkzxRXJ0Z4WCQ45APl7RSyqJCBN4CtJl9/A1ozbm1/Lz5iM1ha7IrMT4dPDgUWk
	5LUg==
X-Received: by 2002:a05:600c:468e:b0:495:4b42:8677 with SMTP id 5b1f17b1804b1-4980c6a2268mr222728085e9.18.1785773469919;
        Mon, 03 Aug 2026 09:11:09 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:08 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 00/13] drm/sun4i: Assorted display fixes
Date: Mon,  3 Aug 2026 18:10:38 +0200
Message-ID: <cover.1785770165.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains fixes for issues found while working on the DE3
and DE33 functionalities, used on H6 and H616 SoCs.

VI scaler and VI layer:

- V3s advertises a 2048 pixel YUV line buffer, while it only has half
  of that, so wide YUV layers end up corrupted.
- Vertical scaler coefficients were picked based on the horizontal
  scaling factor and chroma coefficients ignored subsampling.
- DE3 mixer initialization clears the whole register space, which also
  clears the scaler global alpha. Since video mode takes alpha from
  that register, subsampled YUV layers are fully transparent.
- Since the conversion to drm_fb_dma_get_gem_addr(), luma and chroma
  plane addresses no longer describe the same pixel for odd source
  offsets, which the scaler can't handle.

TCON TOP and TCON:

- Both mixer selectors reset to TCON 0. If both mixers end up selecting
  the same TCON, output is black or corrupted, so park the other mixer
  elsewhere.
- DSI and LVDS never called the output mux setup, so on D1 the mixer is
  not routed to the TCON driving the panel.

HDMI:

- sun4i_hdmi_enable() ORs stale video timing polarity bits into the
  packet control register, so the AVI infoframe is not sent for modes
  with positive HSYNC polarity.
- The 594 MHz 8-bit MPLL entry doesn't lock on H6, so 4K@60 8-bit
  doesn't come up.

The rest are an error propagation fix in sun4i_crtc_init(), which
otherwise oopses later on, and four patches fixing OF node and device
reference leaks, two of which accumulate on every mode set.

Tested on Tanix TX6 (H6, HDMI up to 4K@60) and Orange Pi 3 (H6,
TCON_LCD0 and TCON_TV0).

Some of the issues were found and/or fixed with Claude and GPT.

It would be nice if anyone could test V3s fix before and after. Testing
other fixes would be nice as well.

Best regards,
Jernej

Jernej Skrabec (13):
  drm/sun4i: Fix V3s YUV scanline size
  drm/sun4i: vi scaler: Fix coefficient selection
  drm/sun4i: vi scaler: Restore opaque alpha in video modes
  drm/sun4i: tcon-top: Keep mixer routes distinct
  drm/sun4i: tcon: Set output mux for DSI and LVDS
  drm/sun4i: tcon: Drop TCON TOP device reference
  drm/sun4i: hdmi: Don't leak sync polarity bits into packet control
  drm/sun4i: crtc: Propagate layer initialization error
  drm/sun4i: tcon: Drop remote endpoint reference
  drm/sun4i: dw-hdmi: Drop TCON TOP port reference
  drm/sun4i: Drop node references while building component list
  drm/sun4i: hdmi-phy: Fix H6 8-bit MPLL config at 594 MHz
  drm/sun4i: Align VI buffer addresses for subsampled formats

 drivers/gpu/drm/sun4i/sun4i_crtc.c      |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c       |  3 ++
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c  |  2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c      | 22 ++++----
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c   |  2 +
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c  |  2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c     |  2 +-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c  | 71 ++++++++++++++++++++-----
 drivers/gpu/drm/sun4i/sun8i_tcon_top.h  |  6 +++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  | 20 ++++++-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 20 ++++---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h |  1 +
 12 files changed, 119 insertions(+), 34 deletions(-)

-- 
2.43.0

