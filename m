Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7700B449EA9
	for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 17:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519538; cv=none; b=Cz1EFiCmlkdDmNFfqm+7/rpvcINV+lDrIcyvrIXPp48D3DU3S/T8S5t7dP5OWr54YMssRpu44tQDz3lOS6BRhitPAupASBGG06TISaI7H1NcBkuhDHpZn8NYEXnRiz+rteQ+iAdmXFPstzsD1Y80zUQFKNoOMeG7INS4rngMM2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519538; c=relaxed/simple;
	bh=3LLaazElOMKyi+EA4lRpSGDokD+YpjiONdAqGB1Oq10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LlqPIpVL4wVXKZGqmF+Ll1TWjCjmwuFpUUh6EzBWjpPB8LfhzEw7IcXpF4E3vTvXt43rb9ecMoq8OahD3+wQl9VUUFVK20h2/TLFzCYM86vtHqtBaZVe8IEKEoOofdBdmbA851Aq1Fu2LdLypBNOzCWW7bBuqbNc+fK7COgNrOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOsJgir+; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOsJgir+"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so4667310e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 10:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519534; x=1779124334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ffx9yq19kp+YfhQJua5Fc4ABV19E4122HD3QSi0Mg4=;
        b=aOsJgir+rlPQzkTJnVuOyNB5L49FhiRf3DrAUWvWJABgS7s1r21OQz1HEVp5Vch+Nn
         N6cIjVU5KrFuCZ7rUHj+l1NFGpjyr9rPGeo9Wm8IVMzLuhdtQRlhAZDYNXmMFii26LLF
         uVuGDA5AQa3Y7hJmOUjVMG/gr9/whJXvuXMuAfGtR2a/SPzKSW4f//EZjW5Ci0yv9FVH
         GA+iHefa/Y2ENTjWVGcHxyVuTTyeDoCyuv6oVBh6djMmMR59oWLxbgwjL5+irdUzu+/t
         sW3aBDI1dda6xy6oTlRiz7QbwSmDy0J7wG9ElROz7jDyot8lBcP5ctwGEOwCagfjsCTd
         p/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519534; x=1779124334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ffx9yq19kp+YfhQJua5Fc4ABV19E4122HD3QSi0Mg4=;
        b=SlocwxYBdaenPJ3IKr/4M1SfP2JYIxvyeWfrCIkWyYgkJq7k0ZrVEVSJk1WecupxJG
         ovWnJTHV/2n7aUIiRICO7J7x5MyyDS4NkHzSdPg0rBW60YKB2UgHrV6By7Mw+X1cw/Yy
         8Ox6bs7UmRQMmXM6btDosDHxAa9R+GXMz/wuaopo5VIe5pturt4K49D8ILmTygAUeQ/a
         fNwHhoeCtmtvhoLhAl84OHfHdmbn9gJftiLtaKpqyFbMWg+Wut2+WtfeMgkhG88rIlYS
         9m13qB9OjoseAx2hhB3dgYoLBG7oWV5j/o5Wa0uuUmXa8Dbqr2T50zps0qEGv5p1DoBY
         xUOA==
X-Forwarded-Encrypted: i=1; AFNElJ9wgfrVbsGP9qTRBE6IlFeJqwM6Dg05Zc6pdJqHagE5YUqduXVii1NAg/W5/+BbWaoAhX3YiJju0Sqqew==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDlGdewgEEVFJT8bRfqIDH1v+I/shh2jb5tcI6aH/mfFVzpR0/
	FK61q1nj9Bez+hXsYmq7qtQKVj1opNACQojP0urPig5GwspnIeYo9wdn
X-Gm-Gg: Acq92OGY7jrsauLQVs716C8aLgqkue67+KuM+APZ144jRDi4IZ/4ss6OfkvWIDf80OQ
	HUHlFv8hgqRVk5BlPOHHKgoDeRcwE1BN28vA/CqiWIZvsCz0Gs3Vw/eqJPU3ZPZECjBIJ9/cPgv
	uFX8z8G0Q836EwXxuMvVSsGd6vuqytnJzAjjcLni4qL75sapEIMvdthFrFdugIX+/W7jbSBEqxe
	m6iL9tKgsm+yc/lTlaxuu+jtdPklJZOgN+kRRNb1zEZ65RlFXih+xrTDTCUTDT1gm9SudC6e/FP
	bYJCbVMBXrxX2Kjy7PzddrHwtpRzXR5cnoKpFui/yqu/UkIoISYwDSVJ7m6IUOChdUgD4faS0ee
	5EPFX9TaxiFXx0yHPF8dzQZNbtZbazKN+6zh6IPHzAiK8k+ujERhXyn2FU02x2PRz/HrE74bXoq
	eepLYwZ3+UsW0qhNydgyYyko1SM4jKyNAIiFTOHe4QDWcSXUZQBORmYWRaw3ZN
