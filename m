Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4076A2F8E92
	for <linux-sunxi@lists.linux.dev>; Sat,  9 May 2026 05:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778303343; cv=none; b=JdjITXC8WyQ/fK4VUPjTKOFb+eVBg5QE8E734et+VTQj99FdUXcYbUfAPb092Q6pK8lgKinTpgJEg+ipGwTcByq5tqSrLk3Nkxvaoron1f976b2B+mlWUzRkwGarlBC0iT3u144A6ADjLpU6o+jkoXaoHhLkN+wAGYz1Mp9f7UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778303343; c=relaxed/simple;
	bh=Tudd6fEgg5gc3yfMcYrSDK3iFdkEFYTP+5gC7wlvQeE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ebfEYQrWaYAEIrV3T7i/PqJ0836TTz2KxCGegO6dRc46v5ormeYkAYkqPqHvFbo0vjcOvn0MZOhC5Rg7mIzODHPpKBblHboajfxx5cRrvP9wDrieXunFZmMV3ryOcBuIQVJZ0mrO+cMQJs4TqEUw0Q+2TzjXQAfQXRKB/+G8Uzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUvl3xFf; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUvl3xFf"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d77f6092eso1644551f8f.2
        for <linux-sunxi@lists.linux.dev>; Fri, 08 May 2026 22:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778303340; x=1778908140; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2MfhRYaG6ZRLEbM7BqKvDDJXeIiIz+hpGcF/7+2fq7g=;
        b=hUvl3xFfMf8tAjSq8zjQ/EP6ev44D7VHOSC66Z9FQuGb8XX+97FjRQTqi8s3bja1U0
         YHz41KHMQ4vJkcLz37rWNkSy344kQmUFNNK2lz5G31wlRcl7bZnOZ5Jk8h8BWQeG3O7q
         0RBjtdNAg+Vryo4QJgmZBZUuipB5ETQMyparGBG3Jc4HQFm3zZdxLUmYN1gOInmuw64k
         WyqJ2OODS05f8NjbaJUQPYTfCInlEWU5I2yRCh+knxnzDvJThtHamwYfKV5qrYMjsNEl
         GSTt7L4Lulb36z5cyjfVHVhHsPGyEpchc8wvgGKUGW9ZZCaljsTUAMp8cHliUKFFph2W
         7vUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778303340; x=1778908140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MfhRYaG6ZRLEbM7BqKvDDJXeIiIz+hpGcF/7+2fq7g=;
        b=rRyTo9aUu0Ps9YIgIm34e1iBvs3HlfEwC+2SeLzzZnaWH7Nv2IYfyrJJnLUrsR24vR
         Bn7U3udkJTQGEia2HK6pHmRIbk3d6s/vGuGzG3RPGLuYBXpQ8sj1J5IPnqN1AG0ciOAJ
         hmR6PLL/4YzRpooRam99I9Jr4GSJIjw0RmRiTS8Am8PNx9TCY1gdLb7kPZwTAh5Liqyf
         k84B6oDTWjnxZ3DNDMUuVrd/ILgiK7l1zle5BZn6fY0eizNPXxYPvu4qhW25T/7ewxY4
         TYjk/LRS0bKWBnAkYOvKFMrBUcJ+sMS3xgA0rDCPCTK3No7Ir0OLo+9sLK/whqYyFbXp
         3UKA==
X-Forwarded-Encrypted: i=1; AFNElJ9DDkJ9plu0G7+nTAeKDThnIV0brswSeX8J4a7ZGZpOxg1N7uqkJX+tQDIELLndZSzT11SxZHZFiXcD9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRMhTPSR+terO4TkbF0MQrg5wuI0MJX/R4bKpDa21zcU9pDCUH
	lfrAQFUO9rFQABkm9bRi3GAP632+ie5ukPAkFSk20tYf9U6VpPFfHTY2
X-Gm-Gg: Acq92OEkqdJkNBcbo4uQdMRTAA4OQivQtcxVVKFVXNEk+sJcZ1XDHIqq7AKu3fVcKfk
	7cgDeewH0VedKeAIBWVBKr9xUDfXBw4vFnvIFYk3CWc7/Abmp/Ffx9uMxHu0UE31kjYZL6cUWth
	Q8Ilj1PE8QLpM72/W7F2h0xjFyzJd9tEEHfl+wtXQfcb9WC7pvpYutsaWDhkNwSVgOH+DvzEstf
	k4sXVaT26F036aZz8BZUKzCUj6ocKTLXP8qDyDiyuDyX8AJnmz5uTr9gf4pve5I4Y7qOR6QNnGl
	1pD4uB4YjSmDdnmk/oXH4opkodzln9Iv6RYhGAJcyhViwXB8zwEFW6KnO4HfzKKJJT0FJancShb
	2QteNrqX7I80DNLZCup4BK1JYZjn1ddlePdyU5uzbEoSXMu4Q8cURVfZgQQpYZ9ThlKyhAAeYJx
	g4AAVkwhYzq4fompMv9XmNsrh6PuF6LF5qKkeKzI02o1ZYVsKAvU1PnMNrsbcRrvXUN8rn2U/Tc
	2trVGc6Iw==
X-Received: by 2002:a05:6000:22c4:b0:44f:aeac:5f66 with SMTP id ffacd0b85a97d-4515cc31c2bmr25655234f8f.31.1778303340455;
        Fri, 08 May 2026 22:09:00 -0700 (PDT)
Received: from thinkpad ([46.164.106.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm9721296f8f.12.2026.05.08.22.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 22:09:00 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v3 0/3] media: sun6i-csi: Convert to active state and improve MC support
Date: Sat,  9 May 2026 08:39:18 +0330
Message-Id: <20260509050921.22158-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series modernizes the sun6i-csi driver by aligning the bridge and
capture components with the V4L2 subdev active state API and improving
media controller integration.

The first patch migrates the bridge driver to the V4L2 subdev active
state framework. The private mbus_format field and its associated lock
are removed, with the framework-managed state becoming the single
source of truth. As part of this change, the capture driver no longer
accesses bridge-private data directly and instead resolves the active
format through the subdev pad API. Since the hardware does not perform
format conversion, identical formats are enforced on both pads.

The second patch implements vidioc_enum_framesizes for the capture
device, reporting a stepwise range of even frame sizes within the
hardware limits.

The final patch adds MC-centric format enumeration support by filtering
pixel formats based on the provided mbus code and advertises
V4L2_CAP_IO_MC to reflect the intended usage within a media graph.

Hardware testing performed on LicheePi Zero Dock (Allwinner V3s):

  - Parallel pipeline (csi1):
    ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture

  - MIPI pipeline (csi0):
    ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture

---
Changes in v3:
  - Fix Media CI robot warnings about open parenthesis
  - Link to report: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99380724/artifacts/report.htm
  - Link to v2: https://patchwork.kernel.org/project/linux-media/list/?series=1091728

Changes in v2:
  - Fix indentation in link validation path
  - Return pixelformat directly instead of a pointer
  - Link to v1: https://patchwork.kernel.org/project/linux-media/list/?series=1054768

Arash Golgol (3):
  media: sun6i-csi: bridge: Use V4L2 subdev active state
  media: sun6i-csi: capture: Implement vidioc_enum_framesizes
  media: sun6i-csi: capture: Support MC-centric format enumeration

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  88 ++++++++--
 3 files changed, 144 insertions(+), 108 deletions(-)

-- 
2.34.1

