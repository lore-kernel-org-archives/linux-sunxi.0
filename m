Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830D13EFD10
	for <linux-sunxi@lists.linux.dev>; Wed, 20 May 2026 14:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288293; cv=none; b=qzP82MVfptwKQGwhF5HfItAuQFtGtBAxxTQxQoXDlL8E1aEDHMUByS3H5XJFdFLjfZoP45ZlU0ESPr2qcYkfJtADfu3aCi+piy26zwisOzvW/a5TE+f8WbFXNNNgxrwur0so833qmM0+3wOFl4j8n/S9eBegf9IwPCPhcg/6XR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288293; c=relaxed/simple;
	bh=QCHcVbwq0371QGOnwI+lDNZxJI2XqC1NlU75KLnG7Ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ZrMes3jqmOkNVv7HpZ5mBVxPHjKgFQ4Zc+hytY7TVZD7w+Zi3KG38a+lDAacX9FwuE+26faGd4p7TCKJ8aLTZsF4TcFByEt2TsLwjslubDolrYxz0k1VlGrhbTyd6B7lfxhhRuStUbr3qrOOsMslFww+FtMu3ji9Nvo5Rxgv6g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UnUaozV5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UnUaozV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779288291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U1tSo1G68Ra9imzMIPMx7cCxGvcqmHD7eyQZ4RzsS9c=;
	b=UnUaozV5PHzuB0GkXPJXRhFGRQPiUPdJtdE0WmGFkLShXC0Z6dKlgN5rBMwbKgGVM3R4Ju
	gCGhQVF59eXSuOoh+SYs46mYZJ+smyLPXXe4Fq35uNZOz5IkXjzW5Q20Kth6p2m8/Qsdn8
	Ben0qeLTZATOaEJWThJ55fnPs/NOZIA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-pEUq24qTP82QrVSUmZbr0A-1; Wed, 20 May 2026 10:44:44 -0400
X-MC-Unique: pEUq24qTP82QrVSUmZbr0A-1
X-Mimecast-MFC-AGG-ID: pEUq24qTP82QrVSUmZbr0A_1779288284
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-45aeac88af4so4170921f8f.3
        for <linux-sunxi@lists.linux.dev>; Wed, 20 May 2026 07:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288284; x=1779893084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U1tSo1G68Ra9imzMIPMx7cCxGvcqmHD7eyQZ4RzsS9c=;
        b=oqZkSighTb55R2jcbZhlW5J9EMpnjnA2db4/BQzM2K3TJGMIyGiJGWMkugaCgHXxIS
         mLFPdm6JItVgYzdRuHYrpWVv2p0OoREk8IZeLj1OOW6lILtRux3NcniNgzzFmJXDNhOI
         ygFn5c/1x2PnAOlO5YoVphvkSFZ75oZbFwl2GqWjCGgBUlhzHvTtR+w7QQyfYGJ46MfL
         RM8/u94qxetYIyr21ZQKGLaIqZo9cytjU+zwqXK111kZqZJi+pucu64GCpNu20O0L3W5
         ldFD9JD3V846xyOSEB3fzpDGaxnAw/06IUwTYwJcMq0pHB1meIegS7zgzK2x7DQ1g/KA
         YrOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vF5CmOlfP2vGDYKrXilxl8mwzwL30UsmutA8vox75kxZFrvRyEEIlsC22QKTL/EHfLwAPkBM0PvoEcw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6nSZTNhzX9iPDOk3RyQjJhtI2uez193CtYIyU87U5ajf92msd
	E28BTDYFApSO0ezI3vo6kB2GVlBzJfaJoPTrp9VVJH/JgElZhHEAgrA4KCZlkNcvmiu8WEEFgOY
	rmuSapp8VDhXIQQx3C1tyxr5NKh9WVwqelLi/sPBqzTTuZ3mqMKCXVy+FpyKwqLl/
X-Gm-Gg: Acq92OH3zZlys81LIcWTkov26+0Xbl8kExbW7sf6uZWMJ/a25wldfAl2/GSBcpQBEmf
	OpDrQZsifWbhw2pZ1l7jPq3wdlMqTNfswJ+ZyLGraevVz4assdwDUeWSPKl2dxP1/LQ/mO2ZdHr
	t5qlZZLfhriDc5BAPgdG3ADlEJoitP9AN0RgjaQapQiIdMYbm1jWL3TqnpSkisvxvQigk1pkEw2
	OJiUMw+4YpP3I/DcaEg2Vr6f0cRJaiptvNCZ/IWSPMwYqQcYE/tthzj0JAMOiTujbDXkS7mel8a
	RyQqdXH1JlL7ltTOjct4vTEp6zNqxybULeWR8H3JCIWRfJronSycM7F2H7b9uljBkzUVIW5c0dW
	uQwEfpqUDgJt5PnapzX2ogBbHUPne3UNY6/eWcia7XhOPxJw=
X-Received: by 2002:a05:6000:4301:b0:45e:93d5:7bf2 with SMTP id ffacd0b85a97d-45e93d57c00mr5545573f8f.15.1779288283656;
        Wed, 20 May 2026 07:44:43 -0700 (PDT)
X-Received: by 2002:a05:6000:4301:b0:45e:93d5:7bf2 with SMTP id ffacd0b85a97d-45e93d57c00mr5545510f8f.15.1779288283160;
        Wed, 20 May 2026 07:44:43 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm50145145f8f.11.2026.05.20.07.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:44:41 -0700 (PDT)
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
Subject: [PATCH v2 6/8] drm/sun4i: hdmi: Use the common TMDS char rate constant
Date: Wed, 20 May 2026 16:43:42 +0200
Message-ID: <20260520144424.1633354-7-javierm@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520144424.1633354-1-javierm@redhat.com>
References: <20260520144424.1633354-1-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TmVAtfUSZlhoZofdg7bTzFgb3YrM7duAVjRnvjPbVJI_1779288284
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Replace the 165000000 magic number with the shared constant defined
in the <linux/hdmi.h> header.

The old comment referenced "HDMI <= 1.2" but 165 MHz is actually
the maximum TMDS character rate defined by the HDMI 1.0 spec.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
---

(no changes since v1)

 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 07e2afcb4f95..74c7c3720ba8 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -189,8 +189,8 @@ sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		return MODE_BAD;
 
-	/* 165 MHz is the typical max pixelclock frequency for HDMI <= 1.2 */
-	if (clock > 165000000)
+	/* HDMI 1.0 max TMDS character rate */
+	if (clock > HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ)
 		return MODE_CLOCK_HIGH;
 
 	rounded_rate = clk_round_rate(hdmi->tmds_clk, clock);
-- 
2.54.0

