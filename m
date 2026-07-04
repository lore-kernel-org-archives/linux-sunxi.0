Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B9935202B
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Jul 2026 17:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783185338; cv=none; b=VmXsGnEWkS+JeHJp9jSEd9L05pwl/Dgmk+k4XaZaJBntA20mQ2tGIDccJlJ8ZFIVW4OWDsg46bn8cObx/uR//gkS9KDVXK+0d5d5rJ0NWc3bjzrBD2L4sTWrSV8OIg0el+bD8Urcrpe7BepVYfNXnzZFRvAAKiljjq1eghbFXMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783185338; c=relaxed/simple;
	bh=NL0+DczK+bX7h5aeTAoVt3cN5b8jI07kISjmFCzG0dY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YMHMOeRQA4UlkhvvMWDqTgGC4ULIvJmaZ1Ake26o9kR385jKuOxaq2CMZjnJ89sHlGgrSCyCDH8aVE62QusB+a36ylSHUv/OvUexW2Gkkp+j8KUppom0mk/r0fDK5ysRxYOcq2EeODPA4jnFNycpElDDHZ8y8sq5zPCzyZ0lX4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d846CZ6/; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d846CZ6/"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so1558591b3a.1
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Jul 2026 10:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783185336; x=1783790136; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsQaU9uZZtvn5+lIZrSejmQfTd4zI1y5dE5Iy0qO9rc=;
        b=d846CZ6/6WwNuHov48EG+8Evp8+AHIJn4lcYl16a2+2X8wztCDV3U24lV6jtF+TOaF
         kRFl8WWn4wc9+DFqxOMnhUuYYpF2hueLW5S48eQEjMx9emB2qyJqoZkAggzgRMkwd3zF
         3xV9YORR89CuOICCjNu2AJNRzYPjAIXxzpFCXdMDxy9No5nCkajk3bVirPAmOHiRuYzj
         Gg/1GWVq7a7vRPnBTg/qF+OKI9FbPdbs9oj7s8f9ydarLaDEUMfE1Bm1J1iBJjskj2vO
         PwCKzWprmhnLh1k867DeJZuTuV0xEwfFYRrLOs9S9bMwh41QNVp8MkFwmK8XXZ49zg+G
         Yd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783185336; x=1783790136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JsQaU9uZZtvn5+lIZrSejmQfTd4zI1y5dE5Iy0qO9rc=;
        b=IaitMkFOeqj/rNbunK0yLUYzAWb1vssD+vObVjFLxsikitt/x+KIJ0kQpRj0qEhing
         aQ8IYsHOdzd8DWHyOPfl5497lcWoRunVW6iCgrl8l9S9OFBpvea/osypJ9PrSMiCb/ZU
         Fl+gOOkeFBUzVLEQcDF8Al/wsHWyIFw17dx+oyDwsJNWDIuEmNzAxR32OX/58hhnh7BN
         3pKh1+dT+ZR3Z5DOdnYNTE4WVYIZMNpwpYRmYDOKD1FGqJPqSBlodztSZcNccDUEGlRq
         rKZu27TAvO5sG47Q+uli+fDRSm8vDZ3hdYezWtpCQ+k7sTsX5PJEX0u0+P7/2IYOjzGi
         4h+g==
X-Forwarded-Encrypted: i=1; AFNElJ/oNhfpWvfheO7rZ9S3xUxX8s/+ozQRYKMqTxlOWoz59I9i7JmCtDDaODHXwGFEh/dcuZRQloe9AF3NuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyoAHqaUr8j4mTE/kSz21meL39cAudEoUSazpI5DlqAcoofuXV5
	9VysGUxCFJHq0r+GZBInAYngwDWLYj6rGI1qkb6Wt4pfTX1c61KxF6Eh
X-Gm-Gg: AfdE7cmI8HYZXmXyRel6r/rATmM5SsXNSjISxpt6+keHVsbuLPJfC1NUf/VqVvX50/o
	RMrmUnMB50ocXHpxouWfIyYAIVqnNuhIFbQa2fzx6oLjAsK2AYnYSlW9REqkq+zzEpXjOmV+6eP
	toy92/9nhaUavFgYn7uF2SEtA9lpSDD+jQGXFpxGPEFlDLFBW4bYlOH/K3umOChEb0VZfHsxqb0
	nx00/T5AGyJeTG9sPMBiPBhVsBcI4s6+p42Or2RBVmPasew1SaSRZaMBZxQeDNCVoFICymOSzpE
	JZCQArXVsLuWQ9CkWuNQiQk4LscBX9rcVPzHAD99HIrnlQGOdO3fICOYF+PB3a79rHQRdKQeK8N
	nw27cXLwj9izEIWjLeNWNImU6hzltA7QaCZxAudI3+VNf7C+kGrQtodm70AGXkae3UnULByHIS8
	Gu14sr
