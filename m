Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B022346E70
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 16:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784304356; cv=none; b=UHiB08AQV/Yc4KUCSD3VvRJ316mNaFfjNBF1Y4KDHdPV9W7MYRyvlijKqbQDSWh2r/DF4seT3GVfL1pZZtkCtQiU2hn3GYBAmskhbaFHghRAFVIvn66orml6/iGtmVDjIxvAyes5lRAgAaVd6Hsr42GrapLOnxei+tjOwBH1vqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784304356; c=relaxed/simple;
	bh=97i8xe4qzFvaiFutvw48eX8tHd/TsTkX9mpNpq424x0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DiDSvh6YOtEHRzKOebDPWd0aFjH/nRoRn1XJ3CQY7nazNOh6rbqj5In7yCvCH3ELuCESuKTG4yVDN3fwFrRJcYs9P+VYzeoazD5diSMkvBXsqFGwXeSDhM/8HXX9EpTFOIQwDZr6Cy0QKmMaRiquKcmMV+ptoGC/iHBKpMHMLQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJ8J6YC6; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJ8J6YC6"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c9a3acd40so53294241fa.3
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 09:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784304353; x=1784909153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5bUCnt97h5CBtRFgUec9lRH+/+kYNrMwk/z/ACUx7U=;
        b=WJ8J6YC6l/BM6NAwR63mpg9d0n5lOTlZP/cAZ5B6uHNl4hU8FRWxnf1esBmN9W4yLV
         +RX5EU+tyGLFklNrb8yCwzkf0UH9aCLDB+LNPVg6Nk54MxTs2+9YGcf+rIdnNYuWfwoy
         4ftMTprRnN+Skb1/mvUFxXk4fcc9p89nYN78uVotr8WxYc4WYvY8RdV9ef5b8ck6cDMV
         J0iAmle3ZYubGM+b73WIe6fHUOkCHYX6Yl6rP6KN511FKHsc/fkCLBbq8EXE3UInzXCd
         RwdIibmGTWAvzZHbH4jCD3RcKpRAL3rHHTcbWkN8EOHcfMsGiqXNXlmENWYtREQmfQ2N
         ZAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784304353; x=1784909153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5bUCnt97h5CBtRFgUec9lRH+/+kYNrMwk/z/ACUx7U=;
        b=aBx8ZKhG3+16NhoFF3wIssvJHP8QKhqMf114AsX7MJ7UAqg/yoEIKou4ipgdqI+nn/
         K9fIvXViwPXNLndfDtF8O3aUT1iolGbjllycjoe/aHNlbqJxrBdIwQU7zOjwWa6Yf4+x
         vIYHIWNB/64YlbX6tHz/Dxr2XZk3uWBzk44nULyQyiMQ+coVpWbc+r3VCG1vfuHem0lH
         4CHCE+9O/c3VG9ZRMz4Bl6Pwmd3ClSs+F64Fj60cNCOF16KXXq6jZxdsgS917+MTapjy
         cZAMkjD9vjpPJYzxDThT6HhjSVw+bTWYZYoAmwxGFB5W6XiV7udMd32nE6z3cDY/LO/u
         cPig==
X-Forwarded-Encrypted: i=1; AHgh+Rrj7CV2Yw7TNDz/BRDfs8moQhy3fJlapH3KRU+fzlTxlo7jopQNkYRDSDm40cQ5gsFnOmxxAOy7nHxYwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFo1Vun7TuwGsN+94olLEkMFm5S0Ca4dxVQJxtxThArFjyLrFz
	KzAGuQlfcWgoiLj7S41K2DyJSuE13CrrqNKnmhkXQIFP2hkCSFecpOw/
X-Gm-Gg: AfdE7cmSm8iONse96JjzUNR2dFizmhTnWuo9Kx+zhMGK3OtWh88/QOQHpxFFwZFp1Cs
	Ju3Bb42uh8opNQeqcavEHfobKD+GAqoPBOiEOz3ODFwrSmA9cl4H/ET2Wna/SrqmubuUZ0r4V4L
	X9AaQcFwVft0Vv4dtpsuB0KDGpdtlTam8Lb1wbBJ/ztVq/495zZfyACJQAXyn7QKMTUskYg2Qjq
	WYP58LBh2NVu71bBLN+3dphzCO1W4fuTtpouaycJWH8fGvErZQENhMaXqYJ6GRJUaQVqBMWXGJz
	t5BtQ6GeYDlRidMIgpAQE0sZ0W/RVhaqPK9gaO+Y/hpP4KBIwiGZtBbuEGvqYKNWSrgdPIVLhWq
	rgV680qfeX8Rodym1kz/EqXcZbBNSS5aaSUPIFswvHKCB9tUBT38+f+nIJGuENJ0cqmIOKoMmgF
	ss+70lRFX0A9KieuOHodkScx3qr5qRIWkBzjXq7/zbD8EPpdwucjmGOZCDtWk5
X-Received: by 2002:a05:651c:1508:b0:39b:b01:ab84 with SMTP id 38308e7fff4ca-39eb274d9d7mr7254931fa.3.1784304352699;
        Fri, 17 Jul 2026 09:05:52 -0700 (PDT)
Received: from thinkpad ([5.215.185.239])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39eb4e91096sm2703671fa.18.2026.07.17.09.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:05:52 -0700 (PDT)
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
Subject: [PATCH v4 0/2] media: sun6i-csi: Convert to active state and improve MC support
Date: Fri, 17 Jul 2026 19:35:45 +0330
Message-Id: <20260717160547.44460-1-arash.golgol@gmail.com>
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

Hardware testing performed on LicheePi Zero Dock (Allwinner V3s):

  - Parallel pipeline (csi1):
    ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture

  - MIPI pipeline (csi0):
    ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture

---
Changes in v4:
  - Remove sun6i-csi MC centric patch due to Paul feedback
  - Link to discussion: https://patchwork.linuxtv.org/project/linux-media/patch/20260509050921.22158-4-arash.golgol@gmail.com/
  - Link to v3: https://patchwork.kernel.org/project/linux-media/list/?series=1091921

Changes in v3:
  - Fix Media CI robot warnings about open parenthesis
  - Link to report: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99380724/artifacts/report.htm
  - Link to v2: https://patchwork.kernel.org/project/linux-media/list/?series=1091728

Changes in v2:
  - Fix indentation in link validation path
  - Return pixelformat directly instead of a pointer
  - Link to v1: https://patchwork.kernel.org/project/linux-media/list/?series=1054768

Arash Golgol (2):
  media: sun6i-csi: bridge: Use V4L2 subdev active state
  media: sun6i-csi: capture: Implement vidioc_enum_framesizes

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  49 +++++-
 3 files changed, 108 insertions(+), 105 deletions(-)

-- 
2.34.1

