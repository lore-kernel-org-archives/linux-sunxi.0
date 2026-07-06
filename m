Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096F6426D16
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330368; cv=none; b=YZRCgdW8N/qb3l8s8W93x8aSYP4Kqjvipp1K9Y/2uYtr63S9HoQsl3+K8lUebQWeqjIOAssvO+1tI1+6CbZQziuKlm86ASyvChABjYMO07fhr9oEwqWj46YSBaXlWhw+P37kKtP+gSQPaFyPEUtqL+ETeqhet/I5MTG8WUxCVUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330368; c=relaxed/simple;
	bh=kzpkNVHYIKUHVyZbGK6pa3WRAS/uHKJWiKBBr/HRbXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RBgSyBut7U1CIdWbOYJPednCTFLRoVloPHbCINpkDpV98f0yiawhZn2Nu1NFdHLm5W8Nz2AgbfiZjUmEUf2Tc8Qpll6u8rw6t1OqnebNk/L10Fx/7Zmx7AvDYlXcGqjnTbDck33yLwlPSmcZiTLloFaSzK+ugINlRSRmAll9oGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=e9JdLwwd; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="e9JdLwwd"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c00f74baso16899815e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 02:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330361; x=1783935161; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4sV8eYg/ZL+s2Al+u7P5bf0VrRg6z5DzP1Ps8nBcME=;
        b=e9JdLwwdQsqQZdzj3a0fdQB15Tu6j+fGw5efkz+hm/8ziieoZ/q9OvFqT5/P/n/o18
         OQeImj+d+dz6Amw3y58qwCLqCayWdfVtjNIU2ERqRdntZBErx5z+l3Vq8+d/7YzVUU84
         MT6WPe22aQUA921RjIH+GF/IV7VSn65KL/u43WhM+OdWxc6BNO9EYM3umvxz0tdghi7y
         59o0JIo4OvFG9A5eLXWupTE924JW/VZ8wPE4eL3Ga0OHj2kgoCBMSfBwi2SUkNXMk2sD
         CHbHdLdSE072+a6LvAhmEgv8zUqE5TkGDEefTijwx+SiCYMK6Fj9+4lSe2vT0I+BwZwr
         M+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330361; x=1783935161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l4sV8eYg/ZL+s2Al+u7P5bf0VrRg6z5DzP1Ps8nBcME=;
        b=r4nVVCxn9abcbw76kCYx1vYgvXvzXqKfQQmNu2cI8mkYX2+u7a9qkjfeUwsmh9ps9P
         7x1kqiW++ycdKI8bIqI+SuuQeXo96diT/tDYeMMoqwmwH5NSTjN/WIGxaZrTqM/2zVRI
         1qnAQ+EqnPEiXuUa9MstJ3GpAFvPNbEi76mn8d4JBHeZSiZtEeCRfqi+1Ip3dXXQW4nO
         Z9VKcofnrC27MOEPVahd9pWLbSMtAONQQuHkG4FiSYAYJqv+MJi7J+y6sMtvgIvknhrf
         EM9iwSvPq+ymvmDJBoQmVII6i3MiA9ZMACYhlt6E5pgLE5dL6IZcVZn+aVa/J3qZuiDR
         4fSA==
X-Forwarded-Encrypted: i=1; AHgh+Rqvg5OQ5gyuXgpYsQI508sIn2S2P2+LJPcS9++EqEDOAOnu8xKdG46bcEXbjD28zjFpd+Q2XnH0zbo+7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YznbWHUuPVEORdWFOJAjYikNiOHg2tICw3nm38uCs4FRho47tZC
	uouJt7CTzCYzyzCMp9JdbIkY8Psqy1ew6678qr0QWLzmhu6iLZk3JpS7scD0zMyyFjVTlOTTWPQ
	lR49d
