Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B836B1422D0
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 09:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000233; cv=none; b=N3dDFYIy0IggP5wGe/h8hlMLKo2/Av/4dJNdERgzn6/SDfKS99+dubLeqQ0j97qGnIkNCdj/DvNugWjFuAwk+rfjEVsvgSMpwuRe8Uo+WJqq/HNZ/tqkPf6d7+ZZJMjKRqhAZuIHDXofbB9HvCjBsJivwCECgqfrthxdgesIZXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000233; c=relaxed/simple;
	bh=w1rOHhvKlNZR5V6gMM58fQeON2s1grhUcmwjN3eUzC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HjaCv9DTXESWq6Ys2VEz+0c5el+qcejUganlYImeejJClAtHTZAmjBhXVhKbskPvBYft/29DrBSZd7MKHkY/8+A/ZwcXE+lCvdIwAOhB7RpmMrkB2gGYorFJeCNnIauM8BesKyEbT0czQAEes8hzUIuWlFdUH/HnLU8sFb/P/Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCnbAGsm; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCnbAGsm"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-58b0beaf703so2797201a12.2
        for <linux-sunxi@lists.linux.dev>; Wed, 03 Jul 2024 02:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000229; x=1720605029; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYmIYCmqwVvji/gLlU74cbPYmKHONbdVpgfdzYyiV74=;
        b=KCnbAGsm1jiPSE3tb3IyxDtd0oseqyygF+DOEPUFdT+EhaUPaPniqWN7iOJ2aLM+f1
         wuqDVe6373jFM7xwg/A9t7r85dyM2UCDNX8FaL/izvhDml2oGzCy3DnUaZZAmOdOBy/r
         L+Nv1/WwTzZG3qmk2iICHKAo32vJ9P99zYFgRC+HCPpaua+NAdT6HEs6XKdzFpfglsji
         DxQ1iw1Hz2Pn0CGd3FsdVicMP9feiui+G+oMIPLtrJzFBoF4JvCIXSqsxdvhdNhQDob/
         pogWv11c8TEcSeu7a+pHE5CrXkiEFsEeYsMDv81kuRc6I2EopBiAcRGdQfXuRoqnPHkS
         /e9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000229; x=1720605029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYmIYCmqwVvji/gLlU74cbPYmKHONbdVpgfdzYyiV74=;
        b=aNxRbfbt3Rw4peiVOvfO22f4Nt3mw7GfiFAw16sCJy5JdwobrBGV5dSAQTaDUeumMF
         MNTLLFB+V4ly7BcuqCFXMnAu4EmEgVcV9hnErQme2EJfeobnicuGlcg3rXwEcAbno/S8
         TG8fW56lrCj1udKuEGrO+o03Ef8a37xw7sIrYvBohvtUEHHoKM0XvcIOE1YDQt6Nj0+6
         aj9LA4Rq7NREvMYk8pBU9+5H37g3ZXiI4Q+OZdN1CbXbQk3hBYVsmI6U6TyyoFbGebBf
         jBxQ2wDoYlhub3yzvYLYpqGp6MS+/OASOgLZtZn5SC5ixwGWD0e3rZQE2mXOlx0FtxpB
         6kJg==
X-Forwarded-Encrypted: i=1; AJvYcCVJZjj3vkNgH436JSkjTLrVI3tbam+p5Q7XRAPgyHsrVOviTeRgc9w0tSBGvnuj8e1AeCVCbq8BwxwJtT2Iu5eFWY/Qfoo99haun6s=
X-Gm-Message-State: AOJu0Yxs8B+lhiSANPMEpx0GgLypVFl2EntRd9yQsz19Obzcb8ACgHN8
	E54FTLmFm3ZnY59jGjpEgT9RZ3/u9riwxyJ4rN0+ZBQzQut8JKcL
X-Google-Smtp-Source: AGHT+IEjqZP4O3mOUQ6GggXaD2dddoBtsXMh2gmEY3SRCb34lAPZsm7CE9jeeuYqrl4eCohJ0y9MQA==
X-Received: by 2002:a05:6402:4304:b0:57c:d237:4fd with SMTP id 4fb4d7f45d1cf-5879f0c6ab5mr8167310a12.4.1720000229439;
        Wed, 03 Jul 2024 02:50:29 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:28 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:15 +0200
Subject: [PATCH 02/10] clk: meson: a1: pll: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-2-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=729;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=w1rOHhvKlNZR5V6gMM58fQeON2s1grhUcmwjN3eUzC4=;
 b=VJKr1FcizeZqWLivzNG3Thfjr+2RDK5PLLnFSUkzF90v7ziEIDUwgUNgPc80/Xsr3c6NTdsUv
 eaNxtmI5CINB3at14UF4KycZXJyoTf9I7pB/2nrA1YleMXLtogVfBdT
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`a1_pll_regmap_cfg` is not modified and can be declared as const to
 move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/a1-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
index a16e537d139a..4d0a6305b07f 100644
--- a/drivers/clk/meson/a1-pll.c
+++ b/drivers/clk/meson/a1-pll.c
@@ -295,7 +295,7 @@ static struct clk_regmap *const a1_pll_regmaps[] = {
 	&hifi_pll,
 };
 
-static struct regmap_config a1_pll_regmap_cfg = {
+static const struct regmap_config a1_pll_regmap_cfg = {
 	.reg_bits   = 32,
 	.val_bits   = 32,
 	.reg_stride = 4,

-- 
2.40.1

