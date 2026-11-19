Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110887;
	b=41FMINXXHI8c0ATpP2W4vQKLHfdcJrB8P+p/C2UPq/5FURRaeMQxsvhyr3S94Lfv0HMw
	 AkQ6PQhnTgWw8CWC7OtAlCTfXvGZrp1kS1H1X51usjx2DEtZtvLRqhqCjiEu+Rd/YXJte
	 1wS35OPa3+FUhFkbj7yIGDAO0+Z9F5nXfz/87hFAiBpN2sN87wwYsZDCYu+l+sAAiZNy8
	 baElJ1W1fAon/KrjHjhtyOkq2oPTuUcHji/uz3EpTz0dbeiTw69oZM7gonEavnpJtfRI+
	 1ZyejdOeD3e0cQP28pWzQM4vN8a/QtH4Oxiys5o8vo2HpGr6J25X0q3sM7UG+ORBQRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JZeXMm6AAi44BWshE63wgfUA4zyj+3ZnN7hXQLNUFPk=;
	b=3MYb6ZAtkAvGE+rFTYWEo6pArRqBvj/uPms81Z1dTnVUqapD92pX7uN6zxOCShscH7C2
	 t93VC52puc8CvmGFbJekSqGkD3kxzCk1RGVsedeETpoLboMZiEWcPe5oQZyYRGqnVoupK
	 p6sP56FaQKjotsiF+ZQMNvzGvZkgDpJE6AbJ4oRnTT60oI5ymtfClxDx5mFpykTfYzRoZ
	 +HMr1vBdiHo/crNlEmVSh1q/7U5yNBIfZTp9OV8EoMO/rOxPrhwyfcK9ER5eogghLZhLC
	 ZBdfjlN7cI8d71+P3rcoSpBGrs8q6bVYALADFsjniS22zmebND4d+wY7j4OzSns2aXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJg8Ef8E;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF746606A33B
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 17:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF746606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJg8Ef8E
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso18474345e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 09:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110884; x=1795715684; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JZeXMm6AAi44BWshE63wgfUA4zyj+3ZnN7hXQLNUFPk=;
        b=mJg8Ef8E6ib7pcfkS6hm6DgGqoPrjqJsKmmNbV/o/UIEdSymSxqQxeSA1+qLTv62YA
         emvgEC6+yIapTYPZP8JUQIj6tu30t8JnxFCaOQrB+InZBnJe1xaPrJwEaM0qEPD7aFIK
         LuYvwiMn+IezrrAZ+IJvGeVlXhAbzlLLx2jluUQ0GMBZ16rpS4E9KBwsPFf7cEpeMvVH
         YwdqbMy7Fgk5m1iqeLVXcYaRwOniAG39W8G8MdEfYWrYmmUMw0GEJUamFMj5i4oSE40A
         BMyRiakoZNyOWkjr4Lzax7ljwcxBgNGZQ6sS8LL33EtTsZHGSswoe3o1s+ux8DIUkQyU
         3GQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110884; x=1795715684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JZeXMm6AAi44BWshE63wgfUA4zyj+3ZnN7hXQLNUFPk=;
        b=Gdyh1QDkzvb17GGmKw05I1M/4lzJ67o1RomwcHjdCqFqzVN9l/nbh2txVjnLNPyO0E
         GLVM6ezdNdfChzZwNFcdu137O1/HkXDjP/PnO5S4ZstAZbDVw5RTC1lq6d8urzwgSTYu
         XBabAQxYFbkYcEMMsWa735KcTzWPn6SH7ICuhQW6dAivhAXVna3ZvFCKUwg4SaiknJVO
         KSXpHJfjABcLJtvz3qan3ucL5azL3kGDxUYs5vs0IQcPzTqDj1B7lIBXV8dbU/5XnlWG
         FCLUpSCkpq5oM9Zhc1pAbaFNiGsl/e9vTmV2GQRyOjSmZ/58B/R5gyudvv2fPxrui4Pp
         j/eg==
X-Forwarded-Encrypted: i=1; AL+hErFxJE1tpC+mQwugLhILBoILToF3ThqqrJ9nUbVwTZeylTKuXLeTNkNhxKxegRohcxM6EqEx6rjuplLPpw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8qd9mBkTB7Vkf5ekJqMPHtZ26wmbq/b+GWrQCrZ6JMBSScsrPJ
	/kQr/4Ck93nOOBxM7X7AP2ssAThJ6mqqRl1Yjv0tv/nanhdCiWzUgRxZ
