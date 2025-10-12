Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC511E3DDB
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297025; cv=none; b=qGAMwHFKFNL12IioIV3vHFMdL69AYRocqqqIOA3+8fswaFguiX+RSICVMm4Yd1IujKYa7E6uvn+HcK0Vf0m/b8vUNf2Q+5H+2rN58ZJDe8MtpD56faiMsXEReXiH5Q6NmeMhELWMDOEwAC3LXGhG3ftoWsoC5+pEWTww9m3JvQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297025; c=relaxed/simple;
	bh=NgcvXnqcgYXjrcWR7jLLpOQ3cQB6p2pkTov3MyQ+eCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lsfey/Uv4gS+bJrZV1tfn1966+VPJ7BZMdw/6eMIqRsR/JWjyzx6gtAgPxnZbjjKCzwXjP9OnrwqJ7M+nA2QeRZtqf1q0HDlqYhOGJ/RnTQ5WKC3MoUFHy3WJX0k3aqHHdpBS0hcBBYtqxQmisrfTw6aYLPwbjSfiENbR108d48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhrKSx8A; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhrKSx8A"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b50206773adso841304166b.0
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297022; x=1760901822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9pllFFRdLbfJa3CzMw9MDenjUagmZAUwkBtCn+ZhPI=;
        b=nhrKSx8AjIzYf2wmc9YrwoZhy6d6g8MD9ivotnlNSdXoox/nO3kqz8zvZeTunGa45x
         3CUITKk8q2pG4xpkDLsXqqacoVgkZd7tbZzqwjjXdDSiHRtmWhrmOpQsY5Nbfl+tFOLr
         mUg9o8Z4S5z2cQpfRg5Cn8NfBs1QDWhVuwIxe3UlcYjRlGX1xnAKx+1avKKZEFwx9lcd
         PRUK60kiSqtedHigHHWIKH0Hb+S6VBD9QTMdHlAbwYMV/QRdepPQcamgoSkwsJdd+JCs
         ye0gSf4Bam/UhkRPUrIDE/gCIJxwpuRsYTfrmYfPIp6a/gyn1umf4cTIKMK8EF1e2RD1
         8a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297022; x=1760901822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9pllFFRdLbfJa3CzMw9MDenjUagmZAUwkBtCn+ZhPI=;
        b=n31hKk48h2rgHNg1AqxqryPEpWj0Dk0faO+L38w+9yiXugX2TJpSGS0oMvovPX0zT5
         jnf1kduRaQBQrpZiZ5acyVPpaQVuZ7CkDVh5MdID4jpTG6tjw0vwzooI5YdVgHoJc30R
         zsaNDZ+pZh01CcnHFP+sqNyzulK99gXTEdZ0snpf92wrYZ1fan1jI3RxZw80SWGlpiQ9
         hhdfWW1mDeLk1kc8GFZoJcci5ecT9tmC+rOhjqq3+QT1X6ALdpqABvfIUjImylERPcAf
         bqRsFOHnqCRc0owdgETipDixiG9JEeliFfMXiwcroq2tnfVQ+LOpTeLI3l2Hd2yt+Yes
         FORg==
X-Forwarded-Encrypted: i=1; AJvYcCW/F/VXTf3X0nCC3Qn4NERyIWfD2nzdtXGFSccvGg9P9BpNEOFJoIjI/NCUg3FIRBKPdRWvJNjHkvx/4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNF6JIDdhgFq7wBvZ7nBtDHNlgNfeoc4rJg1BoCM93++acFwNM
	zTiXRhieQ+7TmB5j7lhmWuxgDkn7cWUxgqvijC7Xzaa0Oc7zFX0eEufi
X-Gm-Gg: ASbGnctrY8W5I1MDTuNX3rpHWuCrC+9Qidu8UjbMWWAunLFEGTfyzWlAOJ8ZDiDUPj7
	VHY68jtXkeNAW2HXdCsv40IivSuN28anOhqCA8pc3DXrz0iTLPKJyd13GTf78zw+kHs+9vKnQ7B
	ex6wFxipM4m/+Zx3wD/6hfrZUyN5tRkWExwbLieBhjN3/N0UIAj7axHmvvqem6zCGwIU8Lfe+6Z
	odOsCNNKBfZcBwGEpJ468o8Ga87R7VVTry5rTnxT/gLdjcxup7eZpEdPLk4Ox9NrWID8obcVhyM
	PPhG/ZMqQ4xrDN87RwrnSg8ZfKUJqrD2fW/RJVQ+2lKUg4noXeE5XXb5KL9/+7V4ElAHpr7/cJ6
	cPgp9LhX4LFgE3PSdNvRRBtoiA7+iRK54rCwqzp3Gxr00c9AE8VHwz7iRH+8Wmsw/r9cvm1yyt0
	e+xA9uurdnjDw4J60nNBMo
X-Google-Smtp-Source: AGHT+IHSovbe/H5UYTgSA1JPDJbOFUPVXMxcZWI/chJwYDsAxjOuahQb+OA171YuZ238MSsvaekD/g==
X-Received: by 2002:a17:906:6a16:b0:b23:20e7:b480 with SMTP id a640c23a62f3a-b50bedbf4f1mr2357634066b.18.1760297021975;
        Sun, 12 Oct 2025 12:23:41 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:41 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 02/30] drm/sun4i: mixer: Remove ccsc cfg for >= DE3
Date: Sun, 12 Oct 2025 21:23:02 +0200
Message-ID: <20251012192330.6903-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Those engine versions don't need ccsc argument, since CSC units are
located on different position and for each layer.

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
2.51.0

