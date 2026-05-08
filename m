Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579F030DEAC
	for <linux-sunxi@lists.linux.dev>; Fri,  8 May 2026 16:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257033; cv=none; b=QGzQGP3wXmB6V7YoZ6jP2/yfEJZjZqEAOn1yQYHmiL+FdA3mLSGRdiIFcsFM+PEuc+qFC2o+7+8xCsbMSH1aZ8JlA/hfIgxW7sXLBdCO+dSMIZ52FpJytORgtMt3K7C9eYgssv0npkrcs1OF9TlJ6FF4dtOeNJrnAGvWf73jwiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257033; c=relaxed/simple;
	bh=a2/iVMjW+vZHe02Y/Zy/BS8miYOFJ/XZDHc3xm5Anzk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f2UTP/yXlj6o08pk+D6YTwWEYBeTCH4NjC0lY/3FxZ7Z8im4HjafD/zyvc4LqSR8++WyGmvy20SL5hMDmCipF6PNPmeTDB2w8sGmk3+R8QN9Z3ae+O2oQQxNCY0iXo0MRJ+iSZ2jbl1nBqPcoin3Tvp3d98PgIhPcQjmkuV0IyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+qB5f/g; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+qB5f/g"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d73352cf2so1770850f8f.1
        for <linux-sunxi@lists.linux.dev>; Fri, 08 May 2026 09:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257031; x=1778861831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cmUxS4Q9Tzyin8+N6iP92awnxvWebVH+uapUMeaf/ko=;
        b=i+qB5f/gOxV1TjbqBYKCInDD1k63Vs4nmjLAGt6o91APTfh9PkAmFHTqZsALCf1Uft
         Fx6JHR+FJ4yvTKt334Jg99cEzFMvO8caZY4Raaf5GDdPODKwGn+3GFgjiw/LxLpgrWRU
         dZ+znYx0cz9WtCzcteidY+Tz2hOrSmfcqMzozITpCWGeYQlk9K2qBLZ49ddTCTu7hDB9
         ALEqZyleYQNt41jvf8vvc8MkI7XuOZkVomsnz3IZ3EriGPWt/WykV8UTQfTgFdIIY8ID
         7m2X9nrmK2e/RmuUCz3JKQvL+LmTES++cLXVrX74ThVEGcGA6yn5RDmyB7D7mG9A8bCK
         gHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257031; x=1778861831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmUxS4Q9Tzyin8+N6iP92awnxvWebVH+uapUMeaf/ko=;
        b=lRBaHwmFIEvB6co3TUhIGgBY37gIYhWt1CNLJocYstUqr146nVDxc4Fwul2WvGSRy9
         YpB7aqPEmJter5LoSVO5qF/wSrYGGrHNiW5XKCmlltlvn22DyS+ZnUizb/p+C1rAXMDo
         MEnhoLXOzx9TphbueWJqHinxQjmAy9RQMPhRoZB5pzYnJcqoQxnhbH21iusdCJQ2phLu
         R1wvz/qJY4bOCLfstVnEyac3JJzQs1BimIcu3YD4g6woOGqBR5ZEgbFXlKTGLJjHwL1J
         hi9e8jqW77mZX8u7OwWVXXUSctab4OuEVbkV/5vi3yF9uWFnofFZKI919UQ2kVJ8W5Xn
         mQzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HK40hvVnHe3spRXW98w9mRpq4TxmgrOS7kDuj6yfMM65sV7cMkGf5htf1heuQI/brRNcYXONy/mw3jg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXJyzKbHgTV81nuinClq8fgXqXixiJvxNkLz7U/rFJMzIHtiIA
	GW/WzaPLzt9W4oDkG/aCx/6FmpU72OVEKQfR4fV4kYKCyZear+0xcFMn
X-Gm-Gg: Acq92OFGoe3yZ+g/rQBSP41vlFJPKS2xwJ11uc+stI6uijN8sIg4C2MmrehaYwqX3Kx
	tWPgjHflYhB8N977TlSpsrPSXhD02rMdLdBehbKgJZ4gBoMRs/MyPtsFhM900YxZIp7e1Yr+wLC
	Kj5B3U2PSCzIyl54iSgA+1NEZCtNdVpjssFao9qB7br+Yo6mmvAV3dlXUW0yNJfaddH66pjiUjy
	36Cib4MTY0J1iOTwPT+ZN3+xUFz7G+rMpvaaqcktHNjKkSuO6R4D1FaSYxeLxI9fnr29/tUrjpi
	STGRBGgy7vEC7nIBbdu+U9KW6yAdXd78kUvf64uWjE4f+3YtR38SfJWK8SXfC8eeiJfPpe5/iO4
	ICaGA3MzV384jZd+9E77JCnDLeiyooFgPswudtgo6E09CBmMbtCL4kT5F2UzdFGOX+dwJLfiy91
	zNAXQAJHm2+xdXJiQ8R/QHiG0mZS3yx3nOFfUgpwNA8EqKuDOIvlsXGGJKR3yZUfOtqOAwLWCgQ
	TYfV6iA9IHMNfOO9cPP
X-Received: by 2002:a05:6000:4210:b0:43d:73de:abd2 with SMTP id ffacd0b85a97d-4515ce1c4demr20464240f8f.26.1778257028011;
        Fri, 08 May 2026 09:17:08 -0700 (PDT)
Received: from thinkpad ([46.164.92.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491e94c0fsm5500124f8f.32.2026.05.08.09.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:17:07 -0700 (PDT)
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
Subject: [PATCH v2 0/3] media: sun6i-csi: Convert to active state and improve MC support
Date: Fri,  8 May 2026 19:47:18 +0330
Message-Id: <20260508161721.94285-1-arash.golgol@gmail.com>
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
Changes in v2:
  - Fix indentation in link validation path
  - Return pixelformat directly instead of a pointer
  - Link to v1: https://patchwork.kernel.org/project/linux-media/list/?series=1054768


Arash Golgol (3):
  media: sun6i-csi: bridge: Use V4L2 subdev active state
  media: sun6i-csi: capture: Implement vidioc_enum_framesizes
  media: sun6i-csi: capture: Support MC-centric format enumeration

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 154 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  88 ++++++++--
 3 files changed, 143 insertions(+), 108 deletions(-)

-- 
2.34.1

