Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3436E1411DE
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Oct 2025 04:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761366748; cv=none; b=Oy/xK9N06mKaIe4spmNNlD+IizeI4988cFlQSh7gA+1Nli5h8ba67Mh6xKqCuoplpCzDIukcDcLCtSOuZeAJG6bzDSzLreeFlxBJaqXGRN7lrLNDKjIeJ9ZyLAgYbs62Bx7md/kEhkO9hRLkYqCQIw7gK85e1mPAiu+bc+Llgg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761366748; c=relaxed/simple;
	bh=OXisvb9gi/TE1J28fYKNKmNR9Heo/ymBioo9V+DNdQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSiyxSGiNFrZE/r0VfgAcUr3z4cRYLk+UbkWq5LGA6RQ/y/nMyrs7IsTbDqas4yKCTqZBzFMjntLjkSaoy1IvTb2G2Z0bCjOpBoHEWbF4oVD+Lm9AjxFudpHNn/Unp1zClv1O/V/GAk67wQawDbwzbchYCfjo4DWaHEEzAOD/O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q37piOZo; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q37piOZo"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-592f3d2d068so3286245e87.3
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Oct 2025 21:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761366745; x=1761971545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bw4z9PVBnrl74pcQ+V85ZiVa2r5TmKnZAhW/Uv6GfHQ=;
        b=Q37piOZoXp/o7xXATa0X6Yk32FZywtUwLeSr/M7QAtdjeLZ3CYsn49AMVkQgd7OqKp
         1MVNfMvQxP5tFAdmUeGrGVKgCLeDoBmNCIgHDzdAykufS7TthgR4/hKCZ5nNEaaM8bkY
         HEAlQDOf4S94FrqzwmF/mgK+otl7MAidm8KTxzylM0UeQI7IzTXcmvvkd7uOhiJESRXC
         sBO5LMBsgLjtAIp1hwxs9fsrNASO3zOiL7j/enCIAYVeq441QZcnlsHNfrdMUeZc/5K7
         if+0rD6TTvs0fghQUGPSy+BtmfFU6j+t7ECHr3P9iEmliX5XLd6YThpNNz3ZaqOU4t10
         qFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761366745; x=1761971545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bw4z9PVBnrl74pcQ+V85ZiVa2r5TmKnZAhW/Uv6GfHQ=;
        b=QuGHptAT+c2TCxPzlHgBe4hbgJNDZxtqmHQxXMS1xq38Fhd8z9PYdDWFazfp+k79V7
         y/HkITYbP2gnGO2s48alHU8XDCGDzjM7HeOqx5lmtagh426RpyoOJNY82+cc7UDRdeun
         DMYNUJV0bpwfGP4yHVhyWBmjwi8SH8T4hDYNnGx5hHUhKg8tUIJeTfUvNRH43KJJ47GN
         VWqYVmCafL+7rC+kARZ9C1Dc/LGkCp0IZPJHapj3O6uC/Eg968jofHhax8B3lzfYhTIP
         FwGC0gZkXXb+3M/LgI0VId1SvYdsOYfmjzmNY4ygdZRb2qq3NI51PjcsLu3jRNJkevYO
         +8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVVRn32AKz+3yQjMcOJlBbSz0781DCM6VU854O7C50xwm1dMdjoNYTINBKODc9iIrWdGHjezyTE1T0weA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNXOisTgXdwtVdP9bMjXNjCl3M1Bw583N2o7TWcI3137AFKFcF
	p0Ux9UGRgd3NNCSIcWul8pILXQZJsjDJ1CczfmoHRH7DljilKmpnDQ4c
X-Gm-Gg: ASbGncvX4BKf9a22VsZ2kxOuVbG5Z/G6Q1VabfvME+wGiX+IxnyGes6qBY290X3jiDG
	6kxmkRV1gjqBzFj4XWQdj+xZ6BU4nD42SoGOQK7DJgsSvMvZTodn21HI0OQ+DeKjYSIGX0o0vsh
	CTwV1qM9iJDQkOwOp0IeGIJYyxHvg1ExSjNfV1MWzb84WX47NO+wBqM8nEU98CdaOC73sSl/gU/
	Gb6jBfg1R/8B9ixdswIx4xq7cjQPJr5GrHWYNFeFi9hke+kaMzQCB+4SOVLGLD5vMba9qjXHHgP
	RM5xhTkr2vgRdWaSqR8gzFhxGrOn++jPeNJfCJG0m0otPCGn1S3dDwsQpmgE6iWrHDJyYub3zlK
	dC9kqHby4P4C5iMd3qBe3t1AHjt4byGGqSBhvtKqaIPBbpTFMSmn1bV45dQ5O+hw1ShLyoOZr5j
	DX
X-Google-Smtp-Source: AGHT+IFIlO0Xnz3NfsASBS+sA6Ogolz52/zgOOHUf1BRiQNX9JIhdrYW1iCIFtP2vXKndrvpB2lUXQ==
X-Received: by 2002:a05:651c:221f:b0:375:db6e:fac9 with SMTP id 38308e7fff4ca-37797a0dab3mr93162251fa.31.1761366745177;
        Fri, 24 Oct 2025 21:32:25 -0700 (PDT)
Received: from junAIR ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0ca7a0sm3409241fa.33.2025.10.24.21.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 21:32:24 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] thermal/drivers/sun8i: add gpadc clock
Date: Sat, 25 Oct 2025 12:31:25 +0800
Message-ID: <20251025043129.160454-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025043129.160454-1-iuncuim@gmail.com>
References: <20251025043129.160454-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Some processors (e.g. Allwinner A523) require GPADC clocking activation for
temperature sensors to work. So let's add support for enabling it.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 226747906..c02c398b0 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -66,6 +66,7 @@ struct tsensor {
 };
 
 struct ths_thermal_chip {
+	bool		has_gpadc_clk;
 	bool            has_mod_clk;
 	bool            has_bus_clk_reset;
 	bool		needs_sram;
@@ -89,6 +90,7 @@ struct ths_device {
 	struct regmap_field			*sram_regmap_field;
 	struct reset_control			*reset;
 	struct clk				*bus_clk;
+	struct clk				*gpadc_clk;
 	struct clk                              *mod_clk;
 	struct tsensor				sensor[MAX_SENSOR_NUM];
 };
@@ -417,6 +419,12 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 	if (ret)
 		return ret;
 
+	if (tmdev->chip->has_gpadc_clk) {
+		tmdev->gpadc_clk = devm_clk_get_enabled(&pdev->dev, "gpadc");
+		if (IS_ERR(tmdev->gpadc_clk))
+			return PTR_ERR(tmdev->gpadc_clk);
+	}
+
 	if (tmdev->chip->needs_sram) {
 		struct regmap *regmap;
 
-- 
2.51.0

