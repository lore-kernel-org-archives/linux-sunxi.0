Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0C61096F
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 00:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744331988; cv=none; b=siiEVfUZZ5s3pfjnINhLc7q6mSgGeGGFM4rrT3kmOR93sGF17D2j/S6/UtX4GUPC1oJdwi83MAV+74zoiyuKSivWgpd/A/YzniBSsKm86wmbJWcCInwlbfF3yJd+zNlM7CU1Y3ftlrSIo9rxczkxSykDAvmxSlOvxyw20rEvsTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744331988; c=relaxed/simple;
	bh=hUmYTmAvcs2uf7zk3vjXCVXow3V8zdSVau9bQr5WKPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjnA+S70WT4/AN5WOJtHEA5j+A4JzAn0tkGwdzzfdf719uMvOVGgtdOArMYiS36zmQz/7hoByVRlgVxB0vIogHIMSzhHLugam8o0ZEpXpduRRe1SyQfVh0Hmod5LmsDf3bo2gGpDk2MFhUdJFuNN84w3nbmA/PT2Y5ErWKQ6Ls8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fu8bxRIh; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fu8bxRIh"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so11731241fa.2
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 17:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744331985; x=1744936785; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T38zkrO9x36m4etdaLiyiX7JPZf+RzDpwj3Zgm9TBys=;
        b=fu8bxRIh6aoGAtjg9AfXJwAue/UtBZDz7LT3lCFxW40dPSDgdegwbmxa4jk9kXw0sK
         zGaQ1l7z55EAPuBpIin50ghoePJqPprnytGdGUvdfHfP8lW8uVbCgylFDmwtRxd5oC0h
         2W1nHvNIdbpVvDOsxfUAmWGEXGPcwHcC54StsiYpP6g6mXcTOmeTZAlgzCv2dA3ucsyY
         j8PtooO2nlJyHDvNq2IgRO2vQ+VSdVvLJDpOnIhtmg3xcxHceVdrlCRrKvfELR9ZhLjY
         jxSYjtiPAb6L+VxOruZb+0xHEbhL0aiIzsvL/qq4eaqmPhPjg1tt3KcKteT7dlwtjXFn
         BuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744331985; x=1744936785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T38zkrO9x36m4etdaLiyiX7JPZf+RzDpwj3Zgm9TBys=;
        b=ZFejM+kYaz06zrv57KF8fvBq1O15qcsKgi4sX8sri0xst/XHxqpL3yieCvIdbordVv
         9JYhN3r7uQplUWx4JVjoKASE9joqF1ZMQGE6OD6KuRKfz6E9pswGVY0AJ2JvRkrcjxqM
         vce5vicZywlNzDaLm9KY/yGM3JqVVSQ+9TOHjXN0z2S6s7sEOb0y4nLbEm6UEiBE30Jt
         xnuTt8++UxBzwJaNozYTUSu0kxbQXDdiVKu+j7zzeJNwT3gyW0yfzaFpT5oon20tQKPD
         JFVg53e+Gs1jB6iOE5mNjLEefPheOtwHx8osHh3hZZLdAOD0XSITbYQEX+5QEQ31+/TC
         CppA==
X-Forwarded-Encrypted: i=1; AJvYcCUAKB755BlBMGLmr4llgFKadP9ECyJ17+lM1F0RHfgo3cr4r5N9NDcytIm/YH24Q2H9P1JRKPxvyXofoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAS5mS7oP7M0mdVyN+g3UerBVwKQ5h0ullmP/VtAteCAQnDBwZ
	ZC3cFdd2t/znToVA+Aj4Sa/cp2YPG8F4f+b4WE+iEr1rfDG4hAzh
X-Gm-Gg: ASbGncvyLeZETxoEYQ9tA0ULTcfOnMGCS6hu52UI3lpyOQzqWUAE2oxH2jMYivyDj9W
	m0IlK/8nDkaNepOzbrg3D+jEV+1xl9HU+QCmXB4USQ0nBqIFUh+47MkLyGH/EITr13BPvKcivXX
	cfWvlbBv0pX1+R0hMInhDH8ne23Tls0Qrs7hdyPG9LBA++lHqpTBxW6HEiycbP7YIQ9Y6D1aGKh
	of3yeORyrJYMITfE/FsMbbH6NKyg0VNEqI8M+1mcD4mW3vwRNzY7OlqVWFNYoqVQdsbRG5F9Uq6
	wNiRlR9Ooyby9DA/2L69zjMGqDnBTWQ7XYwOy/4NdlvLauj4Aw==
X-Google-Smtp-Source: AGHT+IFbxnSm5FcYra/NhgQKMu+OkU4ccH3bURF6g7KgB4DcFLTWIFmK1C48nXnn+TaTiHuSf8qBLw==
X-Received: by 2002:a2e:ad86:0:b0:30c:1358:6400 with SMTP id 38308e7fff4ca-310499b4447mr1902191fa.5.1744331984565;
        Thu, 10 Apr 2025 17:39:44 -0700 (PDT)
Received: from localhost.localdomain ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464ea5c6sm6344251fa.62.2025.04.10.17.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:39:44 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH 2/6] thermal/drivers/sun8i: replace devm_reset_control_get to shared
Date: Fri, 11 Apr 2025 08:38:22 +0800
Message-ID: <20250411003827.782544-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411003827.782544-1-iuncuim@gmail.com>
References: <20250411003827.782544-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has two temperature controllers, but they share a common
reset line. We need to use devm_reset_control_get_shared() instead of
devm_reset_control_get()

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 1f3908a60..dc4055c9c 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -391,7 +391,7 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 		return PTR_ERR(tmdev->regmap);
 
 	if (tmdev->chip->has_bus_clk_reset) {
-		tmdev->reset = devm_reset_control_get(dev, NULL);
+		tmdev->reset = devm_reset_control_get_shared(dev, NULL);
 		if (IS_ERR(tmdev->reset))
 			return PTR_ERR(tmdev->reset);
 
-- 
2.49.0

