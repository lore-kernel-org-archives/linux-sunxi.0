Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748947;
	b=DWctBYdUnDCt6cbGgecXHKxDs2olTF7DdyfQIiR9SOKSzkIrAoweJsEw5vtwKiqNgDpn
	 1vWC40r25Yaw6EHaVnfY1lsOd5ibmWduAF+2FGHf7e4ug4TmSkjvQe2q2xxp6sqOlaVSO
	 rEXLKSeJLaz/SOYVQ/v+YYPOD7RSKifGOcmd8WBTY9jFPoaTcQoT0zZR2B5oFjXioAfmz
	 qDJbxApMsjJjokqfisocu6FCaJzJNk2oM1KobOyWCg65cI1ENKO+3EFY1KDw+17vjPMTi
	 f/TRgi9mj1J8jrGUcE+dsoVNvbjcHUfOpzar1/dUfm5rSzZc0+xEEKZjDwKdBMdA67Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pjzj5aEMnAhOnp3zC+6PlBD16bM2Wct+scJniZ3yxAk=;
	b=pcOKhJ5o9/UFxQUs5vsVP0HuJN0HT30SjEPtWhXB1NsDK7t7QvntswX+oBvk63UI3Xui
	 rShvo0ztbi0PzTR73fnMKclZ/+bxQrfHevbC4ENcPW5NUpXul0lY67MrALBUnkmRCiLmw
	 Ok9dLt1lpGfzmM4AlbEOblZHgzlggDqjQAhfjNNDD9GTd9ej/bNL7WxPsF2uaQUqh4tcY
	 mgiAR+xdnkyF+UDRZBRWNwTpLM9IBeVkjRQpFRnVEdXa+seP98IwNO2nM6ryp1X/0b4Wr
	 uOb6Uev4/MDmTgueZF6Yd3BnnYSckrJIpiiaO0WLP8XOPVrSG2KTe9xxfbRtCAynfrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gn/hNIKv";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0865D606A886
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 13:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0865D606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gn/hNIKv
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49465892f7bso2140239f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 05:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748945; x=1795353745; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjzj5aEMnAhOnp3zC+6PlBD16bM2Wct+scJniZ3yxAk=;
        b=gn/hNIKvvP5fJ+uFTXCs/zpX/z7h43yHdcvfhCePIdSSBd3jGTejzE14HnEDAVrKKu
         UIZs52aLuhSngaOod7wRTe0mJ2natx+UrUrTMa/y2GpmxndbkOw7lB5dHrmZH9XIYict
         e6ijGK+N67zmyTRqtaks4Qq+rxW/MXRCxcFnosrmB9hAsM9TgnRNYdVVOPgsxp1J/Z4I
         VEDEqMD5ZLOv6wmH7vob+Ihq74z91s3/JAgC55g4nuX/6Ihn/GCrcwI+GkrBzHWQJDjR
         rY4Kpa9MwJK+gicrYQB5sGqbkNHiWuKqKYhMo0ZrjP+h8kZfgsbu9YiExvEBmktbx4nu
         3TlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748945; x=1795353745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjzj5aEMnAhOnp3zC+6PlBD16bM2Wct+scJniZ3yxAk=;
        b=TxRVFWIcsAjX6vi/fidclvUh4pZQgk8i+YghBIe0t5xyoIX9bbztg73goZc3RjbKKz
         KaBXGO0rbg/uS+eBnfNipqnFlqRmh/tqt21SMFWpYUKZgq6xxDp1K59d/Rba2U58KXe+
         WZpy9saEX6AtbuDIUI0YYNeg0tyl1XWj34QywBLGLhGR4WmAJHp14ku/cp0TJvVN4eXM
         N8ZI55Quz6vh9AJFUfJ7gh7UWD7yYoXKehw1Nu3GcxU8pQdzKaQ5j6eQxs3qaujSlYe8
         KB8gR0UaRQPoQDXP8RXX6DZC7GPKpPv5QcoqwUZOkN5V+NLnllpebHLmPjBY2m+0QBnb
         0yFg==
X-Forwarded-Encrypted: i=1; AL+hErEUV7wxuHf170v418rZ9kgYtwws8+AiKwm4sQa8z0gvJX6L0sAcGFW73DokzgbLcyuhqwpPYuYKHc6o8A==@lists.linux.dev
X-Gm-Message-State: APuU4Z/9xVcnaQqteRRlDfz8ff9U/cZR1BLWGt0/VIeHwDiqNZBPV79L
	FUXThRSu7uxDjR/HqiRiNo7NXJp2jTgetclyqvfuYDX5a+6PwdT0RXc8
X-Gm-Gg: AYBFou2vGetB3APm0chmkJEtLp6vqFFKnZAwfESG1yU/J4XZ4l40iUnUoN9qUHGx0e8
	GCoeNlsIEnqTtUwGN83azJ8nbig7XMT18KGC+u3IOIHjo0wBPMl7rfLFNUhhMv9QE++/GD7Ok+N
	3ciZnHQpo4Z8Gzt2g2FuVd30J7sRtD1gi/LOM4iXLP/e2vOZCC3l91jM3DyQenlVjxyxiNOANfI
	ebmQEhtXaSiJTOjEVxHqoDfzfjR72SBG7w0lYaKQnYj8jfoJ1hbzEseUXUjNpaCEJN7mMrUThht
	IlXbt2x+gykFZdlncO6d1foyN0ZoeO8wURHP/PbI5XJ8oxBROmNbWXmUXBkc948b/jkZx/+9LE0
	qQdelfH4CpEWL7FRhXIx3b1BK58YEDIKA49jDU97WxJGxb9JiCib6ebS7cu+rPBpBuGM1/70iIv
	vB8f6Qx9hdkBp897JUgDXp0UhfXycqOuDpGCbB4NCbWRGKyxmVcJgSSUw72os2ZvsOFy9DnAf31
	uT0UVJWtp0qHClzO8oXmBQBkrNoOx6DES0GCybl+ut7Bfzm0XuB+K/fi1dAqTJwRi+pHn9x+6AH
	zkKuskGDw964Qw8IOISCuqnnj+z4Z/K0DEWlVFqP0k+hi/hocc8W7teLrlxffvs6vVXUwjh98/6
	6u3hW2/Lnon3+U7pqdbTOtd8C7HFnFmGySx2RkiF9AZcbAl+3Nr/wc5YaQY+zJLp8Ds88gLxITT
	8JCucrPB6brT2hzmZhmoRafc9MmLeYVYeEZ0MH4ZWK3IQef/Xzi+7lzwUGCO3edOXXGaV2fawom
	Pg9zHqkZ0YGB7aHG2JUXLbSwbEt5KH8KqE=
X-Received: by 2002:a05:6000:2385:b0:48f:d7cd:a5af with SMTP id ffacd0b85a97d-49c6a645dd4mr18844055f8f.0.1794748945187;
        Sun, 15 Nov 2026 05:22:25 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18406672f8f.1.2026.11.15.05.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:22:24 -0800 (PST)
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
Subject: [PATCH v2 2/3] arm64: dts: allwinner: h6: Add GPU OPP table to all boards
Date: Sun, 15 Nov 2026 14:22:13 +0100
Message-ID: <20261115132215.289236-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115132215.289236-1-jernej.skrabec@gmail.com>
References: <20261115132215.289236-1-jernej.skrabec@gmail.com>
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
index cbe88ee6a487..40c5c42b347e 100644
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

