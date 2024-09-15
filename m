Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82C3146A7A
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Sep 2024 12:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726404148; cv=none; b=VJGtgE/5khQvUxo6xVbz8JqqnF14U9bSRR3rtcjYrFYvzSj23XwbIRSq4gYmRs9H4M/8n1+bVIbLNDTYJ7FElLqgzT4EEpqtRlwX1CuVoaG6p4aa9y4GNQr18j2tOY+nOmDqWvD7qOOdhyAy6UcUFEcrjae/QeJ6pZs4p+nPdxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726404148; c=relaxed/simple;
	bh=WYUiwiY2xirV3YCWVuRo/1eCoCh+/9EzRMm1hSd4MfE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XWDmbdfFDlCFANy2HUNtWzWbNrz5aSY8DVtTc+JwK13NBPBleg4XBJixKJBlptpO+6Fb3k9GncAOnJssBpCKzPqp1c9xQJfCb9OeSR8Ph2W4ZU00aFcSAEQ9gJe+4CBA6/vvIlnuMl1j2j8nx+cu89QSZTr3d21vcbFPUCSLoB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MI4Mvtfr; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MI4Mvtfr"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-374c7d14191so2867306f8f.0
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Sep 2024 05:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726404145; x=1727008945; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KAmoRpSGu0fthg3IsTh3p9z8Wk1qhoLI0UGs01+Vzbg=;
        b=MI4Mvtfr4fz9sbT6m1NuP5RPN4rzQM4f1vEaZCrEEAa8PhjlzpB1wnpX5Ec//iqxRk
         7NxzmKMQwf9TJlPWXxtQkBsGV/grcrOtZjczoArVAfOtcXKmnd92lY0lFXPBmUb4c/UC
         m5OnaRQgM0mUxqA3TWYElLOE7l97OUC6iip3mLiak1o799p0T/E5JaXzsbRvgy8Kn9tg
         1I1GyPfb0YeVWJy3dB+ZazaD1gqyUwXsRLpwaBszzyYNv+Ne90F2nCndKcgxTrIDzSnE
         97A0QFI4UirrorsUMSu1l8kxtpT9MB7pbDJys/Bp532rLgBLU6OVb8j6bEXsPYx84Rze
         xJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726404145; x=1727008945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KAmoRpSGu0fthg3IsTh3p9z8Wk1qhoLI0UGs01+Vzbg=;
        b=ifQRuG95R20UK9WHxpYQMYOxpOZVk25URxVKfiKD3lKF1l7X7C5sOi3vH83m474GdF
         RX9cmYiNYq0UsfN4o/sOQqZoJwazJm7oNMbYDzoDfMEQE3slP5Yo/OLlGS+8/TKipozv
         HrUdJwwXg/XkV4vBe+HntKHuMtw0SCn2qTumxZEH4ZArFmRY4Jwtr+KmyA0ywgUN+obr
         YvSxt7VRVHs1DTsTZr8HSkMuvtw2LtHcllEaNpkhaNwLwgdII84niZiM53v34uyFQNgc
         m+Wr8Bpz3B169uNYAiW/rfSzaXdHDF4k1bo3y68Wk74tyVS6t6DqHQ6YUdOeQJKs03YH
         Aywg==
X-Forwarded-Encrypted: i=1; AJvYcCWbS5SqMNyWsFwQAF6Karev0W7yFDlpZXYF2vUyzQZmZfjXpOTxqs8dM/1tb2tMUAnKwkcSvpWlYlKsxA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/DXLi+mbG3ZnLJbrmUFW+sLxc5vwuqNi7gtluiWmXeiBaHTTp
	ZFnccEieniMDNXr9oJGvpp2cYPt+EJnzzoJ0iaKs12GuY72vvHN+
X-Google-Smtp-Source: AGHT+IH13ljMpV/M4s6ZTPZ7igI97OJY6H/YX0z75kicoEwj0ihA0PkxmlqVfGWTgPZhVPTCLOld8Q==
X-Received: by 2002:adf:edce:0:b0:374:cb28:b3f8 with SMTP id ffacd0b85a97d-378c27a268bmr7448921f8f.1.1726404144909;
        Sun, 15 Sep 2024 05:42:24 -0700 (PDT)
Received: from void.void ([141.226.169.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73e80afsm4578802f8f.38.2024.09.15.05.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 05:42:24 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Andrew Kreimer <algonell@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH] drm/sun4i: Fix a typo
Date: Sun, 15 Sep 2024 15:42:20 +0300
Message-Id: <20240915124220.105873-1-algonell@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in comments.

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index d7898c9c9cc0..0b24a5e3ac5f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -120,7 +120,7 @@
 /* format 21 is packed YUV444 10-bit */
 
 /*
- * Sub-engines listed bellow are unused for now. The EN registers are here only
+ * Sub-engines listed below are unused for now. The EN registers are here only
  * to be used to disable these sub-engines.
  */
 #define SUN8I_MIXER_FCE_EN			0xa0000
-- 
2.39.5

