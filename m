Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A753603EE
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 07:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784447848; cv=none; b=fBEONY5Qe7M+1iuW0J0rZSIjkUeTf9d3F28a8cGaKy7QWdsnUIgxgWEEWxmhr2CIiqUAAsD5ZryrCOvqhokNyDHOvvbp6/9MYOFovqypyZox4dCxSpVahKlzoZQDfkMuQHcyHeME1QiBbqUUjVrN3a+DBbsmvnP+t7XHnnBUZHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784447848; c=relaxed/simple;
	bh=3yxN3JLMz5HeMWbW4rU2gcByYCQ0hs2lAw/7HuV8onM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lRaHxVxqOmfkvznPmR3aBEoitQahqC7ogARigQnbaFpMnKXA5/JN8O1lPwO4PHvuO+HhPSNfTws6pidVbNtbf/kQjsBqUSI3NWgSXVbvXUtFa+lsGW6jzH++ZTFFrbqi0auujIIeVbbrWtFjG3jvY5gzK0GDQi6mQNeHns1Tz2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ot7RJzHG; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ot7RJzHG"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b0148201fbso4712437e87.3
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 00:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784447844; x=1785052644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UGNTlYZeZ9y5GtryS11RWRHWM+QBhlggNxIeV3niO+E=;
        b=Ot7RJzHGAJPPkh76wGQ6YJTL+ZdNNO0hlFMDBDxMqK1RYvyq/Zfl4tQRdVPHnscSOf
         VyPQ5wO83sp2c3MzVkB0rylW0WUURk8FKaW8W2a3fGJJtxGGQaAiue+6VWaFma3Fxhwi
         cDwEnoa0LaNTysfQZwufZa9gku9aCMhjTkYohGw3CQQt8gJXdBXUGvVrBcnOLuMZ77iK
         Vp21PHPuGryGmRc67lLz1Do1BZZFRQHqPSEanXwd3Ad73Y19KwIryFz2ZXbjDFGznXMq
         RjAg4kWdxE9W2DCHlJXUxROTspcWE3HC8mmKq/49140ejQCDku3HeAJ/v+vnkmmBRk69
         Gz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784447844; x=1785052644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGNTlYZeZ9y5GtryS11RWRHWM+QBhlggNxIeV3niO+E=;
        b=DMnKJf7O0ujkiYTIZlhCkVoV5cfTCyoeyxyPTrDGTDWqNjBcWqg4OL5GcvOdzHvhQi
         sExj6H9hpCYGyI0gGAFzRqxYCvapldwqqiJ8cajvPNyQr7YIvc0kN1n9geztT0gYGvbL
         tvkEucIDxgW5tWwUZMO3kvEYuK0zbxnBwbw89HuqsUC2lFT6oKAGJaOSBpZvBiUx4GBO
         zoUOZRoux985hRd2EnnblqR0vN3wJm5TzG4mVspytnLmLwMjgkt6Smpx+SuAxQ2VjCd6
         XTiip+pVMd124u04A6Rm1I9S+43CJPHqrf9Blp6yNsPKxxwcpEcNLF1XjUqfSTFbTwVm
         EpjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPA87qvj2W6OK+52Uhdwa+K2gK6gjbVq/wlUURoa9JZQYELRG+SEy4H+DKkutPWgIjphRBWbxShnjU+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKJazFdGZs2lECMtAHBj6IqR4a2cryZ7XLsvWD9lNEygfa2rPH
	jmOIWaBmOybORtr6u/FTderMcITjSfaO5I6PbAQThW3R/rpMLTKPD8cF
X-Gm-Gg: AfdE7ckag5KWCLLApepxF15Af2eFF0aKcqgbJbYUeq3Io+5d87scJXxpCDiJ++D8DyD
	YPC7lXKUV8NLzjeG/+h8NmRb0lZFd/qW+bruzb/xJHDpQWc4atGTZwl4b+ei86Kv8uC+wvpuq4M
	Wsne5trSMURb1qfUEOkDLkkKvGz07cDvaqh8AKOoSTXjxjy88WqkkxvriQGuwmqppuRmEev30ED
	BnJeOqfnmZ0LixrULiYcIM6/m+Pj6NG7DKWl/1ljVRoMDt3hsZIs4/Wsyff1Yz5Cu/H02Kj04U0
	yu15uX3DIga0VFrDYX/CUVKWeicTj74NydG2aBuCGi0Z/Ta8+WOu8SnL1vX2rgzGYFRkan8+ghg
	B8E7R4NVTKWs9ktHXDR2qPABqQBptPpqHWjlLdgqdYtK/cmBL9SLCocheme1h3GDkH4xST5ksL6
	FZlzLsJu9jyQs/p26kY5pF1Od+tFoWuCUTMJVgEnl1ZfF2TxJTPYRxkMjiVO0=
X-Received: by 2002:a05:6512:398b:b0:5b0:eda:de2d with SMTP id 2adb3069b0e04-5b28f8612bamr1938538e87.19.1784447844204;
        Sun, 19 Jul 2026 00:57:24 -0700 (PDT)
Received: from thinkpad ([5.212.61.200])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e0ead7sm1555983e87.42.2026.07.19.00.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 00:57:22 -0700 (PDT)
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
Subject: [PATCH v5 0/2] media: sun6i-csi: Convert to active state and improve MC support
Date: Sun, 19 Jul 2026 14:57:12 +0330
Message-Id: <20260719112714.72802-1-arash.golgol@gmail.com>
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
Changes in v5:
  - Check NV12_16L16 format in enum_framesizes based on Sashiko feedback
  - Dropped Rb tags due to changes in second patch
  - Link to Sashiko feedback: https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/22UBXCNQCK3JZSSWMDWIHRIFNAZ3EK6V/
  - Link to v4: https://patchwork.kernel.org/project/linux-media/list/?series=1129723

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
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  55 ++++++-
 3 files changed, 114 insertions(+), 105 deletions(-)

-- 
2.34.1

