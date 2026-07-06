Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E3142CAE8
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330357; cv=none; b=Q16DNWJJAWAOVNGdU/lywp0ytiBg1gzGQKxcfJ60Zwd65xNrNxRSWZ2oYagcRGOAfA0jP3Zuipf2rMj/ZJMmfhPxxFo6d9mMQzyWiSs4ZBD6OCAYdbBA4qMEbqn9NH86Xo/Yg4R0AYp5ff8hLEprXfPW24WnwFelOS6LdftYFU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330357; c=relaxed/simple;
	bh=VpJLeb7R+RpyY7+P235xUJB/0jBrtTAMjnXON1p0t+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NiTIBTMUEXkG6aKkVpqQ6hFK2H4tj0C/Y2vqEy6sDhuRdGbH86RmJTvAcGE6xP6A8EbJRPgfrD4Vo5Zw4TRFKUH+1jtCboj+Iej6Rqy6BbgMnczxg4LEDLbdHqFM2OVOtsXg14P7lOo5aMZ790KWZ71AFp9xSvXDreb34620jmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IcKtCFuG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IcKtCFuG"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b786d6c0so14463785e9.2
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 02:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330351; x=1783935151; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3hHX/9zYrzbmJ0iQPJgL0hb11g//ykE1wbt55IUi/E=;
        b=IcKtCFuGxxgXJTjpqozRSxhu3jqMJcyVBr7jkso7SYx+okr3YJEuTrx3pGAi8s+Yef
         7PLvMjbnvPqS5YhJvhzvbARMhK+uYBeFYcNYiYhLjcfI0jZ92ySoSVlnuMzABM59SXEn
         nDnG2i2qgEZokLmCthn8n/Y4Q2GtuNi26SlXLI33iRk5RlflHQjaWAqY8y5dC2wg5Qxc
         WBDw3RRlGcBmrw3ZgCk6NcVUD53JyGWN/i4Z/dWChn0TJzCXqT5iCBqPgt/iR4mN3Kb8
         kMz4r2AjZtb7eA/yrTFYE0wi4TdVU1gxPVIIYw9mYupsLMkr1zXOEzd8SxLV7N9hiiHj
         eRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330351; x=1783935151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S3hHX/9zYrzbmJ0iQPJgL0hb11g//ykE1wbt55IUi/E=;
        b=V5qMUK0EbIwIrID78cGoF6f2dlD+RMHuOHdKNM/bYZV+FGMVtIy+EDLYNVEoFnfRlv
         PfjUZXhahKT2lT3UWreFf+wwrqhGcUrj3jNZMYU/96/Zx4V4iMNwnu+A02zN82DnK2W2
         hcfJHG66BC3yzhlNQ/Hb2Y3IMcTit0earsxjr+jlOJTak2b6LIQgsJCezGYw4F/Wfw2/
         pBGgR5RPGAkWqpY5dH6SeKHV9cHW3D94Y9B/bpQ1qiIq1K+ZtEHNzPW7+clQlJxAOXZg
         Z0qz89/6uUElAqTzsUh3uke0zOXv72xe7KFjZazo8xj1lSUcyBcxIpRpr6zwDIUbmoBH
         qOhA==
X-Forwarded-Encrypted: i=1; AHgh+RqRVDRFFGBP+OB5i1ASJA7cNakKdJNLIYvFVQO+L8YlkeP+MI7f/meiqI/s6VzfU19scHrsHMd8ABmWQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOvTfmr7J60SRYNw/vqzduJvx9SiL/LdRI964JzuLQffgX8IG1
	muQcQLipox/vafj0DLmmpgjajdRYm+xthfGJZmXlgmg1WOy+ysdeu2Z4zL8r+07LGkI=
