Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818189;
	b=CTWzP5r7obNoLQZuQIAeWk8omkVf0WzEJxBED2L6JKgvnbvCyk89+igwKPswcejN79Ls
	 cjzphw930wWY4WXj2LuCkQ9rsFONZ7FPDcE7fQiyfz/JHvE7NTKNLXjOeuStETdkbZ43Q
	 Kx1av0cRgOlhETUb3zbb4+lNcpjtbywAuuAm/YNHyKM7dc1jX3ssqr50Q8XQ+ZWzSM/cr
	 P+zDnmF8Kvogd1eRDyCReQfeZCqFZftJDihpsib9hzJamimKh62cCK+RZ/qa3PEqBfX9s
	 /wgyNNQcBDAfV5a7BdPxWBAYAlVPCGXAqV4soQRGVTywtPwQ5JAnrzMexKttwL5koEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9PHCbRvvMmLrPh5VFq5+SIP4ujixMpIDMCoNYb2j3tk=;
	b=eGJ9zgHjqYjzDKQY+d7mUmqdeecBR9nMOHaB/ysv+E2dGrgl3/js07PXpU5+bhtZBTC/
	 iOAwVC37TG/Y+B+e04kR/HHL6IFZOCmpr8gb/WgRZhYFrIg1UV6PWQhj+qh2Y5KJsPATG
	 n3h0UO9UNSEIUP791GFqAXREAQoBydbA876L2rZ0D+y7Sa+vgmxLXZmvf9pZMhaXc4Fa8
	 68RxVMO++VTqSNwULwtoXQAkkBCfmvtcRcgboifS2pW50OX6/lQ+Bg/JvfEvRil1z/W9V
	 Aq8GKBE3sjg46CLXMact8WgLdk0zLE+lTFCLgZ9dgi+nxLTRhGJH/sa60iOJFa1vvPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HHsYQEMa;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FC260A2618
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Nov 2026 18:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20FC260A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HHsYQEMa
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214af2076so7696905e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Nov 2026 10:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818187; x=1794422987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PHCbRvvMmLrPh5VFq5+SIP4ujixMpIDMCoNYb2j3tk=;
        b=HHsYQEMaZonXfxfUy9m7BQ+icWVQrpBgssOsOoFkXYTlOy5LIGLZOQlURDm08+MWnm
         IvO/Cqml1nKguxGrG+fbBDMkPcDujplg86LpIWKitr4kc8fEwoE1y8RThKJApI03dOKb
         K+E4e50Unr2PDqTl0rOkfXTU6ELsSiDfHYlsaoPsNGi8zhbln4Lv010rGTq4a/OtD7fM
         S+MdVWC8RUvHZgLoU8/Fe0Vebzei7dTuZLfwj8OZ+aoxPboDwwgEP6FXL6wFDfCYg6xQ
         vdGDlTU3g77lK9CnFs4ZZOgZ7tfB8m8WWT1aXAAb6yf59l0ZX9BzdiYvLQ1My1K36hCT
         7U0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818187; x=1794422987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PHCbRvvMmLrPh5VFq5+SIP4ujixMpIDMCoNYb2j3tk=;
        b=YnUaS446bxJSlvxVlFx8AQv9Pl9H/n9YuexL4SoVeiQUoC1eOTt29/b5DCkz2SggQX
         LmQFjtivENpiJvS2xyeXaYQOiSXcaEXPXClUydavvxAJ2mowCeSYxcZktAhmKKTjRgIh
         ygMztrrQTNEZnQkwc3oMyFteeTqepxE06x2ycxSBS0M+ncHnovx59z7qmhWxDZp+uXhQ
         /pQMuZaPKm/uACyk0n4U1RQVkzGXWgiaMXxYVzJMKBPSbgHeOLLW91F7lJKGTQn8EAst
         r5kOzIdosWGnjDNbnflbRz7MkbNJeszqBIBmc40P7l4yeNQmsYJYZbv4/XtjCRZbUDb3
         3kxw==
