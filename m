Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26DB1FFC54
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Feb 2025 17:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739467518; cv=none; b=s+aRK3QoZmWdulBt/2p1WgEMKbMCQE6rmkq3BLysG2VYRR/5hy7yshBUWRqS3oII45xbrhulQoUkFexzd3goLoy55KLXFVFbSuunuyHdTu9tQUilXavF2c7TKrHsmJd61m1WabY0o6+24VCZwPupD2c2QLsHTI1yC/sK41TG0+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739467518; c=relaxed/simple;
	bh=cxgqBBUoA1RW4v6AqkYWBEmaS/cKXUa9UzQ+tQnDnKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NQ1Ou9Lzi683aHJWjFUfYXQIKZbp6HzpT0tnF06c4INRQSkGNSdFxIRtYO7IM3TmwqD2YR9jIK9riRlmNHgNhb7SBeBA0QWVycXj7MK6tC2gQxzvp7MDO2oAl6iwDisAkiCDs6+dfJR2EPqQp8SEbOL42KgaZd40lW2Je5qykKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O78Ln75V; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O78Ln75V"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-71fbb0d035dso725115a34.2
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Feb 2025 09:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739467515; x=1740072315; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=At0hIh6d9YHwPFv0kdC9x7LYgvuthrASy9cIAbH2c7M=;
        b=O78Ln75VxgGkMGYqTf+wdErTh6GblnN4RQvgKtiz08tjNmSvwiJdAPYht9XN9VZV3E
         r0NdVQouyUhuhxWFp5X2n+WrJhtmSNSuc/uaVe9TS5TRTJGdzUh/5bN+HyrCXS4Skup+
         iq0ooPSDLHD+umo2IPFFKrxdFn+d3CiSO/R2LBrgZaSQGmkvKI/lvqD1tgUYgP6E8cwc
         ujTdI2Q5hVanT7oL+3va468r8Fsi/J9IffY3uE8yCDn+SJ5aN46nbFgnTbl7EX5fyd4K
         sSaH91w++8gGPbAfUozdLTSrytYHG8XsuU4K19kSHiqp+bSdiDH8KnvTkb9MFYQHN7Qh
         c9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739467515; x=1740072315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=At0hIh6d9YHwPFv0kdC9x7LYgvuthrASy9cIAbH2c7M=;
        b=U/duftU1JK3VtLx/CS8xUTnfYCBTAxwFrRtnvBQg/aUMf852nT/x10mK7CTW56QjOd
         tNsVswtEKQFZhkz8kn43hik1oJGyM0Q5A07bYQz8Z6dnq7pEdrXHM5mDAUnq/4CXP3dS
         P1x8j1TQ+LW9h8g0fH+IEQdE+lI1lSyD3pT2nuCkjRWTZ/xF2YiHoBTSc6kktfKRONqY
         /MmYRuMAfSl38Xpxp8L5uWyL2aT7GJcdvb+KK1W5Bo+jjU35MGgvLDkEKJnSf4QaWzmv
         irgXTsM2k8sbfrqDtdAHNTMAS1nxMfwLDXYYGJVu9RT7Y5hRj9ON94xURNyHWY/GvohC
         kw9A==
X-Gm-Message-State: AOJu0YwaN99wUCHUlZWv9GxIuIB1ZoF7oy5PuGKsiFuzrXhdE8ntvUFt
	Ccfyg4tNch7bvxoatvUbtoKvLxGj9DFZtiNXCU5dgcgiZvR/ndNr9axBKQ==
X-Gm-Gg: ASbGncs0idebUhJ7Eou+1kqYTOOzg1UsHuBYElyuXPFjNafnXzCgi7drnDezdTUHl3g
	hV+n284SCM8RUCj8yGXQnrOZHEKcaIcQNi03bkY9V56j8NtWzVk/Ls137IaZmgjbjlGsbnbae3g
	QnVIKt1OKg/k9nK8YzC0nIz/P09ACejxG9Ufv3ePxCbrN8ttGeLdQVZkeX4IRFyvAny5pN7wGCk
	7Y6+UIwmZG2bPcFdQk7tFKjsBVwi8oYylY5bZEA5iYJ/yL0QtN3fDhNmTWXdWzcWmFfw5peZXN0
	iMqUj6trQMhfwRmbH/1LAQoCC7iD/6DW2qU=
X-Google-Smtp-Source: AGHT+IGy8Wm3TFQxFTy0vlN58zUI1YysrkEHI0sYL3AEPsSU8xnt2fKFb2VeDGT7QQG24DcP92h/8w==
X-Received: by 2002:a05:6830:608b:b0:726:ee0c:57dd with SMTP id 46e09a7af769-726fe80318dmr2637138a34.28.1739467515249;
        Thu, 13 Feb 2025 09:25:15 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:2d58:1e06:61bd:218e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fcb155b77dsm680358eaf.0.2025.02.13.09.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 09:25:14 -0800 (PST)
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
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V2 1/2] dt-bindings: clock: sun50i-h616-ccu: Add LCD TCON clk and reset
Date: Thu, 13 Feb 2025 11:22:47 -0600
Message-ID: <20250213172248.158447-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213172248.158447-1-macroalpha82@gmail.com>
References: <20250213172248.158447-1-macroalpha82@gmail.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

