Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53AC1DFDAA
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266816; cv=none; b=YonfMbrRAzRNj8Z8dX8caqbAzOh2e2qX9N6t/NabzsZsAP8zXjm2FTW74HsAD51vN+2KIt9+B0V15UEr6dGvdLNvnVgGak/g7z91Li7CeUQZ47oEEfQUR/47ZDX1PveWLFv4Ps8Ense0+IePYf3+KVJUQTb/dkLZKgLwjSBiWjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266816; c=relaxed/simple;
	bh=UjNMLqX51SwfyB+kbUbjnJt95fAbmRoKvLYOPQ8ek9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P5KO0zkKJcXbfgbsPY4RpNMUai1VBxW1AXSgAoTk4VHg4wuO7YSRRCy7JcKuP9SILeAV25uZRT0FLo13mJGDtfxSbP2c3izSGmAZ9/tiMdQ9Ra+6iSpG7b1sgPzHnJndgIG2ci+RIn8kz0Kd1WvyIYAHbXKOMWkOEg7d32Sg7GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kj5j+LpN; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kj5j+LpN"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ffab850d74so408871fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 01:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266812; x=1732871612; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
        b=Kj5j+LpNGYz6ZiCh4LQNrtk23PLuinlKvh5RzVJGBTPAbu1MHl0p9fFJF0pvCmtVJk
         hP5LQUfYTU/6QlRfG0vWAihTV0E2rq0yXD7aMWq0Hr3tOL0nku1YKnghLxIqDksIh9Ad
         F4snQjUpgddwfzGr9LMS7C6sKw+EMRvLgUgLD0+vtU+bA6JZ0f6hJlg/23JrgfdyOZxR
         e5nLljdIvrhhU9PWL7XhcaHFpBOuIlDZ5ikRujiqS5ly3vX5EiFTnEhnIb5ee4Y0aoXv
         NzJ1i4BCvU9CM3xTtqQ5iM9DKPQJgMrn6Zlg9eGKY0svg7R5hKgBobr6XlawS3B19383
         vacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266812; x=1732871612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
        b=o3ahDMriKSKk8s+k+6qOWlkW/IGBEtAvwe9xWmzVrIKU7QXjiDA/6PPRhFPb/Uzcjo
         izPDW6MXQ8X4295huCBREkbTLvubwgC2LQB5i4z2Ao4r2HhBpsNXUTwY0OlcXSlCVMxk
         lvrdmbu76yK+63URUrjuQWa0tVXUdGx3uecSB6l7XjzeHq/Vq9b542PE46Lx7kzd/MaK
         gWkWAF29yu8KNWAHwNc7u7RYYg7JcsKSmLUISEkHoI0jWvp7HDsw8NzTg8HAewXbXMg0
         F4M2U6cdeqi0xvsWy/XhByISYb32DdtJqEXY1bK3xShO1gZhVUf9hE4cjC3bd2zfGNzg
         Hqmg==
X-Forwarded-Encrypted: i=1; AJvYcCXsGuVy50jp+KVj0+alz4BLcuUMoanApsU0CP8fjZOFJ2j3Ik2Ji0kDjqcYdxx5kOFGVFJiku76FvlSUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyjdui+T+c3KGq2Mu5LA/eKykXAaEjNu5X78KzIveznkxIJTqG4
	mkV/no8ZAEpsqE99Sunpy7s7opXuxegASqzOJgcGEs5d2WEkvvUagf9qY61itj4BSAu0B4vVG8L
	j
X-Gm-Gg: ASbGncu7QFWMRKP1RowQ8cPppS63Gbj99Rwy4zdQvtGVlXETuuPEi0yX2912mPYj7QA
	Y87ExxGPlwMETmsdNKU7HpgIzr8v9kp4ftcB++d+53NMOsMTjhUgXP6WIPBjvC8mRAyGkYVCCuW
	U+yTG8tzQON18tmQz92L/Am+b1Km6/tkU+yKleO/cA75usuMZnMrPKkdcPL5Bbj3kOIo8Q0VPli
	+suxY4kZ9Wg+C+VhiZo8KANV+etLVj/Qg1I0+j2nMNcolqMmmiaeG8MIA==
X-Google-Smtp-Source: AGHT+IGDeNFqG4MBKTEb+7vEM0EHIe+kSHIzZU4cqUcGBYdZXfjh6XYO9X/0YkMh3CxsrBHQKu0dXQ==
X-Received: by 2002:a05:6512:ea2:b0:53d:c9ae:a978 with SMTP id 2adb3069b0e04-53dd29c2410mr650169e87.4.1732266811943;
        Fri, 22 Nov 2024 01:13:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:13:05 +0200
Subject: [PATCH v4 09/10] drm/bridge: dw-hdmi-qp: replace mode_valid with
 tmds_char_rate
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-9-2fee4a83ab79@linaro.org>
References: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
In-Reply-To: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UjNMLqX51SwfyB+kbUbjnJt95fAbmRoKvLYOPQ8ek9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEsinpLwtf2P+iapQrUkEDkXySbQ1SEGNPG+E
 yMN1AXKzKeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIgAKCRCLPIo+Aiko
 1UAWB/wNkyuzaaWNjb3TQ3pzTEcHC7B/Rpy9L6BOjIvOeuTqTWll9d3zLo9QEE1PDxJLav2S509
 /GcNdsoEza+Au8Yx2/cJRv0J8J0BcqhPP6v01atHSxQ/lQESAhnjtbezigKj5F6augKx4qn+hBU
 05oVtI6caS1lItX/bI51kj0LEdFXBhJhBE6wQ8+jdC/YQiN6kTW7lFsat02wgdaeNGebhcNB3x5
 S4eJMeHGa15XNxAzBSWFbFzktMTFpbMpPra4zPxZpisIFGPMIpdwOSUiRLCP8Z24s4vpMhROld2
 EsX+4FEudWGB4pshKsMVn0Zbj+v8pVuawOqXGg9LMIj+ZYLn
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Replace .mode_valid() callback with .hdmi_tmds_char_rate_valid(). It is
more generic and is used in other mode validation paths. The rate
validation for .mode_valid() will be performed by the
drm_bridge_connector code.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 181c5164b23192f0b557624d73c6223032b90ec6..c686671e4850a1af75b82995185ffc3cbb22a447 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -442,16 +442,14 @@ dw_hdmi_qp_bridge_edid_read(struct drm_bridge *bridge,
 }
 
 static enum drm_mode_status
-dw_hdmi_qp_bridge_mode_valid(struct drm_bridge *bridge,
-			     const struct drm_display_info *info,
-			     const struct drm_display_mode *mode)
+dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
+				       const struct drm_display_mode *mode,
+				       unsigned long long rate)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
-	unsigned long long rate;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
 	if (rate > HDMI14_MAX_TMDSCLK) {
-		dev_dbg(hdmi->dev, "Unsupported mode clock: %d\n", mode->clock);
+		dev_dbg(hdmi->dev, "Unsupported TMDS char rate: %lld\n", rate);
 		return MODE_CLOCK_HIGH;
 	}
 
@@ -510,7 +508,7 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_disable = dw_hdmi_qp_bridge_atomic_disable,
 	.detect = dw_hdmi_qp_bridge_detect,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
-	.mode_valid = dw_hdmi_qp_bridge_mode_valid,
+	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = dw_hdmi_qp_bridge_clear_infoframe,
 	.hdmi_write_infoframe = dw_hdmi_qp_bridge_write_infoframe,
 };

-- 
2.39.5