X-Forwarded-Encrypted: i=1; AKwUvBw8qDTcvCkhYqNJTBQPWMHeDwa0QIA6PJgg4EX0qJ4GenXDpPocjF17JsaTiXbM9cgvhGODo8S7zpwQJQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/6s/RG7EqoIlgXsH8CR7ujJk/aXkq9vIcPyy4Xea0ED2FS3cf1
	a432FomFvrtj9XJQN3ll1oyPIEecq4h2HNifNp+ZUrEsxFhCIrci46lP
X-Gm-Gg: AYBFou2EfTbHvOWZxT/pjUlAa5KvX2DW37XuKO+uNDTHHobXYPhDNtA7lpAmLV08+aP
	Yyh8DlHlJXKvlxN79NFNt9/RTuouLFG+x2FG79IfIZvwNTdvmYED5xB1Y5uTbTfmuNJSbXbxgXN
	e4Cwxx2rSnlZHh4Zoh4SnflkYvJJgHJ1v2VzCRW0glLDuHlqhCK4DOjo+1zdA6TmnbnRT+0oyUc
	ns70vU2QiJxSXLemiaf8HU7/XoQbtowu3z2i84ebJ4VHf4x77RCR/b9SzSGy24fh0dfgFPY10Yk
	8y1ixGVYwEcleHpYR4MUagam3yydtoLUbmNS38fatC4+LiistD1bzJrOKAd0ahQBq6ffor/oa4q
	3BptiZ7du7tNMQJODeJfpy9GT+2rttPs+fPEZ/oIBwfr5NAhuxvrajq+prnshOk78Ich3K43nFG
	kH6BdUfaV20Vg5Gt8YLQc1XaVrqUlSjcr7lDgooyuPxpcM9BVqZQfPvEV1E1GaJC9CmHl2j5xVO
	snJzfJ6bd88HqJ2q4e3j5m9/ShVJhhC5a9F3ETn2whI4XtfLBr8VuDny5NykdJHSe9vC20xbDfk
	1wf+i27dtobi9mEgg8ivn2VCOgGscoWV8zJ2DL7tsQgRjdp7luSdW3njzOrs3drddQWbMBGufGz
	EUtl2NHS2dBfucUYQfLclzfqAh6XtyKrSnGl/5runS771PQGBPvzLsNqXStmSx829CzHWlxSsri
	7EnEKscuQk0+dpPtGNt1JZfz9FyJq5BZMAxxySsX/GM+TQ5ZXzBE/px2VxB3ICo/TBhuZv8QCu+
	6Tlj9cudNzOlZOVxCjipMt47rOCxVUMrbGy9tqpKbML4PVeF54d+UzSMDQhv9ECAw==
X-Received: by 2002:a05:600c:190f:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4ac1275c26emr364814095e9.0.1793818187271;
        Wed, 04 Nov 2026 10:49:47 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22e1sm5081745e9.14.2026.11.04.10.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:46 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] arm64: dts: allwinner: h6: Add GPU OPP table to all boards
Date: Wed,  4 Nov 2026 19:49:39 +0100
Message-ID: <20261104184940.882833-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104184940.882833-1-jernej.skrabec@gmail.com>
References: <20261104184940.882833-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only the Beelink GS1 and TaiQiCat A01 include the H6 GPU OPP table, so
the GPU on all other H6 boards runs at a fixed clock rate. Include it on
the remaining boards, so devfreq can scale the GPU clock for either
better performance or lower power consumption.

The table also works with a fixed GPU supply, as on Tanix boards.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi  | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts   | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi     | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index dc7381c944c9..ce82aa265cfd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index e34dbb992021..2948369cd659 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "sun50i-h6.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index fa7a765ee828..f4a5a2215ea2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index bb7de37c0d58..f08077175549 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
-- 
2.43.0

