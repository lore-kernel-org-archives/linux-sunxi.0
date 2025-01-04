Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984E5149C7B
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Jan 2025 07:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735976446; cv=none; b=icKQFaCDU+Fo9ZcRq4WRoZevM6p57UpliqO1thjSRtpN8r/n3VWD5GluMnlxJma5YqrvOX3VhXdHuLy7cG6m+qS5QVhdmao3NkauHkQKwcD2hXRcOe1ZF7pdGjVR0T0l4fWhCFW6xRKjN4JeabFfbWFh65jdfiOSrT6Qoj4rDgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735976446; c=relaxed/simple;
	bh=RfLscubGTBY69+mRUuhbjHJSwn0LVQ7XlGs0ZPQCMek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nI/9DouNYV8F+BzfI7l38M47ILgrDWeD/jRjrqBdmNdYFaSh1145T8IdmIwc4RqyuAwcwWae2fX/aXYaLeKMJCjNV8wtZ59VOTWRIT743Qf75jFP1hvrDeCEPJ761YmuuGiQX99HbIyr9aqgkGej/6PKdHOR6kZTFrEmc2Z55SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoTdS2wy; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoTdS2wy"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2167141dfa1so177661975ad.1
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Jan 2025 23:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735976444; x=1736581244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0utCftucvwNjjKL9gp7cLeehqJP0aygJTF/mR/QXhE=;
        b=PoTdS2wysbooD2/FuKNfS44heLk/lJ/1xA59sQMo4YXFcXTLPdSd6UdFvkrLDUcCQa
         mmVjIkm8ksPdKS23BqF/zBIpOwZuj4SZGEf5NCzD1KqAV9o+nbc08xCl6IlWwbGxvzRR
         z3c4YfaIy9QQrdso+K2ELwEdeB8TNnRt7G/TLP+0U4duaWJ0gDjKZnKnFiqU58WnX04F
         sFvz3bXZwsBVWngrvF8RB70a3rUfuF2z/nQf5Jez/acuw28wUgAqqEFnrMsMQV/ls3p4
         4E6KTVurqgguMJmjFf0bR95zdoXv99Ozr7a2ejKY5JBnjPsk5qba9PYdzupEESgrO4RH
         BGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976444; x=1736581244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0utCftucvwNjjKL9gp7cLeehqJP0aygJTF/mR/QXhE=;
        b=bNO0OtuTcjXNL/nj4RvPG/gtE+BaO5mhNvorUfKi8oqBsgXMv1nli57O7GhhCUnL2Y
         aN5N+CazEUbgTfpNQr71Muf4013oIoewbUToN6t7yBhhgKsslFdjkz/djN0uiHU9exA/
         8Kuds/zkHVxedmIxkAl5wtywx3VWgTmt5WWxFXrF4byNYzTQIDnqpGes+RsOUcOhAm/Z
         hBZaWmUBaIHouqiKGCB4HTCflXFkd5OElKuUff5j1vCqlay/12yCcChSgU8oUkFoMt/m
         m/D8ibBH0x9HWQhOAgOk7ThEj6+ouiF3LJQlRdlvvCbVrhACTeailbz6YTfs1J2lP4BN
         GL9w==
X-Forwarded-Encrypted: i=1; AJvYcCU8x4mmXyLoveaIWMLDEYohm5WcYgV5JzkHMm6p9z9sFMeUhNlqv7ZLb3RJzSI+P3xz6QMUtmBiXSDb9A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2O4bH1ecrhqLpfW9xaoX8Z7EwFpycP3XXZB8E/0aoQ35BZTDl
	6OKF0N0sG3MoE5qyvF608zaFFQCUJEX4so3Kr/s/z1VmeXwNh0UDhv7y2USN
X-Gm-Gg: ASbGncsgMU6Rlo6uE4AmRb6fzwgOVqj3YsQjJxqu2Sg792k0CLVGPhUPMGWMNe6i665
	f2e9QFGf4+eBkC8eSOAFQHgY/CyreRXvLSMMuILjfen/PgdN7BLMzOt2y3ITOPJMek5HgxBbydj
	GkrXgVBgpWIeq5M1pwcOxOmZU06p3d7OK/Eqo4OeA0IMQu2Us6I8dcSwVmpTYz7kJbBSgKiPBcu
	HsXQBi8x9Su8nKe5Q/ODHFMIUDY9weXaDvath6ezgPoXN159Q==
X-Google-Smtp-Source: AGHT+IG16aEsUt31gOxPdEHIOiEhly+PPdwAHUbVPWapyCabc4BBxAcFCsLxS2WeCaHdQrCno+H+/g==
X-Received: by 2002:a17:902:c408:b0:215:758c:52e8 with SMTP id d9443c01a7336-219e6cd83eamr662739295ad.12.1735976443882;
        Fri, 03 Jan 2025 23:40:43 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b34sm256562565ad.252.2025.01.03.23.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 23:40:43 -0800 (PST)
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
Subject: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
Date: Fri,  3 Jan 2025 23:36:57 -0800
Message-ID: <20250104074035.1611136-2-anarsoul@gmail.com>
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

Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
select TCON0 clock parent in dts

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 include/dt-bindings/clock/sun50i-a64-ccu.h | 2 ++
 1 file changed, 2 insertions(+)

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

