Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63943803D7
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 06:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343132; cv=none; b=Ka1CLymuFxGsVj6d0+uzM4xGQ1nTTtQhhw+v7sqD0kQ8eOMOL7p8fUpGELwoO9Jy96YCGburkNTAvaBxzj/7vgQBAztht9mc9k4T+zq4ibRiEpB7fAliXfXzVnGBF25jZPIJO/T1Qcqe1mBkYW8ddfwnAUsWp6wzoBeq2vlox7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343132; c=relaxed/simple;
	bh=YZGbKK2rGSRDQ6ux+FyBu3gAjT4XP4xn4CtrnPoTi+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=omtJcwwpjLvQRcSuQ30bfkn5q1kKE0Sqe8yEnh49yYEHg7a5asEyYAYtR03Y7R9btOUVQHoYdlrAi9nwRNzqVRPHQHhc2wmV1Kqj2en4IWBsib9/n09jSL6iZe/mY8WsHnngVfMaunIQhUszeiKQWs/UytlEuIxrlHePip5sfTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KijzcKST; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KijzcKST"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9e7391839cso1425939a12.0
        for <linux-sunxi@lists.linux.dev>; Sun, 09 Aug 2026 23:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343130; x=1786947930; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6BK2MYpOQJK3BRwNVpIqWGv8AEdh5yV7abDFfZh0qM=;
        b=KijzcKSTS6HFxX5JuU0ufssL7pWM5q1Z46z7Qp3NB24qlOrzkLTEVcwK0/vvte5/+i
         GEsiIv8rzur7KeSz97/ewXGhD4dN3jPSSByBWtc8kxWPrBBxC+u6zksvKI2VnhM2EpyS
         Vg4/nkAkdvLrPEKZi6wSKfOImxkZhQuBLDYS3rt44Cw32fVTwZe/rO3p8ZFA1iUl+wpv
         6fihBC9Me0IlCFaRgcIjlv/F9zw923/k6Aij63+QjTbMQMuy3t1iza5fkV2XAukcUCvy
         LeJEiDslOL0jMd4J4MDcp2d+e7JL07RKowqb3triLqfhlh5qoI1TKawDl3CrUgl0reUH
         w2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343130; x=1786947930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n6BK2MYpOQJK3BRwNVpIqWGv8AEdh5yV7abDFfZh0qM=;
        b=gL8SgCGKg7U0F0SCaz2Qeq8H40sQVmRvdexbYTkGrJIqGBVaXRlDkIbVIW3PAUXxru
         cZFtN28bi7jC/eA8APm99k+4l2cnccVyhI0kIjxDMns+iHAbKpPB4uXvmRP0MfyG3CaU
         MA0YhXXB9QUCzpKvBwRNkLYM4uwHhVYVKhm9S5Q8dUd2SYr03+u0NTHCi6ND4T5wmPJ3
         O4355w0SYR75Tzq81+vp9c25Kh9zVzeMgW8U0dessum8meW+tdgfbNNxhYUzFrmK+SeA
         7+Fqt5hENOSJZBcbU0iYUNussZ8Uwg+faHh/ngr0do0IrSuqh3rBYjdpBspY65Idm7LA
         TFBA==
X-Forwarded-Encrypted: i=1; AHgh+RrlGW5Y8YkXXk2DgVZYdtQs8SGe/SeOoCpnscVI/BJo4Yum49ZO7Qz7h0hejg97zGzAOiD0gzhwliRQIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhsiVmo5Sy2Avp9hl6lan8UiriC5tTJ+gZxrLp7tNWrT313n9y
	pdw8HdC3tbxATUocj/zubaCqrYMItVN4a1hLlEeI1bfQpCICC2caKcYD
X-Gm-Gg: AR+sD11tn7nOKihsaEzs91T2mOs917jqJNtsElpSJsHGtCKztTx/wVj8z5UX2k0c+x/
	wtZKKVXuYeSJAUSXPkIsM7kPgjWSD1XdF1SBjez2OQLxffLIfX0oOMiPpkD20YW98d3GUKjXSZS
	G2+6aZEeTuFbrZ0KJo9fH4ZbDwMbnNFLdP/P5yjX2vB9wLfFLq9dOwkIceM83BWjPFkO42tOPpK
	tuGKdEAJKdMBt6/LX4ZokBQvOSJMG5vTovkhAIejEQjtymk/NVtUivPSPzEs9jF+Rj2iDGsPmgX
	sRanLik0DQjr1zgEerlVMeQHrsbeOc7j2xlmbntlOggCtBvLEo6RQejcCQR8wQx8FhieTlAWAOO
	wSX+ij3agMhWwkfDxLqHAox2cIyZimz6r9co2vvszfrkhAMYsr+SrNPJODknIbjxWkibhdaHJE4
	xEg4R2luuDvv/6yR4/osFUtXboOxgbHtZL93rUjTJ3fpbkAXiBL3GcMvmSDBjOH+363tFgQsK63
	F/wNg==
X-Received: by 2002:a05:6a21:50e:b0:3c3:8ead:6df0 with SMTP id adf61e73a8af0-3cbc0431dd0mr25765056637.28.1786343129913;
        Sun, 09 Aug 2026 23:25:29 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm40642912eec.16.2026.08.09.23.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:25:29 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] media: sun4i-csi: fix probe/streaming lifecycle bugs
Date: Mon, 10 Aug 2026 13:25:18 +0700
Message-Id: <20260810062521.1709379-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1786184456.git.congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes three independent, pre-existing lifecycle bugs in the
sun4i-csi driver, all present since the driver was added (577bbf23b758):

  1/3 - notify_complete() left the video device and bridge subdev
        registered if a later step failed, so /dev/videoX stayed live over
        the freed devm context.
  2/3 - the frame-done interrupt was never disabled on the stop path, so a
        late IRQ could touch a gated block after runtime suspend.
  3/3 - the async notifier had no .unbind, so the cached source subdev
        pointer dangled after the sensor unbound.

Changes in v2:
  - 2/3: read CSI_INT_EN_REG back after disabling it to flush the posted
    write before synchronize_irq() (Sashiko AI review).
  - 2/3: apply the same interrupt teardown to the start_streaming() error
    path (err_disable_device), which had the identical defect - the IRQ is
    enabled and capture started before the s_stream call that can fail.
    Both paths now share a new sun4i_csi_disable_irq() helper.
  - 3/3: only clear csi->src_subdev in .unbind; drop the
    vb2_video_unregister_device() call. Since notify_complete() registers
    the video device, unregistering it on unbind would make it re-register
    an already-unregistered embedded video_device on a subsequent re-bind.
    Clearing the cached pointer alone prevents the use-after-free.
  - No functional changes to 1/3.

Two further pre-existing issues raised in review are not addressed here, as
they are out of scope for these fixes: the embedded video_device using
video_device_release_empty in a devm-allocated struct (a broader lifetime
rework), and notify_complete() not being re-bind safe (it re-registers the
bridge subdev, which needs a larger restructuring of the notifier flow).

Cong Nguyen (3):
  media: sun4i-csi: fix video device and subdev leak in
    notify_complete()
  media: sun4i-csi: disable interrupts when stopping streaming
  media: sun4i-csi: add notifier unbind callback to drop the source
    subdev

 .../platform/sunxi/sun4i-csi/sun4i_csi.c      | 25 +++++++++++++++++--
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 +
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      | 20 +++++++++++++++
 3 files changed, 44 insertions(+), 2 deletions(-)

-- 
2.25.1