X-Gm-Gg: AfdE7clwfV1PYQGA3VFzefutkgya+vgGSPUNN3NpuwU+puB2THeSujYM6R6it3IOeLj
	iqaaK0ZPQhugkaEP9rCPmMDiXIsDcdF/KYVBVsWf/M8YA6BCdqOQzgX2X+N0sf6AK1XB7xB6pyx
	aa8GCuElArYb9b7tfI9Ib+LEgIy7TUdIoBSKwFGgkjmrSvPt4chrQx1CqkGhcrMs2r08Pt10ycv
	u6hoee/eHDMN7ZktSBWxCQk/JnGO0rgBVRT5bKP60DitZIaN2lppXX4eU6cKor1LdOYHViZbgSd
	69//vJuZ8znJ8UzvLEvDw6fa2i7IL7Jk7CApQIYY4e3IRBecLgX2bf/ql0NTyFkk7Nm19Or32V9
	o2sO7RBeZdHdTxeuDNDvDvPdccndo+CPCJInSoWmHJaNMUHYUjmpM61xfVvOy8J5SyWXJIR0oHJ
	WbrbpAjD4mGTc=
X-Received: by 2002:a05:600c:154b:b0:493:b6c2:cd96 with SMTP id 5b1f17b1804b1-493d11d9d42mr108969265e9.12.1783330361468;
        Mon, 06 Jul 2026 02:32:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493bef1807asm313598145e9.1.2026.07.06.02.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:15 +0200
Subject: [PATCH v4 7/9] clk: sunxi-ng: mux: remove unneeded export
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-7-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=854; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=kzpkNVHYIKUHVyZbGK6pa3WRAS/uHKJWiKBBr/HRbXI=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YmfyJmVNfRc9dDNX3FlRKXkCm2eEX+2FSO9
 mfy8XRdF/mJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2JgAKCRDm/A8cN/La
 hdH3EACDjsiUBV1SbTRjs1G5s78KTZ7oS6GSWyf2BTTtMn2V+5Nd2ocIN7/1OTU7qHO4E9aL3rN
 IMb4bcM6XqK+z8uxaQbFr0DrRbOlRiKi/XmUhyDUiIWESP6KvjBz4nHc3tmADEMTfUurLk4i8ZC
 jJI5yXP5XGOJnxN5gv6H/ys6bWkTwHvLwjtiQ2pt7JhjX9iygJIpSePXEJnUIU+Pqb+NX3VRZ+P
 DIbcyijahmDuqlXmLX9kEGF1ERLFAgkKu/NZxY2mlpYaii62SDIeSyTU08c6lU6dNgBjkQrxDSd
 lIaWjbHZ/aodMn8hJ3rR4fQQsQxH4qHroEo3j04r1zV1EblJSAzxUEZoszz6lVI1Fr7uwVWgauq
 mOvMReWiwP9yClUSeooOR7ImTXwXBAQomS3AymvWdRLuVg8E54+rxShJLJO4bU2mcX8JQbb3sZG
 fNMmPCK3wUYK5T//1e/Zz+UBYDuzWKPCkp+IHcyKZ6S01hoSp0BKHyPEpZUenx7vvXGe1NiKvEH
 Gm5iLLR+PbCJYa5t/+jroacHVeaXyBlh0jZEeg/6BhNaxisiSOcBgH/JV9VR3ZX1jeQxjmDb6JV
 0OOwgs/kUxvIwbg7N2dx8FjWocPUJJKqJGP8lCym5w6a9r/kNPszSOSMaUvhWJQaw0NrtpJhxQc
 kUIvmMxZfVwXFxA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The export ccu_mux_helper_apply_prediv() symbol is actually not
necessary. No module other than sunxi-ccu would use it at the moment
so just remove the export.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_mux.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 775d396ccf31..1a441745e796 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -66,7 +66,6 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 {
 	return parent_rate / ccu_mux_get_prediv(common, cm, parent_index);
 }
-EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
 
 unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
 					    struct ccu_mux_internal *cm,

-- 
2.47.3

