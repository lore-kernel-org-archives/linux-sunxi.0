Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC621CD2D
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 16:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710693380; cv=none; b=FpNlfJaGKOGXkbnb5W1wZtMvYl2OvxyNpkbjw/V8WtxNTLSjaJUABvPEZIGhA+jgoYhISTOqydwUGAU2ZMTP1bnHYeryc4anVPawaQ7lPc4mkZM+W5jn1/P/lxl0Szq3poWYOQhmdIF7jyEDg1IxIp4xFcDg/hI634iH6ZJwDBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710693380; c=relaxed/simple;
	bh=cTjsb0/BpLMT/X3BBcyyHdtQwgY4lAHAeXwhRuC8FwI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CfoYjl1uyDb5IOxqzZitjs4SvaInbZmPdQmS0CPuNxCHvTEl7hg4Wh+u3oz5TFT9QRF3nXk1AbVZEbTcDPp0Q+JBNbzh5lhgQRfH+4SuTqCNejrpY8O3d0yZelZdwcBo6v+fheqQZLgt/K+5roy9kB2PFWeQkh+MZ/fk3OTNu2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RamMtx7Y; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RamMtx7Y"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso2050403b3a.1
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 09:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710693378; x=1711298178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OF79KXhVjtXexZ/GpI6MkY7a20tX+4xRmIvmqST+AnU=;
        b=RamMtx7YUZy9qgxaCbgl5EQr3Jm/AvTVz9IR4aVjIrV4DJuJQa+5RugfW82yZ/mffg
         6YfEAOeRYn1B6X7tgx8xG2Pz7k0UypwWboO+Fzi042okp9q7VTKPXnBz9WlMFK3rzqtF
         8nNxezC5IbKFjIbwJWE9aP2claedgdQVOxLV4/SAsDqFx/yhmNUYUbAFvn1us/PkdrLB
         YHE8+c8YN7ub7P37IUC1IK7Do4bOY6kLT1KI93wB/+96AM3MjWiD0ZB6I1ky3e/tSwF3
         NYnNDeeRT2rcVeoGJxulJRQLCtQdTxlu1ZGvgn2p5FnBkSzhOCb3IbXms+g6SxbObsDT
         DoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710693378; x=1711298178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OF79KXhVjtXexZ/GpI6MkY7a20tX+4xRmIvmqST+AnU=;
        b=N9/MRbtEwusHuJ/KObsYfcRzT0yu5H5LcUv+k5o98fskhzFDBeySIVu4Zo4LOu0pk1
         4Eif+tHPHnPxXaYSH/foAMlshMjZNts5VD7qMeFSyKuueCgGs/OIDols/ODqEjGzFQeZ
         2dskz5S1YAOa/stGxpbBF0NV6sGOldy60fUyizWtq+5vQf9vKEwzoI7bE+YUKarCNZA9
         zbORyTKLzgCQLXJ/0zPWo96BEGTK0mPVppC0VmxJ8Ptzu/SFyjCQPR5hSSSoa7lX9FVk
         L+SgVc1b75NOVZTDRM2GmwXCEQuBLvYxvhAzaKkmSDRLdLNHvL4jbFIDoyvIP49YewII
         YvDA==
X-Forwarded-Encrypted: i=1; AJvYcCXOLhYjnQ1tmm4baoml4MXJSfUgcRRLr3VlRV/wlUchAFue293sW5t9G4DsPZDMyOvoUkB+VJiCp0Ih+vSXZ9SmIlUkVxzW4mnaudg=
X-Gm-Message-State: AOJu0YxXIRvqyuQNi2V+ml7dTz1oeXmXto+ruakANWxSLsjoYrHRhUhK
	RBdZSufsqSi9e7bcNI9as1Ow/3cTjVGrMvWnoC4P5W3wetBQPqhS
X-Google-Smtp-Source: AGHT+IGa2J0FGsz6KPc52ig70pMekzfNXoYYgf9jnNcxMqsM/th4nXVjaLrcgxRudeFE0v35xphm8A==
X-Received: by 2002:a05:6a20:e123:b0:1a3:4ff4:219b with SMTP id kr35-20020a056a20e12300b001a34ff4219bmr9172546pzb.12.1710693378049;
        Sun, 17 Mar 2024 09:36:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p24-20020aa78618000000b006e4f311f61bsm6373725pfn.103.2024.03.17.09.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 09:36:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] drm/sun4i: Drop COMPILE_TEST
Date: Sun, 17 Mar 2024 09:36:15 -0700
Message-Id: <20240317163615.563428-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attempts to build the sun4i drm code on various architectures using gcc 11.x
or older fails with

ERROR: modpost: "__udivdi3" [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!

This is due to commit 358e76fd613a ("drm/sun4i: hdmi: Consolidate
atomic_check and mode_valid") which introduces a constant 64-bit divide
operation. Some compilers / compiler versions fail to translate this
operation into fixed code.

Manual exclusion lists such as "Only build test this code on this subset of
architectures" or "Do not test this code on this set of architectures"
do not scale. Remove COMPILE_TEST support for the suni4 drm driver instead
to ensure that test builds are only performed on supported architectures.

Fixes: 358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/sun4i/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
index 4741d9f6544c..015539bfda2a 100644
--- a/drivers/gpu/drm/sun4i/Kconfig
+++ b/drivers/gpu/drm/sun4i/Kconfig
@@ -2,7 +2,7 @@
 config DRM_SUN4I
 	tristate "DRM Support for Allwinner A10 Display Engine"
 	depends on DRM && COMMON_CLK
-	depends on ARCH_SUNXI || COMPILE_TEST
+	depends on ARCH_SUNXI
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
-- 
2.39.2