X-Gm-Gg: AYBFou1azT3YILpHA8ljt/28fYyMihWhFnS4gTkJ5YLa5VdXj77wtqYCutaMf8gNazn
	q0qCY+JNpMCpyT0Lzo63jMoVw80g2IslpfouW7+pWkr/YDwBH8bZUta1HvxqgsuzoDjjrs8Ree4
	7H6DHxgF1apQG0QuEljzWnzUZDy56nfnyhV2UJ5UwPFlKlkpjLydsHSjv7o/0DO+F++P7y4lVh4
	uezCrwln8FiRmLgAdPOOjataASzweRN9DOppWlxY4zc8c05hdA6gCyiyHRvdT86h23lJ+aatJeN
	QESFz7P4vh8VGY3Orf0AwcCbVb4I79s+c9I6HN49wEKHs9L4m4hlBqp+kjJtgvUBubqKUU/PtuM
	OFXUp67Hw114ysis1f1mMuco7eS+Lctpd7SQvre2POyPlQ0mdkZB8IcTNY2M2h63nvBixO9u29B
	q/7LmecJYGHneuNitIKW5a1PRueAw6M1R9YCjIHt2VOY36GNiJ7bC/tnY1g+ebxfeEpak11+CZD
	Pi3U6ee45SPxJLWcrkyETRBrQ7ejHxVHpklnrMjXnFK6TeRiKDfhIbGndaNywkj0n4VGoe16I3E
	UTlq2zVRWFVMyy5syGc1MmBfUzauvZpdXhQwR6kOWazrgJWbRIkZJ44EB4IDMx+fIXx6elpifyN
	dmpQGFeesEMdNGPrwJehsfO45bK8hnjBpFnBxpoYVvThIp6KMjMB64U5dzzi5Sq1bahv3GObHnG
	ZX4ajDWYDFrWyqXZdZiBQA2+fgJOE2MQ95oE+SK1espwcqPBrCnlwEakCwapiYxLkomyx71TYIH
	U/KnTAEUEecGD208givksK3+FnBr14s4CePk4ULBxzNW25lMOvahaPA
X-Received: by 2002:a05:600c:a08e:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb887c3afamr8512525e9.3.1795110884056;
        Thu, 19 Nov 2026 09:54:44 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:42 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] drm/sun4i: Reject fractional source coordinates without scaler
Date: Thu, 19 Nov 2026 18:54:33 +0100
Message-ID: <20261119175437.2520400-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
References: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The layer code programs the scaler whenever the source rectangle has a
fractional offset, since only the scaler can apply a sub-pixel phase.
drm_atomic_helper_check_plane_state() with DRM_PLANE_NO_SCALING doesn't
catch that: it only compares the scaling factor, which may still be
exactly 1.0 with fractional source coordinates.

Channels without a scaler would thus have the non-existent scaler
programmed instead of an error being returned. Reject fractional source
coordinates on such channels.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 24 ++++++++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 24 ++++++++++++++++++++----
 2 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index cf66f676824e..f9c7f28f9fa2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -179,10 +179,26 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 		max_scale = SUN8I_UI_SCALER_SCALE_MAX;
 	}
 
-	return drm_atomic_helper_check_plane_state(new_plane_state,
-						   crtc_state,
-						   min_scale, max_scale,
-						   true, true);
+	ret = drm_atomic_helper_check_plane_state(new_plane_state,
+						  crtc_state,
+						  min_scale, max_scale,
+						  true, true);
+	if (ret)
+		return ret;
+
+	/*
+	 * Fractional source coordinates can only be handled by the scaler,
+	 * so reject them on channels without one.
+	 */
+	if (new_plane_state->visible &&
+	    !(layer->cfg->scaler_mask & BIT(layer->channel)) &&
+	    ((new_plane_state->src.x1 | new_plane_state->src.y1 |
+	      new_plane_state->src.x2 | new_plane_state->src.y2) & 0xffff)) {
+		DRM_DEBUG_DRIVER("Fractional source coordinates need scaler\n");
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 09d94f7f9977..4d3fc03f9877 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -259,10 +259,26 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 		max_scale = SUN8I_VI_SCALER_SCALE_MAX;
 	}
 
-	return drm_atomic_helper_check_plane_state(new_plane_state,
-						   crtc_state,
-						   min_scale, max_scale,
-						   true, true);
+	ret = drm_atomic_helper_check_plane_state(new_plane_state,
+						  crtc_state,
+						  min_scale, max_scale,
+						  true, true);
+	if (ret)
+		return ret;
+
+	/*
+	 * Fractional source coordinates can only be handled by the scaler,
+	 * so reject them on channels without one.
+	 */
+	if (new_plane_state->visible &&
+	    !(layer->cfg->scaler_mask & BIT(layer->channel)) &&
+	    ((new_plane_state->src.x1 | new_plane_state->src.y1 |
+	      new_plane_state->src.x2 | new_plane_state->src.y2) & 0xffff)) {
+		DRM_DEBUG_DRIVER("Fractional source coordinates need scaler\n");
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
-- 
2.43.0