X-Received: by 2002:a05:6a00:3305:b0:847:902a:57c1 with SMTP id d2e1a72fcca58-847f6f84d6fmr4092931b3a.57.1783185336159;
        Sat, 04 Jul 2026 10:15:36 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498adsm1379101b3a.32.2026.07.04.10.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 10:15:35 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/5] thermal/drivers/sun8i: get calibration data from two nvmem cells
Date: Sun,  5 Jul 2026 01:14:09 +0800
Message-ID: <20260704171411.1413349-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260704171411.1413349-1-iuncuim@gmail.com>
References: <20260704171411.1413349-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 processor has calibration data in two nvmem cells. To be able to
add support, the ability to add data from two cells into one array must be
added.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 80 +++++++++++++++++++++------------
 1 file changed, 51 insertions(+), 29 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index df0c26970..3bdd62aa8 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -301,43 +301,65 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
 
 static int sun8i_ths_calibrate(struct ths_device *tmdev)
 {
-	struct nvmem_cell *calcell;
+	struct nvmem_cell *calcell = NULL;
 	struct device *dev = tmdev->dev;
-	u16 *caldata;
-	size_t callen;
+	struct device_node *np = dev_of_node(dev);
+	struct property *prop;
+	const char *cellname;
+	u8 *caldata = NULL;
+	size_t callen = 0;
 	int ret = 0;
 
-	calcell = nvmem_cell_get(dev, "calibration");
-	if (IS_ERR(calcell)) {
-		if (PTR_ERR(calcell) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		/*
-		 * Even if the external calibration data stored in sid is
-		 * not accessible, the THS hardware can still work, although
-		 * the data won't be so accurate.
-		 *
-		 * The default value of calibration register is 0x800 for
-		 * every sensor, and the calibration value is usually 0x7xx
-		 * or 0x8xx, so they won't be away from the default value
-		 * for a lot.
-		 *
-		 * So here we do not return error if the calibration data is
-		 * not available, except the probe needs deferring.
-		 */
-		goto out;
-	}
+	of_property_for_each_string(np, "nvmem-cell-names", prop, cellname) {
+		size_t len;
+		u8 *caldatapart;
+
+		calcell = of_nvmem_cell_get(np, cellname);
+		if (IS_ERR(calcell)) {
+			if (PTR_ERR(calcell) == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			/*
+			 * Even if the external calibration data stored in sid is
+			 * not accessible, the THS hardware can still work, although
+			 * the data won't be so accurate.
+			 *
+			 * The default value of calibration register is 0x800 for
+			 * every sensor, and the calibration value is usually 0x7xx
+			 * or 0x8xx, so they won't be away from the default value
+			 * for a lot.
+			 *
+			 * So here we do not return error if the calibration data is
+			 * not available, except the probe needs deferring.
+			 */
+			goto out;
+		}
+
+		caldatapart = nvmem_cell_read(calcell, &len);
+		nvmem_cell_put(calcell);
+		calcell = NULL;
+		if (IS_ERR(caldatapart)) {
+			ret = PTR_ERR(caldatapart);
+			goto out;
+		}
+
+		caldata = devm_krealloc(dev, caldata, callen + len, GFP_KERNEL);
+		if (!caldata) {
+			kfree(caldatapart);
+			ret = -ENOMEM;
+			goto out;
+		}
 
-	caldata = nvmem_cell_read(calcell, &callen);
-	if (IS_ERR(caldata)) {
-		ret = PTR_ERR(caldata);
-		goto out;
+		memcpy(caldata + callen, caldatapart, len);
+		callen += len;
+		kfree(caldatapart);
 	}
 
-	tmdev->chip->calibrate(tmdev, caldata, callen);
+	tmdev->chip->calibrate(tmdev, (u16 *)caldata, callen);
 
-	kfree(caldata);
+	devm_kfree(dev, caldata);
+	caldata = NULL;
 out:
-	if (!IS_ERR(calcell))
+	if (!IS_ERR_OR_NULL(calcell))
 		nvmem_cell_put(calcell);
 	return ret;
 }
-- 
2.55.0

