Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484B13B19CF
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Aug 2026 11:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786187139; cv=none; b=EkgrVC9XbJSfoc/71E3VnlM4tNv2PaRwh4kMQmVChIsEqI04LH1kLjt5eHOj5gp8WjaJM/hPhfFsWKOToxt0AgqtRjpWLJpfyuBMHS0NOBQF11WAGERbQv8b9dQhKVWwddWTFrDCcmmCNYWocbqKWq6JlHRIJuBdeeHf5vsOF7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786187139; c=relaxed/simple;
	bh=ogdIvbW7aSb4932xDfimt07Z3LRdmf4GX30hP45/UL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IFJR/ToTq1BFQ63LNoG1tEwbyg6Ww5ISJehc53M4qRROpfdFjVm8IhTVbyo0RY0WYD41QUpmzS0+4wxyblrl+2CAnHVeihFbW+GBseVuKrW7V0UVRYn4tjvdm476Lc73wIg0JUE/8tuyjAJpN5SccigsR8qk5Pu02oWYJGl/EUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ycnj1jPE; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ycnj1jPE"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84e04df8c46so351376b3a.2
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Aug 2026 04:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786187137; x=1786791937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vd3mCxZmxHBD2Xo74+SQgSYvrRmOoQOdDSC9aBG9aE8=;
        b=Ycnj1jPE1rt5qm1XmRBh2moadMzjQ2eM1qHGE6I6HkwS03tb6t+VmOZtO5G3NosiG1
         e0yYM+rapG7fFY0YtcWxpBLcKUQSYe2Gnfn6Qd718dcvIfC3V9aeL+kWLVB/I/feP1J9
         ghMjvv3nfEA44IKhtSpTDhLU1zU7c+vZ4jOqXrF8XCsovv/dEMgBv5ZxlUS+ROmAeqZP
         ODaIReqkiTK3HjsO/4DPN7HuZDbbBEn0j3RcE88RFpvM/nivt3mpmicmYcneXcXw3eUw
         W91SU8tikQJFP7WDeiYp0Ko7qxrFfVrWvo76u8oPd4rTxMFa2a535UkTjHNEZw77u8wH
         WKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786187137; x=1786791937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vd3mCxZmxHBD2Xo74+SQgSYvrRmOoQOdDSC9aBG9aE8=;
        b=HV1UC9TDRa+od4gkCC2ziAvgpLJ7C0rIP9muo33oQ5mL6C5426Marlm/AGoC6xoTCm
         0zaWYVTk5ltf+vZZwkA0K6OsG9NH4DHjHtnd0e9LjAWWszYFnY85UxmKG6Vxf02mT6XG
         ZtWG6XPQM84M0rvGqSyfRqb5bYgRR+U4Kr42PI9+rian1i+iDMDfW3JUc8t9D/rgA9s+
         +cA+Yw3TLZcfXj4Ic8OdKKY5ftLkAbi7ciKy+Df4dno/JQb397O30BE7Aj/Pj+pf8csH
         l0xvGADNyoXjgEwIU1M11OvIVxp2VZgQWidMHm1qpTqOTA0ccYk3cmYCCf6pJmkPOtWE
         2bJg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2eGacfOMAXIQbuUVJEzNFTv3IGUv0OhYq+xEfLFRDWwPc0RFiuchz6mo/l2xTygKeOhGzvjfVo62wCw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxITU1nQ/XGc56V0JBrx1Az/Q/pVySk0bvWbd8vESIkwYzffZ2y
	LpOC6HKHbeqLcvwKxXajPcXsHd1JrMD8ZmJt3ftgHCwsnlA7BeWkE+sg
X-Gm-Gg: AR+sD12c0iMbS3tPviM0WWjkOgHbT8gASeyxrnpd9H7+3dn55iTxTUTIPtGTYY4Zvvo
	podFwpytrcagZMPmTSv9QsJk4rJ7HMBASpN/FReqK1hJ6KptUnw4ddXthBQQ4gTxtKAtYHMKKa3
	dCSa9UIsPYsk4GErlE4f4dHWBe8iAZLCI7Qb/XNP2Rq65rsN+a7nVSQRBNHoCMBcCKkaK1lXRYj
	80+pYdwAyyzj5LPbOawelLkdjEx7iZEGffL3gVR/UhK1+NA6dk4D35NQnZn5DnpF5THRoinA4u6
	bV4J6H1LFqDXVu10cYTdNabPahbA4DVgwPS+H0PZXVlbLG171G1B36qfUo+LEx5BNSXjnmX7Xf9
	tBJjfD63xAF3aJGwcps2c3PWRyW89KuQUbPftSIDQWK+vM/SNGNYTvlfGA3udnzCbubInUcj5y3
	GfmlQy2akXJfqxF4yNu1pkosMrmNqRL7m/nXZ04xXjgM/pCBDZRwgS8bbGRl3P3cRIOUT2sJV5/
	Vzbx/rBJ/nKPCOP
X-Received: by 2002:a05:6a21:6817:b0:3b7:aefe:4367 with SMTP id adf61e73a8af0-3cbc0490091mr12371196637.33.1786187137473;
        Sat, 08 Aug 2026 04:05:37 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm21643469eec.28.2026.08.08.04.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:05:37 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>
Subject: [PATCH v1 0/3] media: sun4i-csi: fix lifecycle bugs (leak, IRQ, unbind)
Date: Sat,  8 Aug 2026 18:05:26 +0700
Message-Id: <cover.1786184456.git.congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While addressing an async-notifier cleanup leak in this driver, I audited
the surrounding device lifecycle and found three separate pre-existing
issues, all present since the driver was introduced. They are independent
of each other; this series groups them because they touch the same driver.

1/3: sun4i_csi_notify_complete() registers the video device and the bridge
     subdev before creating the media links. On a failure in the later
     steps it only unregistered the media device, leaving /dev/videoX
     registered. Since probe then aborts and the devm-managed context
     (embedding the video_device) is freed, an open() would touch freed
     memory. Unwind the registrations in reverse order.

2/3: sun4i_csi_stop_streaming() stops the capture engine but never disables
     the frame-done interrupt or synchronizes with the handler. A late IRQ
     after the block is runtime-suspended (on release) can access gated
     registers and crash. Clear CSI_INT_EN_REG and synchronize_irq().

3/3: The async notifier ops lack an .unbind callback, so csi->src_subdev is
     left dangling when the remote sensor is unbound; a later STREAMON
     dereferences the freed subdev. Add .unbind to unregister the video
     device and clear the pointer, matching stm32-dcmi/atmel-isi/mcam.

All three are marked for stable. Compile-tested (COMPILE_TEST) and
checkpatch --strict clean. I do not have the hardware, so testing on a
real A10/A20 CSI setup would be appreciated.

Cong Nguyen (3):
  media: sun4i-csi: fix video device and subdev leak in
    notify_complete()
  media: sun4i-csi: disable interrupts when stopping streaming
  media: sun4i-csi: add notifier unbind callback to drop the source
    subdev

 .../platform/sunxi/sun4i-csi/sun4i_csi.c      | 25 +++++++++++++++++--
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 +
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      | 11 ++++++++
 3 files changed, 35 insertions(+), 2 deletions(-)

-- 
2.25.1

