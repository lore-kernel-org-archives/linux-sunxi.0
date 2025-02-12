Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBE4261391
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Feb 2025 19:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739387617; cv=none; b=pQYPXHyDwrcvOR+rk3rLIEN5jC1WS8oE2R5IOhRdCLEBB+ZL5fg+013DwXUCUigDTtESgqc6Tlb9FxiPgQ1lqSvHq6hzHPPNVIttvujtBhL6Nepk7alZlt/xpSCAGQ4DPedwaX/stqQkMBHRv/JPKTXD2BdFt4wDA/a0+dVg/K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739387617; c=relaxed/simple;
	bh=z0cvy7CoZI1KQjd1lQNEU+0uhGQkFuAbegW5RCbJDbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gj7KNZU7Sk0xe5dMU8qJ8Dztv4xC7oR7B+CG9vaLoANljFe6WRm270lJILTzfHHuN49CCGqNFvZjcy5m+JlU3ulCF+tbbfFiRzRoE51LL6H/HS9a3IDReTfKoFsfYs9/Jns4gO9glLEBxvrgalhByCz6+FfE5+ZjNfYas8QyGvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnAluv/A; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnAluv/A"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-29fe83208a4so57637fac.0
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Feb 2025 11:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739387615; x=1739992415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPvX1VZxCZTcUdSqmfcga5Y7Gcmbn0Y072+S0IfGY1I=;
        b=fnAluv/AZtYWLSPO6IITSv/jZVMv8KrPCpu5wNOdPENmubcXMNTFjvuHBdGUNS9nqp
         xiqeQMhJNvN1GvxU2L4tAflO8Sncy8Jsr4vOBnU1qSqJu8q/8UMZxGYxl8Qo+Ty7YM7B
         Y2QjPFzdOC5Fw+9gZ8We01gO7xJYGfQVwYI1Er1MwwvH9AZG/HTOxCS0/mS2mYRVFDMV
         jEgAn+tpFqXNO+VY9oaIxosP8ERUtQUe1L9H1jFcniFgSPgZQIlyFLsRn1apZstdpAAx
         AJNhPWrUE3wKqykWHdsFn7vI4WD9e7jjbV8UkiYRjiR1LdwY1TqWwJSsCsJ0z6WOFbrM
         FV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739387615; x=1739992415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPvX1VZxCZTcUdSqmfcga5Y7Gcmbn0Y072+S0IfGY1I=;
        b=k73EE8bnKRF2YE4xTWM5b0SZ46tf1W2oR1jw/TzIN21pdBaeljCDgSDioDou2DgoLu
         7fUOiSJ4rL3TYREYLT6PbdMo+Q6FC/Gx3Ba4bA6eKyBQy8xc8fo89ww94wPmrzOqd9NM
         atYR/juYEv1oU9CHRGBghydCmTuwxoe6UPZtvJ6SqPS6vN9UMHj/BapdrCca1F7TPYXf
         N0gFFN8riYx2u6GtsHS2WtzOShPTE+PMj1r4YK7QooKQDvGHGoLLTD6qmkWiaIhzWk3+
         YOo5bqNiYDJmBxEnRtYJZ0+QqhORu8FmHu5/O3Yr4SJCTfUhXCxpIACCnG4+Qfqb8+PZ
         zT8A==
X-Gm-Message-State: AOJu0Yxq3EWJeiZJ/Swxa+vWNiC4HcTi4mzjQsbIskVfmldaEt0l5+mx
	vs61VwywlVDrf3FAOobZPQzdY9W+vEvgKZ1VS9miWtiPRcrrlYyn60jCTg==
X-Gm-Gg: ASbGncswroclFy3TmHHs9Kf7ImtsSkO3So8gL7WnaPMXje8zKWms0ZHNiuRkWO48Q1T
	9eNGj/9lrFtrzVsY0syq5OovcUOsfZrFthBdpDvhRi5GLATH8C5EOnS8G0nXq2AD56roqfrP6Qo
	WCD/uB5mxVjZeGXYDC34MSYnDD5L9QvQm2KNspcIw24xKmlaMS4YmYHC89A2jNM4iDGkD6qOtvs
	9P9mCcVlzPrWkwBfcwega+ILLc1HNaRo00YoPkIUn3xF+784Pz25/BtRnNzTfTrcuR073s8zMcD
	CjdCJFWksQ9SJl5a+r71pkl3nj+99k/iig==
X-Google-Smtp-Source: AGHT+IGLpGqe9PgZ1RGUz3I0EhcXiIfMGzPNXFezRNcSxivX+N1jbT87BMG4DvVt9YaF+ZUOOSmIkg==
X-Received: by 2002:a05:6870:f789:b0:29d:f65b:85fa with SMTP id 586e51a60fabf-2b8fb2379dfmr50404fac.10.1739387614885;
        Wed, 12 Feb 2025 11:13:34 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:511b:97aa:dc6:7ad4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726fd014926sm356033a34.32.2025.02.12.11.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 11:13:34 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	p.zabel@pengutronix.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	ryan@testtoast.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/2] dt-bindings: clock: sun50i-h616-ccu: Add LCD TCON clk and reset
Date: Wed, 12 Feb 2025 13:11:08 -0600
Message-ID: <20250212191109.156766-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212191109.156766-1-macroalpha82@gmail.com>
References: <20250212191109.156766-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the required clock and reset bindings for the LCD TCON.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 include/dt-bindings/clock/sun50i-h616-ccu.h | 4 ++++
 include/dt-bindings/reset/sun50i-h616-ccu.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-bindings/clock/sun50i-h616-ccu.h
index ebb146ab7f8c..6889405f9fec 100644
--- a/include/dt-bindings/clock/sun50i-h616-ccu.h
+++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
@@ -113,5 +113,9 @@
 #define CLK_BUS_HDCP		127
 #define CLK_PLL_SYSTEM_32K	128
 #define CLK_BUS_GPADC		129
+#define CLK_TCON_LCD0		130
+#define CLK_BUS_TCON_LCD0	131
+#define CLK_TCON_LCD1		132
+#define CLK_BUS_TCON_LCD1	133
 
 #endif /* _DT_BINDINGS_CLK_SUN50I_H616_H_ */
diff --git a/include/dt-bindings/reset/sun50i-h616-ccu.h b/include/dt-bindings/reset/sun50i-h616-ccu.h
index ed177c04afdd..81b1eba2a7f7 100644
--- a/include/dt-bindings/reset/sun50i-h616-ccu.h
+++ b/include/dt-bindings/reset/sun50i-h616-ccu.h
@@ -67,5 +67,7 @@
 #define RST_BUS_HDCP		58
 #define RST_BUS_KEYADC		59
 #define RST_BUS_GPADC		60
+#define RST_BUS_TCON_LCD0	61
+#define RST_BUS_TCON_LCD1	62
 
 #endif /* _DT_BINDINGS_RESET_SUN50I_H616_H_ */
-- 
2.43.0

