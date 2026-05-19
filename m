Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2B53769E8
	for <linux-sunxi@lists.linux.dev>; Tue, 19 May 2026 14:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779202063; cv=none; b=DbsoK9ohyE+sMT3cayqmP7sTGpHYLJ25HhazAAEgvGcsxkzsIlNniGt0Dq8EWucGP8hTBJ6yGzkHzOiKszHQrb3YRNjPxvPpUPZv91vPn/AE084CIgC2Oc7UF6FqfX7JbUU5/jk9kBOpLqNYrpdwVbn/6pVwNxlu+bJuqZZv9MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779202063; c=relaxed/simple;
	bh=tYLDZyLDMsiJnrQuLxzYP38x7kZlanYxzwgaiO61vVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=GbEH495C7lIuZPV113s3iwhTUC5oUJe0HYW2Z4IfCSS9F5t3/IpQ9q4wZ9G62Jr0T9OsxTo+x/eBYPzPZ4uIqzOCFWVe+uBzWs53LRIcAuMWqpeSE333sGDrSLBVVDR0i0PESnAvBF0CRTmH02pnYsv1RITVGc6FcFN8Ip05dMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LXALgefw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LXALgefw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779202060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLSJynfj/SfMKra6MuoVzzg6ibW6tvdwMbY0XP2994w=;
	b=LXALgefwoYYJDeHU04r9Ys58UB0+nT7BBBzpXxRQWtXB+QgUx8WNJh3Vh2m1TvsufMIq0Z
	R1kqzBcJKBJRketC6iT0shhzqxrLY9lzRGF3Ap2fTpWBkaqD5OE/zJoXFdHqf6FE620Ez1
	+TFZVVbWVpvNV8nrFE7ivi3TjrRKf+A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-e3dXhEqKMg6LEReWFGq3VQ-1; Tue, 19 May 2026 10:47:37 -0400
X-MC-Unique: e3dXhEqKMg6LEReWFGq3VQ-1
X-Mimecast-MFC-AGG-ID: e3dXhEqKMg6LEReWFGq3VQ_1779202056
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-449b2a183d3so2436700f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 19 May 2026 07:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202056; x=1779806856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZLSJynfj/SfMKra6MuoVzzg6ibW6tvdwMbY0XP2994w=;
        b=CEMlXGycXTJPnCOxo5pGgtk8vrUPsbmxei16ntWtnkV/lo+1RmmZD2OMniVc1TndSM
         UGVmExq7EBTO3nNyNy70jLTotEQ4Cixu9aDvQ6eZbbvv2bPqYno0qgwZqbXZvDX4SCy9
         VHusUAdYfKoT0+ll7htveOzYNMLYUX832psXZ+HV4ek5seiNtYRsEoYB4ZKxLIiJhvJs
         HCDSfHfONw08ZHyf9B+fnoKqpKyXPS+8Lm5YMtQ5Cie0NoPvYKr1wzJ2w0H/UKpQhlQo
         BcBGUSgyjwCR221i2keih1mWeHfUnoEX+sB0qG05Ev1PF7zjLhVUvftI2eEn/DSn0/qS
         S/sg==
X-Forwarded-Encrypted: i=1; AFNElJ8jmJ+lOBbJOnoEE9B/Bntt9gwX1JLHjrVOgavnRn53h3pM3BlE7mSETVo20N8x54pVu7KvegKyL5OzOg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOF/C23fN0V/IRJHUzGT+gdOOSRnJdfD0SNIEzDQh7vGCoVr6j
	//dEItHRxHWAnBslbS5qVpyhtktrblJ08A7dfkWJxiKmoFq1ufIg+VbafP19plWgQu7zJNEBtVd
	si3qfZ/y0+p4WgqOla3QclFES5daLDBjO+Kw2RwRJuDKZLnVKuo6zNazPVkPI1Aim
X-Gm-Gg: Acq92OFdbFZ/wOZRzcvIpdSY3m3gj3Gg8TrWIK0E4LWkLHJpjLwL5PVEdAHHiqcBDgv
	qAHAMvVvrnvzBTsXQNHv+21BtEoL+hcwq3XQK2Iry3pcFAFnXLp5zcWVneTMo4Vb9BNePtsTu8m
	o6B0mpm1od9l760t7UTauTJklaLt6VLN5mKmautLDKxaSXAn/Tlt3N8+vWTIIuxuL6vnJvfjoin
	jMLNjH7Ag01ZnlVywbhckfqU5hNOfY0BSXrIXio1+RfK4YS+gUM1mGyO59NBbuXYBQbTEV+dbxS
	ak9onhcoiHGIXWN9vkvD5s3oZIeT1+lJ/5OzI79T71rACRW/HWqBEuUVViX79ho8w75p/JznaYl
	ZDIpanf8fevbRUwUCYtR8pTFneGTSABP5D14z7os3qNZxMZk=
X-Received: by 2002:a5d:64c6:0:b0:446:708e:1e8d with SMTP id ffacd0b85a97d-45d955021f5mr37986702f8f.30.1779202056259;
        Tue, 19 May 2026 07:47:36 -0700 (PDT)
X-Received: by 2002:a5d:64c6:0:b0:446:708e:1e8d with SMTP id ffacd0b85a97d-45d955021f5mr37986653f8f.30.1779202055797;
        Tue, 19 May 2026 07:47:35 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed2f738sm45113118f8f.16.2026.05.19.07.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:47:34 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Samuel Holland <samuel@sholland.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 6/8] drm/sun4i: hdmi: Use the common TMDS char rate constant
Date: Tue, 19 May 2026 16:47:02 +0200
Message-ID: <20260519144712.1418302-7-javierm@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519144712.1418302-1-javierm@redhat.com>
References: <20260519144712.1418302-1-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gGz60LozeuWq-KiyM_L_m_QJytGCjk9wSdhXYxL74CU_1779202056
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Replace the 165000000 magic number with the shared constant defined
in the <drm/display/drm_hdmi_helper.h> header.

The old comment referenced "HDMI <= 1.2" but 165 MHz is actually
the maximum TMDS character rate defined by the HDMI 1.0 spec.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 07e2afcb4f95..723a6a11c94e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -189,8 +189,8 @@ sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		return MODE_BAD;
 
-	/* 165 MHz is the typical max pixelclock frequency for HDMI <= 1.2 */
-	if (clock > 165000000)
+	/* HDMI 1.0 max TMDS character rate */
+	if (clock > DRM_HDMI_TMDS_CHAR_RATE_MAX_1_0)
 		return MODE_CLOCK_HIGH;
 
 	rounded_rate = clk_round_rate(hdmi->tmds_clk, clock);
-- 
2.54.0