X-Gm-Gg: AfdE7cm7J9F3okCoTgrF0PVXd+4o8QxBzfnrw41gY0Hc4O1NXz+aQo2sDUQTpbfkvR+
	3q2CPL5t609tjdcRYVIF8VzfhVuItFqqVS3rtLXUQ1u0oDRp/0QUq+fUn+t68bPN+xKB30BMKqi
	fV0Hg8KeMh3rb4uC5OhRkXzcC3sECT1eGzbfUpB+M7FhPUGCfCeiyPnKoGkhb12QqDOafzeCoQf
	YiLYwpNrW9O2W0ILTZfZ5CuYiBfhbzkZH6GDoCYHPrNq5Qijodt1PMgV/i4aJ0Q+6E33L3ZcUkU
	Kmw6x9RCPjNyuN3XnnDku+NEpuOQ6aR6fxqtwkijmYEoVH+pxlngvW6xdKfmAKrqLaIv6Ptr2rN
	bYtaL8WY2TGSCfyXiEixCzWJ8jKJsm4CTwQqUI3FiXokNtG0z/aUTF7oXAfifXpSJH9I9DOgIqJ
	MVnZ7GfPtK0+U=
X-Received: by 2002:a05:600c:5489:b0:493:bacb:1341 with SMTP id 5b1f17b1804b1-493d36ff89emr92048885e9.4.1783330350698;
        Mon, 06 Jul 2026 02:32:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493ccdabda3sm274734015e9.5.2026.07.06.02.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:10 +0200
Subject: [PATCH v4 2/9] dt-bindings: rtc: sun6i: add sun60i-a733 support
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-2-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=VpJLeb7R+RpyY7+P235xUJB/0jBrtTAMjnXON1p0t+I=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YhNvBcU+zfPLvtdyLov7LJ7ChlSqdXKOljM
 f4B8XMKRMSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2IQAKCRDm/A8cN/La
 hWYsEACIFKlVSVDxBi/xG8qljHYAcE+Vzkna4KsPA4H3Ghi9EhylEM/gfbNWGsdllumwZ0XfWsh
 G1Ym4aKkaadVriafjEMoEu1YTpCn5Lvm61eurZlkuWSbnw9cN+Ri40dA/MYxE2Na+MtQuDDJS+A
 GHRMZTGV+jxAUV2S+XCKaW/76TBfA4Bynhj5n5CM3fAsMdFUnlNoDc9btLmhXwyeVdGw/Caklfd
 MA1rVBuk9zkXDvmCXQbADSU6FGUj6qKNiLhgh0EpdU7xEaYq+fX/sTDHikjVAALxinGgs9qBT/q
 gtpMiD9mEiny6oclVQrLq0aS6dO34I2pt6Jsei8og6PyOqr0UMS3eKG8qtdx9FDk2ELORkR3kZB
 MJeXEqf0t1Xvt0fm3mYn57mhkkx5YhG3ZHmNQCTPGhL0Dt74Xoj/L/KcLZlVdhjyBLDBpz24GAj
 Mh50U4K5jDu6b38CSuWTm5V/kZ+p4OOU8X/PYg7pPhiK/Gp5j2YDo+DgAggzypTL2au/IJqYKAH
 rSioah1LQmbn2/aWV92ExcoKRLb6iwg87taBJ1keRyHKUVROjuCrElscmB51xVYZ/v9ahWWKEFn
 jI0YS8JdTMWVsvanDYbcg4BhEJPk+IlAMltPsgbQ4TmGcYzACxhMNZZ/UBZ2l180d4q+lWJLIWW
 PfbSdXBZmeKO0KQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add a new rtc compatible for the sun60i-a733 SoC and new IDs for the
peripheral oscillator clock gates of this SoC.

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 1 +
 include/dt-bindings/clock/sun6i-rtc.h                              | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 959a012c626f..f2b91186ed37 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -33,6 +33,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-rtc
               - allwinner,sun55i-a523-rtc
+              - allwinner,sun60i-a733-rtc
           - const: allwinner,sun50i-r329-rtc
 
   reg:
diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/clock/sun6i-rtc.h
index 3bd3aa3d57ce..5132a393ca4b 100644
--- a/include/dt-bindings/clock/sun6i-rtc.h
+++ b/include/dt-bindings/clock/sun6i-rtc.h
@@ -6,5 +6,9 @@
 #define CLK_OSC32K		0
 #define CLK_OSC32K_FANOUT	1
 #define CLK_IOSC		2
+#define CLK_HOSC_UFS		8
+#define CLK_HOSC_HDMI		9
+#define CLK_HOSC_SERDES0	10
+#define CLK_HOSC_SERDES1	11
 
 #endif /* _DT_BINDINGS_CLK_SUN6I_RTC_H_ */

-- 
2.47.3

