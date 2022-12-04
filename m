Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A5C5CB8
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Dec 2022 18:33:47 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id b3so15361947lfv.2
        for <linux-sunxi@lists.linux.dev>; Sun, 04 Dec 2022 10:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xhyv5obJO05pgLR8K6bKL4W/XWvPLVM9OMLPNej/i4s=;
        b=D6DItwIylWFUvf6qAi7r7s7S2xPsf3J5mgFJFrSeGyMxiEFCyxJ/w9inu5R1slLLDN
         2agPAZ3zb5tkvMqGA73PEJT0Yo6DhE3fO+MRvcPmrw77yeKkP6du414lnRktouE4QwHk
         v3EJ7+8gfm3q2Ijvf6rPL0ULxJSz6cPxShFKcR2B//+rpQ6t+/qnNvKKSme61ZXrDV3+
         exKLFL3Axiw/5evjgRooib4DOKGvGkEJcYo3oQ5R2XbQL21VpjxZbAtOYPGaUN2U0O7B
         WVklTL404hwDf/HCqTKQMMXxHkp/b1LKN/wiKWbLKpvHlDA4Bc8hASFTGfjAB/YACroT
         c4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xhyv5obJO05pgLR8K6bKL4W/XWvPLVM9OMLPNej/i4s=;
        b=A0qPSxtkfzGXk21ymT86LSV+cQNjfFBPt9PaUhYwWq7T2lEQQWqHxYYaue/LCMpK8C
         dW8p0ZhfqH8p07LYXjER+ubRGQjxvTDGnLSq5o4RcuG7XyA4GK8WRV9N6PwpC5ygYTrx
         4Ka6Dm42wOj+M+prGYDdMr4u2VYRhL0I2/7wQH+5VGq7z9yJ/TJrd8DLVXpvZNY2PkaC
         THY6JPEyrH2dfIbgMwzoZAUHh9ffWU4JVI7MCtFrfPaOp34H9pJMtELMvAFC3VdVXuE7
         d1jY8O2hTl+z5Kd2HzCroYPv+lTYC7S1RAEpgjSJMx7Hno0FYnnKBf7BEL+bp9uefoNc
         yLIg==
X-Gm-Message-State: ANoB5pkRSrfwzXDO69i+/yI0alEGt3dJo9hfWmkmrED0K7O9XO4iy9Oe
	Gco+/EsPqekrDXtSitolotohVg==
X-Google-Smtp-Source: AA0mqf5OecpLenAlLa+W0DN996G16//de1xxTcSQAySGFZ/MZwJBK376I/ToiMFM/z60GTYZPXRoVQ==
X-Received: by 2002:a05:6512:3090:b0:4b4:f33e:8628 with SMTP id z16-20020a056512309000b004b4f33e8628mr15585253lfd.189.1670178825178;
        Sun, 04 Dec 2022 10:33:45 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w15-20020a056512098f00b004947984b385sm1835878lft.87.2022.12.04.10.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 10:33:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: sun8i: h3-beelink-x2: align HDMI CEC node names with dtschema
Date: Sun,  4 Dec 2022 19:33:41 +0100
Message-Id: <20221204183341.139946-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bindings expect "cec" for HDMI CEC node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

See also:
https://lore.kernel.org/all/20221204182908.138910-3-krzysztof.kozlowski@linaro.org/
---
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
index 27a0d51289dd..a6d38ecee141 100644
--- a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
+++ b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
@@ -57,7 +57,7 @@ aliases {
 		ethernet1 = &sdiowifi;
 	};
 
-	cec-gpio {
+	cec {
 		compatible = "cec-gpio";
 		cec-gpios = <&pio 0 14 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>; /* PA14 */
 		hdmi-phandle = <&hdmi>;
-- 
2.34.1

