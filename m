Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0A62153EA
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Feb 2026 06:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771310472; cv=none; b=OX6DdMXMhr+pgcpFiI8ID1PiopHsB71EZ9hmAEp0LvsHaLjZV7K+X4uuJaoO4rU8DcatfjsCGh0EI/3z7bumeF7DVOEtQ4oSiOsNyYtABjKm+toDR+M2+mqJFkev2NICY/S3Ph76CGr9QqgHLeaCUNoXJmZiNVXpQfYmKHO92zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771310472; c=relaxed/simple;
	bh=+NcFpiiW0wzV8DHCMGsp2NSC6RD3WjX56RkaBkhfEgc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JcL44xQEHBxfUj5iy8ak7Uqs0gA7vnF+iUhqK+HTtgJlgVJup2vCDaI7SNEh66aaN0y0SeKz+mY3xAi0XGhCS30LAlbabZcfUSzMso1JdPRweFp/HWDbo9/7W4lhII9CL2ogD2bYsZ6Hj6XJlTtOYi3DGANqBA7QBdLz1XDkw3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZdpijI5Q; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZdpijI5Q"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-480706554beso37333975e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Feb 2026 22:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771310470; x=1771915270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FepBOuU1DcO7xNko/hlN7H/0LgDQ38swQHDFFclf8T0=;
        b=ZdpijI5Qz0bm3uxEpf/mg5Bq0w3+hw/oaDXDqH7i4KmoTJGyFjL/0tKLSTh3AxUO1z
         cOXBmmm+4vqBWl02JhmrlDUTDchwYTGE+hzS99tjm3JH21rshhWpm2f/oUmEXWudtNDl
         2NX1YSJRx4mYuI3zd7UEw65foTtA4PKNyRSdHhL03nafyhwXv3O4hBUEZznMSYOisC6V
         su+h/juYk7v+2+mjbC7Cbd/uD5JkA1u1tmZz99S42mBb+UI3s83cZBzYgCVx8vTsQUGg
         3/Ln39G4nrLYOK9qyp+uKwCtcBEiEYFesBgrw0J93TqCcrj0nMzY/n3ICbpAnIXo0Ghf
         cj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771310470; x=1771915270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FepBOuU1DcO7xNko/hlN7H/0LgDQ38swQHDFFclf8T0=;
        b=ohkph/xMnSexV/IoJ6bFjb0xhuPYGcZLmioag1NsWk0s78IclreVbN3SaG7uplJxeh
         Q0zs7ItTQn7cp967sue0A85stOZEMOTWZ2g1wLkSp8FE7xP1W9KhjuC+zXuIUewSUdIL
         zPYhnCA5xYb9mwuyxtv3FtT3LcLR987lZ3AYnlpHJEfMx20Kzim2s82z/qATmVlQZqn9
         xAnpJCpqYCiLvxFOMOGHlou1Uo6FYfNHhOKzLRFs9VB9wTELSZwmfhVLerpYrsQjNZHx
         qlthUwGaQ3D9/Q+lN5F9zDIkfoP7ILfsILH5Bi6Q8XgUvGf4C4uf9lMjjW5VEt7OOWhq
         xudQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzAcp4SsBOXjCW5RQogAT+KhSHfE0Gd7dEUFxfX2z/xGVPlV0NOeOy6bmrXAEA3rKFeecar9eYPX8D9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXinFBQJWCa13Xjnd3A9R7Xs8zK5s2lAV2wka7nD4H0Ket5D6f
	0dZx+77YEY9nZqrgyiSUqrQVjz05h5JUOuXu+Aqx0Zw12tuzNDEYD/yv
X-Gm-Gg: AZuq6aINaw86tNJkbtpNhy8KZMNI1TGgf/YdQd8i/v3QCnzJ0qDSOexf6Yd1Lt9VFtP
	v/HAysCaiW95/a8LDI/Z+B7SR3k3kAd/m+eLKpWdlmdH0NV2bolf6Zyl3d6jkhNpHLTQmCfPfbC
	5rwmquKcB+1v6mHC2VtxY055hPOqg1qW2lOUlTW/u/ROvJnds3pEXRApHcFG9KsO6UJT3dzza9I
	MyFDFinXVigeKXqqWXt5yIEsrVSgQkPApVVNcIYpv17crxGAQBBbZIIuqlqcIiZsAJnVfL/Ss+G
	T+oKy1p736pQe7RBg+LPd/PsgRHH0P4t3deXeO9BARlfJjeqxy4NsS6PzLsoiussmC1vBfJKHB5
	+hyt4Gkgku6gLJeXf3eIp0j1Y6grEW4TLRpcbhG65rJNy+Ai17/bhu0dpOHleUVWRgpprNyUjHD
	dRWts4c/MgTv8F2tgRC5fY7Yd+m8kx8JzSUb/wDXvZVFpIhTjPcAUE16KDjBqYblTNJjEGj3OGe
	5Mvc28Uog==
X-Received: by 2002:a05:600c:6814:b0:483:43da:6c87 with SMTP id 5b1f17b1804b1-48379c14894mr176131575e9.33.1771310469549;
        Mon, 16 Feb 2026 22:41:09 -0800 (PST)
Received: from thinkpad ([204.18.30.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad015bsm33081811f8f.38.2026.02.16.22.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 22:41:09 -0800 (PST)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	linux-sunxi@lists.linux.dev,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v1 0/3] media: sun6i-csi: Convert to active state and improve MC support
Date: Tue, 17 Feb 2026 10:10:47 +0330
Message-Id: <20260217064050.18388-1-arash.golgol@gmail.com>
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


Arash Golgol (3):
  media: sun6i-csi: bridge: Use V4L2 subdev active state
  media: sun6i-csi: capture: Implement vidioc_enum_framesizes
  media: sun6i-csi: capture: Support MC-centric format enumeration

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 154 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  87 ++++++++--
 3 files changed, 142 insertions(+), 108 deletions(-)

-- 
2.34.1

