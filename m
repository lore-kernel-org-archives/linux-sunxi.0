Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BF917BBF
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Dec 2024 05:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734241020; cv=none; b=k6iwkg3KVST5YtbGGwSoVY54nfpJkKSKAb4BGT/sVblwrjmGN9e7n+m0drRILthA0SbrIHi+xE6y8MzxL7xjNWRKrsmbL31mf6Y5szxSs7ntnVXaf50Zn7lvdJ+wtrW4f3pCGbFV0FwgZkmqu3UgLzj3yU60yipBRhVTDO+ceQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734241020; c=relaxed/simple;
	bh=vD0k3JGDE0A91abw/IgokKvF+uGeM+sDMvZDAxLCVjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NH4pGcCI07z8b0kEmVx/zm4uiAm+lPNdKoQ0KWqSQ1aOwqDcjMKB/3I97V+TBn1U0x1CC4WW9unop3UNtS1LAl4YjK238cFmbJXCImNNVU8zffBs4HI2FNHCc7ZJF36htyxcMVBcbVUoCwzGCeMk03OUGnwfTyaQjlXfH8pa6ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AX5BVdLD; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AX5BVdLD"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee76929a98so2215520a91.1
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Dec 2024 21:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734241018; x=1734845818; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWB9xUbuC9ZZF7GN4R9hjYXfuiqehEyAMCDY4g5eDqY=;
        b=AX5BVdLDW14aYcDbWl5iTrnx5jX5MnxwjwE+6/EsoUP0+3IuTPxe88A4Vg1DKRUbrK
         4Mo61fkvSvecsrpt7wVyfeh/X7UQyN7jO6G5VL1lm4RbSxyRhScfoHScuO6nqi2Nu7wl
         b94JfpAcJMMXKfX4SOetNGzaf3JxamR5J3vK0n3goPYDV4MRv/bclxLnujBXNJYnsIVB
         lwt3srUJDEXJNMgin8dgueoWnAQShlBTt198YkMTEgnFYvLrunZA88ZXZCkPpLNYpIzP
         sLjWddrKcjAIH+mQmWu3y7fA51CuVB38k1AuayHwkeGSq7B3R9yJkWC4ih3ZZoCprlNk
         F4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734241018; x=1734845818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWB9xUbuC9ZZF7GN4R9hjYXfuiqehEyAMCDY4g5eDqY=;
        b=mx72b5VDd31LnTfednROlwUSOV3U4DK5iXJmzs3dc10pF/bppiSZWzTN4OleT2qkYZ
         E3ZVMYRLCLOzZ/pCY4X1QDNvub9j1dw6GOIA7N9wv4U8Y132kmj9nclm5UtpUMBQHgkP
         erVu9nxFR4M0dPsjNhbMKlvQSAyr4jp/OEjb2mRZS/fLInAw7DVmyoEKcI6fn8fowVqX
         ohV6HkV4wysRl7XvqzsaA6aa/iUJApAbdfhcJ9a0ChvGBMtgv5W3m15CJiSt5kYtAoj5
         KX1fVa6/1aN2zCSXw1yWVcM7mdxl7/9eq+n3+KbKFG6sr1Oi5B0o24TIYACpTscgzAdW
         XGtg==
X-Forwarded-Encrypted: i=1; AJvYcCWLp0Gl8VAfekhIl7MIwlnYLlw+c/jj6cbV4+gDy+/mf/xGSd5KKCBON1CKPM/BPqVh6go0dFwqnn4L9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGNCNPUpKVlb6bE+lx876UW3Cu0LXAI18GT/LHZLDVzsRxg86i
	/lQryj5L9ZrI+RNaUO9NRbQAuhyjqLvoQUYvqiuYTan1jXxpn0qc
X-Gm-Gg: ASbGnctovh5tKYRG/MDMQH8e4jMLtrHNwfmpJ858BqsORjvbxcjBSKjuL/b4s7i83cE
	Gwp9eoh9gskeb4shmVL5dutxy+tVQSrWaaWExI9LU9O63M5wpYC5cFTSJJ+Kne2k674gsQsCgom
	KrKRSOXE8EbeqVLL46guZ9u/45SNSdDZqyV+ldYpntiiKAX377WazMmGhOozCRvIgTs7YEVQEZT
	AEUNCeKfkCoLpQ7Jl52000fXaxGvjuB4xO4rVc6z22YikcwqQ==
X-Google-Smtp-Source: AGHT+IF2jjiTuuQytVaWgmoT11AJ2AJQUADdSWheU2GdN/FSM7l8KDl+72eN5xP8lMEWk1y6CvNoFg==
X-Received: by 2002:a17:90b:3e82:b0:2ee:edae:775 with SMTP id 98e67ed59e1d1-2f29153c0c4mr11837653a91.3.1734241018179;
        Sat, 14 Dec 2024 21:36:58 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142fa1cf8sm5729803a91.38.2024.12.14.21.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 21:36:57 -0800 (PST)
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
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 1/3] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
Date: Sat, 14 Dec 2024 21:34:57 -0800
Message-ID: <20241215053639.738890-2-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241215053639.738890-1-anarsoul@gmail.com>
References: <20241215053639.738890-1-anarsoul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These will be used to explicitly select TCON0 clock parent in dts

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 2 --
 include/dt-bindings/clock/sun50i-a64-ccu.h | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

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
diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt-bindings/clock/sun50i-a64-ccu.h
index 175892189e9d..4f220ea7a23c 100644
--- a/include/dt-bindings/clock/sun50i-a64-ccu.h
+++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
@@ -44,7 +44,9 @@
 #define _DT_BINDINGS_CLK_SUN50I_A64_H_
 
 #define CLK_PLL_VIDEO0		7
+#define CLK_PLL_VIDEO0_2X	8
 #define CLK_PLL_PERIPH0		11
+#define CLK_PLL_MIPI		17
 
 #define CLK_CPUX		21
 #define CLK_BUS_MIPI_DSI	28
-- 
2.47.1

