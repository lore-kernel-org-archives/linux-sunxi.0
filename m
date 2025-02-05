Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E7E86333
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Feb 2025 12:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759962; cv=none; b=Y7jcPJMaqVz8X+KRM7z09Su4mCebo6i5JWD1UIKmBjjAzgn3rQQFGVW4RtxxyKN1YvVmRpffaQ3cQ8ll4+r87u9/er/gpwFQ85SqEPC4clrsbNLp0jpFw6wFJyvNCIhy+or5sLkEnqCuCu8m8Xxx68DNRfcYd5L2cEJKEIrUwVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759962; c=relaxed/simple;
	bh=eOka4RycAnAHpLURzUuXOSzeKrLS2SoFDR7DtVsCCbI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KDvEPGukdcGYb2cEjlAjEVrIQ5HoQ3f7HUIHGnLo42BhdJpR09oN9/23SwgX8GHIdPoa1Lv+pIK6SUpPQ8Ieiw5wHi6IM/HZb4JuSqg+7tVxYERkLZQf9/DIJtM5yPUPTSKF1URxhVp5UpFLki8ucMiDPXEQSukMGr4nK+pY2xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cx9CZq6u; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cx9CZq6u"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dca451f922so6549156a12.2
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Feb 2025 04:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759957; x=1739364757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZ+VTE5k0sR1ZK3QqyyvU9VyA3FsM9Zod0FdH9bBQvk=;
        b=cx9CZq6u5jrHXZnuKawIcXWZw3wXk/MlLVciwpbdLJLDAKL9Mpon1aUcPKILqXevVj
         0+2S9t7gAtlXXeDrPGUJ/MfJYsD+kgXbbJQBJyYhwZd1ACZjFHrF9Pj5YJAaoD/RlQjF
         ngjGltr+5yrXZ4gaXwOBtryyqp3UT3bC5IrDd9F3y/Cb+399PGK1tkXJeA8jR+cxNPuh
         b2nn6QGNkq3neFRf+efORMwGX8KcC/sCMe+dFv01Sxut37nkdmwn27CgTQl/G5jotYYz
         7UIYw5NzgFBc1aoV3I7pG76Na0LG6tSx53wHHy0yFqElp8HcDa9D1RSOUplr+e6KcvWG
         WAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759957; x=1739364757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZ+VTE5k0sR1ZK3QqyyvU9VyA3FsM9Zod0FdH9bBQvk=;
        b=V5p7p5wlYNC4eKAjxCH4w94N94RVsFBdEGVZj5zYoQOT7wi8MIRxhrDPMTZwoFYzQz
         3RdtJxdS/qEQcaj+o+PpCuiglcPU/G1mgK+4fBOHEF81fGMb+mulGPKgtJANIw9mWDz/
         8K8DpZwSZbn+Tk5WhVbJAM00hBGXGgkByHdc36CXS1+ZazZfmfak4tZzvra9ETIp/ulp
         j1H7Sg8DsbqM4EWsjs5JgYK5TQuypG7cafWqyusK1vMaFTXzoNOOHKcjGpN0uGdW9FUV
         UhZqTNmfdm7bNR659pzFfcgtKxVzMlk6DEWWAJR2ulRp/ro5beBIHjQuwsm8MHC3eMd5
         YEjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW++CqcfdNSNt94YAETQWqR47/VuR4Q07zpoU1HkuJ+b8Rn82sbWkurobxh3LaBxiBO/PY6sgVPnXx50g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuRMOeNyNjGfvuLzqpVjpTtJBum3EMsisYnlYiwcBUQsk+WWnc
	v+aWrpsJictANFHHwHPp3eFL+Ji6GG4t9RL98NHQ6i857qoQKHND
X-Gm-Gg: ASbGncuyHC3MmxhFP+z7LOoO0GpEcjj4f3QltHsQEaH680yN1lDh/8dRMvY1Y+0R/DK
	7qBKrsOBZ1oJ9j4zPLH0VRBZkHkIQ8RTdLSXOB+2/EC/OS0eCtaD0+FkhDwNdk31/COoogWrcEn
	sibNX3prvmk9/dINWTgSaesie+CNIMsdwZCks8H2ry2pqOxL/H1+sw3Wz4S8fM8aEJPCZApy7NN
	YgXrCncgpcC0lAIIBH6+c6azcqEFcuCIB4C6vz3vnsPQyI89TWak4UmsFkaolljxe6FXGvXu9qs
	kk5ehxx6bfv1+4iBJAPqSX3BugLbazwsYp1ZYifKX+1+iQ==
X-Google-Smtp-Source: AGHT+IGRhSv9Imhm+auTjNV2o2DuhUhkhyLQG8J8I3Ur0Zu+jneuDXHk2hYm/9qI5G8NhBI2TZOWSA==
X-Received: by 2002:a05:6402:278e:b0:5dc:c869:da4f with SMTP id 4fb4d7f45d1cf-5dcdb7645cfmr2783894a12.24.1738759957120;
        Wed, 05 Feb 2025 04:52:37 -0800 (PST)
Received: from localhost.localdomain (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724055e5sm11559997a12.45.2025.02.05.04.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:52:36 -0800 (PST)
From: Andras Szemzo <szemzo.andras@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 05/10] dt-bindings: power: add V853 ppu bindings
Date: Wed,  5 Feb 2025 13:52:20 +0100
Message-Id: <20250205125225.1152849-6-szemzo.andras@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250205125225.1152849-1-szemzo.andras@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document V853 PPU compatible.

Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
---
 .../bindings/power/allwinner,sun20i-d1-ppu.yaml        |  1 +
 include/dt-bindings/power/allwinner,sun8i-v853-ppu.h   | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 include/dt-bindings/power/allwinner,sun8i-v853-ppu.h

diff --git a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
index 46e2647a5d72..f578be6a3bc8 100644
--- a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
+++ b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - allwinner,sun20i-d1-ppu
+      - allwinner,sun8i-v853-ppu
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/power/allwinner,sun8i-v853-ppu.h b/include/dt-bindings/power/allwinner,sun8i-v853-ppu.h
new file mode 100644
index 000000000000..b1c18a490613
--- /dev/null
+++ b/include/dt-bindings/power/allwinner,sun8i-v853-ppu.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_POWER_SUN8I_V853_PPU_H_
+#define _DT_BINDINGS_POWER_SUN8I_V853_PPU_H_
+
+#define PD_RISCV		0
+#define PD_NPU			1
+#define PD_VE			2
+
+#endif
-- 
2.39.5

