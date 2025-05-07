Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331A428ECDB
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649358; cv=none; b=aFDMWpzANRgYQgFZQx03SCqTNVWD2kU9o7vii9Px5mhLMoHcBzyAzfnjaroLMg6Ld+vgc2iX+WfiwfLdVtoEsEeT4ez9/1kFfvJs9iu7SID+POBVhrjXumr3qtb8dELD/rv1KQqutQX9aXqBRuU2O7niM4ZxSgGiypt/f6eS6FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649358; c=relaxed/simple;
	bh=xZdWHwn2SDZzrrTSxjZSjGuC6r+bWBY2bDoC212fjrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kyadIWW+uz6uAZzFA/PEHtbNW3Pk/ZUeNy2RB2VzP4vNfjsMqFZfpJgwMDnQsWDBR3EZC5KzC/vAv5r6PRZm2XQY9vmViPbkfVQgFC7DqV6N1OZ++JS/0P8ni1ELmNFaOmZPqUoia+2MWoSrKhcf11NE+ISwRPquqRTomdGIcUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3sTve+n; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3sTve+n"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72bc3987a05so188849a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649356; x=1747254156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOnjdA/K9t8YFoMyvpC9mBKsBSMkiqJxTGJB4LzuHbI=;
        b=c3sTve+nx2v0VcPYgtOGUAKuCrM2IDNBlZJNg4ZcEBVyYA+Zx+63cYodv4GGKkm5xh
         s1IW/CCvli/Nzuxu4T7ulw6IdE99kXfqtt48r9FeOC2BjwxaI7M5d0c599EVqtQYoGKw
         jesqN3C8NAGqHVOAWWwAL/QFHk/ZHwuT0cc8qP6U4eqVHh1e20Hh5thQc1nz3x0yajSJ
         egIp7AD//nfszIKs2lJHBtwyD922MqnjrPeZlP2uOLNm0KLpyBP5ZbZ2davvH06PVGNN
         Bn2LnCwaGCuRVvU4zloe4LZkw3Jdclnx8TwfMN+BQ1sRuNzpEHH0t3DJtiqC8vhunAVV
         T0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649356; x=1747254156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOnjdA/K9t8YFoMyvpC9mBKsBSMkiqJxTGJB4LzuHbI=;
        b=tRur6laNOkGIljeeeWereE7VqswslG7mwNpNhPuqy7p+HARF+daRUFLtNIGnYX3iv/
         2WQHXd28gtCworEFsedJxJv+M0yBnTdSIA8jVDB1chzw+VSnhYuQMCfxOpb56XmSxWQ5
         EEmyXY7+pvRWRNEtiW5mcsPYR9JSbz845o9yEPEh0ZqXumAEBgqbIkc7Y0k6CIU2sAZV
         xcPcBxJXY/94FXAARbAxv37W0vviBSWohnP8rCbRdU3K8FwlQkBjIlWDC26G1BOIiPkm
         XfJqUCm6GCyUPQ8HHTb/arU4XZY1Db7XBfX4mNFGh0hqAgZ8pDSZ/VNLawItb77l+v97
         Nk6Q==
X-Gm-Message-State: AOJu0YxKliJs/DM+Mbeq27U26Vz7RhsN6F3OIH70ILgtVZlWcKxFgabT
	UVwUetU6DCU6ZYEzZzZtUcjHvkasL02b3OJgZVyr3qDhHt3Ue4KkkIhGvA==
X-Gm-Gg: ASbGnctNZnrXREkOMnAgc4+HQv61NbLPpPpTWsQCtk2W+hG6YmnjfoSpVz20r0/A9na
	Vqshysk3ju1cTpT1EuMeMTCPAaFIsApwmG3tD0zqHyaN1uS9MM57RKFXhgOXdsnySJ5GnDeie9F
	ioZ1T2NSyii7LziNDg+v2lsdu3VPqDCNBb7W533+U/vwFKpf1qOJbSFD1OZS6YqgfUoGHeNYh5v
	YiHSWvlHu/qemH3VmNBT212aTQd1XATcP0sax7Hzj/yflnrZJRQjS7MSqvDEvFCyXI94pzntXac
	SJZcydMRNFYA0ZA440Dn3DsJE2aoSLdzowuk5wqaV/pI84K2Lj78XdhC9i4t
X-Google-Smtp-Source: AGHT+IGhdN7iQduVHwjpHb/fdju1Q9acMOat+8tQez4g/T+ucKmAnspCZWL5Wcod8/fm0yG7hchEvA==
X-Received: by 2002:a05:6830:33f8:b0:72a:b2a:476 with SMTP id 46e09a7af769-7321b364c5dmr525805a34.3.1746649355944;
        Wed, 07 May 2025 13:22:35 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:35 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ryan@testtoast.com,
	macromorgan@hotmail.com,
	p.zabel@pengutronix.de,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Subject: [PATCH V9 11/24] drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
Date: Wed,  7 May 2025 15:19:30 -0500
Message-ID: <20250507201943.330111-12-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The vi_scaler appears to be used in preference to the ui_scaler module
for hardware video scaling in the DE33.

Enable support for this scaler.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 20 ++++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  4 +++-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7a21d32ff1e4..3eefdb710dee 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -94,12 +94,24 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		hscale = state->src_w / state->crtc_w;
 		vscale = state->src_h / state->crtc_h;
 
-		sun8i_ui_scaler_setup(mixer, channel, src_w, src_h, dst_w,
-				      dst_h, hscale, vscale, hphase, vphase);
-		sun8i_ui_scaler_enable(mixer, channel, true);
+		if (mixer->cfg->de_type == sun8i_mixer_de33) {
+			sun8i_vi_scaler_setup(mixer, channel, src_w, src_h,
+					      dst_w, dst_h, hscale, vscale,
+					      hphase, vphase,
+					      state->fb->format);
+			sun8i_vi_scaler_enable(mixer, channel, true);
+		} else {
+			sun8i_ui_scaler_setup(mixer, channel, src_w, src_h,
+					      dst_w, dst_h, hscale, vscale,
+					      hphase, vphase);
+			sun8i_ui_scaler_enable(mixer, channel, true);
+		}
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		sun8i_ui_scaler_enable(mixer, channel, false);
+		if (mixer->cfg->de_type == sun8i_mixer_de33)
+			sun8i_vi_scaler_enable(mixer, channel, false);
+		else
+			sun8i_ui_scaler_enable(mixer, channel, false);
 	}
 
 	/* Set base coordinates */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index ad87ab395803..6839fd5ab602 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -835,7 +835,9 @@ static const u32 bicubic4coefftab32[480] = {
 
 static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
-	if (mixer->cfg->de_type == sun8i_mixer_de3)
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return sun8i_channel_base(mixer, channel) + 0x3000;
+	else if (mixer->cfg->de_type == sun8i_mixer_de3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * channel;
 	else
-- 
2.43.0

