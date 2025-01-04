Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B6F146D76
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Jan 2025 07:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735976447; cv=none; b=aRbT9Vs4drxEWSUMzOC4+1B2nON+f2ldCGxGK288yFG4MpM3cVLqk+6mMvkYE2x2g75Ytcv9YIb/GTArDTgoAdtjChhLzCu9Lynl6gjwcHwU4bwqR4OTNy/HJMoZHQ8U664BW90tbkEgdLsUZsabryrY2mheKVv/U71GZ9F2/h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735976447; c=relaxed/simple;
	bh=TbcHVKRkFJB98fhajLRM7Bw4MBvD1k0xqRdfdhNbxgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lv2sFUWGVjWqnHs4JW+X0jo+UCco/+MlOSaGUn24/BvvZzHGyA17Qktq8QZ+GLU7VBrp14czGOq+OUj7tMxljhpCYCiCT2Skh2r4hiwmVId243R+YosJPPFaI1S6Q0Esrk5GOZ4ZngZVVLwe+c0W/TMy4YMi4ZLgvWE2qAKDG6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQglDAkR; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQglDAkR"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-218c8aca5f1so228763955ad.0
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Jan 2025 23:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735976445; x=1736581245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gI4bkaQLizbo3HOuEzTTJL5LyowGuTN5RlRxoRNNOp8=;
        b=EQglDAkRtUx8gi5rOMKwr8BmgrNCa8KQXFbkHdAah5E8RXe/0VtELXwdVZRNZXBrgS
         XwdKtwkt3GGc52pVDFzXmZVGIueitl1Fxq9R5I8DDyNnDT13jTTY3Kc0zBHbNq1TE75S
         lldN7uR+/2PARfjOcCogYItmjapWS2fXR/YJFq1zq+6asiQSzogNcEqoHGT//ZXFFl4W
         c2AmJTLYJ17oWoJM9eB1hBdQVNkvI6KfBbOc70vGsyRxwLhzkIVoaK878nJfaIXY3UwV
         b5GGuWtNpKGwhY94/8STvgM6GTR22R6q+6oFDKTI0qPXbM30b9+TLfRiRNPsXWQYwVrD
         YiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976445; x=1736581245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gI4bkaQLizbo3HOuEzTTJL5LyowGuTN5RlRxoRNNOp8=;
        b=WVqIEO5tcOIBItjsqzpwRieDIOnHHW8wTa5hLI2wj4/KNnNE17A06QdO4+IVB8g+/M
         HPhJD8DCYeOsuQe1NKk7My/vhVGei693YStVUiExnKEuWvxtOqYToZW5pBvg28kg0zal
         og2Le1IMNfS6PKdbT+CtszDp6ibQ3W+R1YERzat231pJwf7aWOKXAqTAmXEPhCFD/kXs
         4Wx3o9leMnIAjhae3uw1QX2qSj/QJhYe3KRSYWxh+9pZ0af0YbgPBAEX7ZGckl63Xrlr
         Uk1UUjHkApU1jNzWptBgI8W6UW08zzPq0W8BxnMjpg54TpMx6gi7pNNFTZlokBPyWCl+
         /Z4w==
X-Forwarded-Encrypted: i=1; AJvYcCUaVcrNoA52Arf1gptVWziKuNLACBV9AM3NSsZRhRW6oZiztBmq1ONXsccQDiOlq6GDzf7QuHGUG0O0gQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj/orM9sv8T5gJtl2MiZbiPs8jmw/Ek2slTjRhDemgoavEIRt0
	dqjvdQkpmlHebypgYRAr8DS0xF4bdK/w6hh+m6OOCdD/T0hOT8CXs+DR7kQi
X-Gm-Gg: ASbGnctvoYxhlusN8nWuWvAv6VduTZqgv/2QV2szs7In0s27G03vVUDW+lGoEFnQTf0
	yLjRcOPBCnOOY92PMKaEhhxd6ldnskKsvO6AYIkjvp861Y/OXF016rfUdnK8frJYrjkWkLryfys
	dDdEmEvNRPvZM1p9tGYqBZExbo4IxFx2Tcn/2HCBYWLu7wi/67KiYdG3uQUOxrZ9gpzB+vexmPj
	QqRSvLITWS6cQmSii5imkZMhYrfLCkG1Fe8YDFXWX6ifCXGSg==
X-Google-Smtp-Source: AGHT+IG0CS21q53dEVGA2oPLK2te0e5w/JAMFEKzZxo/+YczSEWdTkdKuJD2Fisbi6FzS2oAnAex1Q==
X-Received: by 2002:a17:903:32d0:b0:216:6c77:7bbb with SMTP id d9443c01a7336-219e6e9fb45mr689469915ad.17.1735976444999;
        Fri, 03 Jan 2025 23:40:44 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b34sm256562565ad.252.2025.01.03.23.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 23:40:44 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Roman Beranek <me@crly.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	Stuart Gathman <stuart@gathman.org>
Subject: [PATCH v2 2/4] clk: sunxi-ng: a64: drop redundant CLK_PLL_VIDEO0_2X and CLK_PLL_MIPI
Date: Fri,  3 Jan 2025 23:36:58 -0800
Message-ID: <20250104074035.1611136-3-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104074035.1611136-1-anarsoul@gmail.com>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop redundant CLK_PLL_VIDEO0_2X and CLK_PLL.MIPI. These are now
defined in dt-bindings/clock/sun50i-a64-ccu.h

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on pinephone
Tested-by: Stuart Gathman <stuart@gathman.org> # on OG pinebook
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
index a8c11c0b4e06..dfba88a5ad0f 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
@@ -21,7 +21,6 @@
 
 /* PLL_VIDEO0 exported for HDMI PHY */
 
-#define CLK_PLL_VIDEO0_2X		8
 #define CLK_PLL_VE			9
 #define CLK_PLL_DDR0			10
 
@@ -32,7 +31,6 @@
 #define CLK_PLL_PERIPH1_2X		14
 #define CLK_PLL_VIDEO1			15
 #define CLK_PLL_GPU			16
-#define CLK_PLL_MIPI			17
 #define CLK_PLL_HSIC			18
 #define CLK_PLL_DE			19
 #define CLK_PLL_DDR1			20
-- 
2.47.1

