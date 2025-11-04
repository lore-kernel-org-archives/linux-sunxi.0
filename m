Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FA933DEFF
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279808; cv=none; b=CC2VR2nC52q0zHsTtt6yuvv2EF6vDqmb9iW4BgVjgxVKl4y1TnofI4ND41LkdFYzMNqrxxfqGhLgnx0xnsekO1f8sC2zNKrao8dp7AwEJeHtdmp5rf3KxEmtqs6txm+MfXqokuP6rqJpMzzMl4AX+W9PU8BNfx3RHc1VgkoaHhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279808; c=relaxed/simple;
	bh=AVpGhbTlWMYcUtDZO75Du13zXCCyhna1uvtNgig20wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jh5o8jNrn47TZ2QiQBPydePda9+t10UOdbYl6TquXbvCt2Gf6/UIbwz4OOAAdP7oVb2hY1DuD1wBFdcJ9kVdz0sAKX4VUa4faDT/W2gPRfRfGCC6IMDp39XTqjMISIORwAyCJ95LaHv1ND9EmHCTEAZVwjjppRJ7GCwRY6FgA88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSsIRYVp; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSsIRYVp"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47755de027eso7473005e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279804; x=1762884604; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBzuHGqFjGOh4IAWV5vCG99JkAgbQed0TO0fNPxfrBM=;
        b=RSsIRYVpa1rqff9FpuHNPuukO0r3S4jCk2Pnrg+nuCFlkDAarXpWst4OM0skTQhvtI
         xTey0Wxe1KRAJb5wU19LLWp94WNNHm7I1H3lrK3sOCxYzvmtKqNXUvB7zf99yvf5slfP
         H7XhfCPkGRZH1gYu1l7C9S8+jF6upIwPLgnmQRdRmG4SwvrSiSOybx3inVp+jN2j9856
         o2j90dW2ZXcIbbBPb/RTJqVVfQX/fto7J9Wr7wi7Hr1FycNe2haAAS46w3Y4TPWIzvht
         pLvV/YaCyuSSkqezOKaWZ/8WkOrbHAYeYEofX5WkGtVRzP5J2mbmfxA6V6jAjW47gH8A
         n/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279804; x=1762884604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBzuHGqFjGOh4IAWV5vCG99JkAgbQed0TO0fNPxfrBM=;
        b=PLfueoEbwmOg+aapIp7PtQokmKOGR7XQNng1+LM3dp6c+t1kw78K/nX+yngxReuHZo
         YvqnPuXbe9zy7BhSoAkKdPmaxUw9iTPGe02QjYzIpRLtazc4FnOZsL3NXziT3rxCbBcz
         XMiE3bP+0xQdPWTsWwOlY3+l4nehX5ciObozC+0KEmwxYcCF3wZRCzRObAeXJ8ai32CP
         0NlBe4tGfTnk4J6kBltF3ZEK7Lr75dsDPalY5Ub/AJSOXVtGGxmiP5U4Z6+ojwzd0v5b
         etpvkEnzuJQs3EA7mYRSZNDTW6mamoT/oTXb0W7/sr25DVjZGHZd3Dx9sH8uGzc08iAK
         dv9A==
X-Forwarded-Encrypted: i=1; AJvYcCXEIo/vq8BVeLdguXLwmhGafMqmJg3J+LwxPkDge7AoMV8A4dWAnDxJ+h7C3yFGQZeO9NDySmPyyPldJw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4HQT+P7O1mWM0jORwH9ym5s8aE8jaxoM2Vxghxfnc+ljToHu9
	uDwBiN/EToINphFS0AX/kZkzqGBardS2ZowBI/uqaJpkrUwvfNQB7aUf
X-Gm-Gg: ASbGncvg/PS2LtnEMjM1s3ctsKbCo+X4zYPZVbCMYKTV+dOKK13w40rYwQj/mel4vYf
	BHWKz+7z4E8GTZ9OjfSfrvxh+Mp0HK8iUcU9pnsICKU7Pma07ozvZV2mFv8ntmjw/NrzMoGheiq
	WyJ0lPUYxYJ0mSS2DWjcGMXlM5+/urB4713uVjfQxofUkUA+dO0nwo0DZiwxH/N4JwJ8/G4+MOx
	DZqupjwNVYaO5eE5TfuDh4XJLsgS/uezNNk4J6xAwTJGdzr457M03o+q2NqurJXKPUHC+fPjcvV
	VWHVVVG99xSKQDGfJ1hyYxx+onx6pP3+1j3mbJ61aRj4CNFxr/6iQ++YTQa2Bwg5s7+nRnw5o9Z
	CEn2q16dR8efPjOiuEV78RASmUGZJx6rhfnU264P37YYPVSTXAl5+uAwGyzhxw5huqGIwitC3UV
	P9txbHuGySGlBN31f0KQ==
X-Google-Smtp-Source: AGHT+IE+aXaz85+OcD9Vk61BR2+xCkKdEVOqbAdpjmknpg/EVMyrQo0hoti++4WquFHkKitI5cwjxQ==
X-Received: by 2002:a05:600c:4e48:b0:477:54c0:6c3b with SMTP id 5b1f17b1804b1-4775cdad2admr2728525e9.2.1762279804193;
        Tue, 04 Nov 2025 10:10:04 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:03 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 02/30] drm/sun4i: mixer: Remove ccsc cfg for >= DE3
Date: Tue,  4 Nov 2025 19:09:14 +0100
Message-ID: <20251104180942.61538-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Those engine versions don't need ccsc argument, since CSC units are
located on different position and for each layer.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 31a8409b98f4..f7f210a925f8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -790,7 +790,6 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE3,
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
@@ -800,7 +799,6 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE33,
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
-- 
2.51.2