X-Received: by 2002:a05:6512:3d9f:b0:5a8:6931:ddea with SMTP id 2adb3069b0e04-5a887add27dmr10425983e87.3.1778519533815;
        Mon, 11 May 2026 10:12:13 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:13 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	hansg@kernel.org,
	hugues.fruchet@foss.st.com,
	alain.volmat@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	sakari.ailus@linux.intel.com,
	mripard@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>
Subject: [PATCH 0/6] media: vb2: Return queued buffers from start_streaming() on error
Date: Mon, 11 May 2026 20:12:05 +0300
Message-ID: <cover.1778518085.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vb2 framework hands buffer ownership to the driver via buf_queue()
before calling start_streaming().  If start_streaming() returns an
error without first returning those buffers via vb2_buffer_done(),
vb2_start_streaming() fires WARN_ON(owned_by_drv_count != 0) and the
queued buffers leak.

This was previously fixed for uvcvideo in commit 4cf3b6fd54eb ("media:
uvcvideo: Return queued buffers on start_streaming() failure").  The
same pattern exists in six sibling drivers that still return an errno
early (USB disconnect, signal-interrupted mutex, or media-graph /
format lookup failure) without draining their internal queued-buffer
list.  Each patch reuses or extends the helper / cleanup label that
the driver's other error paths already use.

  airspy.c          - moves mutex_lock above the !s->udev check and
                      jumps to the existing err_clear_bit label, which
                      already drains s->queued_bufs.
  msi2500.c         - rebuilds start_streaming into a goto chain that
                      drains the queue on every failure (including
                      previously-masked set_usb_adc / ctrl_msg paths);
                      parameterizes msi2500_cleanup_queued_bufs() with
                      vb2_buffer_state so the start_streaming path
                      passes _QUEUED.  Rolls back isoc_init via
                      msi2500_isoc_cleanup() on ctrl_msg failure.
  pwc-if.c          - calls pwc_cleanup_queued_bufs(.., _QUEUED) before
                      each early return; state matches the existing
                      pwc_isoc_init() error-path in the same function.
  rtl2832_sdr.c     - calls rtl2832_sdr_cleanup_queued_bufs() before
                      each early return and at the err label.  Adds an
                      explicit success return so the cleanup at err no
                      longer runs on the success path.  Parameterizes
                      the helper with vb2_buffer_state.
  dcmipp-bytecap.c  - replaces the bare -EINVAL return for failed
                      subdev lookup with a goto err_buffer_done.
  sun4i_dma.c       - replaces the bare -EINVAL return for failed
                      csi-format lookup with a goto err_clear_dma_queue.

These sites were located by a Coccinelle pattern that matches
`return -ERRNO` inside a start_streaming(struct vb2_queue *, unsigned
int) callback without a preceding vb2_buffer_done() on the same path.

Build-tested with drivers/media/ allmodconfig.  Not runtime-tested on
any of the six devices.  Maintainers with hardware are kindly asked to
verify nothing regresses on their device.

Valery Borovsky (6):
  media: airspy: Return queued buffers on start_streaming() failure
  media: msi2500: Return queued buffers on start_streaming() failure
  media: pwc: Return queued buffers on start_streaming() failure
  media: rtl2832_sdr: Return queued buffers on start_streaming() failure
  media: stm32-dcmipp: Return queued buffers on start_streaming()
    failure
  media: sun4i-csi: Return queued buffers on start_streaming() failure

 drivers/media/dvb-frontends/rtl2832_sdr.c     | 19 ++++++++---
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c    |  6 ++--
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      |  6 ++--
 drivers/media/usb/airspy/airspy.c             |  8 +++--
 drivers/media/usb/msi2500/msi2500.c           | 32 ++++++++++++++-----
 drivers/media/usb/pwc/pwc-if.c                |  8 +++--
 6 files changed, 57 insertions(+), 22 deletions(-)

-- 
2.51.0

