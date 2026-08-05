Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380C1476CDF
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Aug 2026 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938019; cv=none; b=uzQjQRPiAzIzJZRrXjXC93CMf5VblEgIRlP7Zl1PTvXTXHULtgLRgqa26LJX78Y8wAc2LmF2K4hqhbZVD8kAfGlUm2I8AJt6KJ/dVByJ4qMer56vg1SAiWJCcKIyBdkT84yy4QxgTkcFZ1VAVyh+lIkUPImJht/TSNnwfLjm4Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938019; c=relaxed/simple;
	bh=tjeFziad/u/dJ8yWqijM0VUOkYWgyCYz1BsP1SGqSnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c6GJUS9d5PXRbl3+GzqtwbXEi+GE71Hj87lGfMMWCOuAVGLCB66DaVGtxb7UlUH4wBFRsdqb4bw8/p27ALi9nOJJvDi1k5LujHMX5kPccEJc0AGL/Ftx0YfChirmChweogOrMVo2ZjzaT5GLvdcHAvSGn4sE2B3u1zZEKN6qf7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kFLiXIBt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kFLiXIBt"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954aff6088so10698155e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Aug 2026 06:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785938014; x=1786542814; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W+FtOkXSTFNOnduj3n3KSEKK3xwTvAgLSzJMwQ5j5vA=;
        b=kFLiXIBtseZ9VqKeC7Y02pLuSb66Hg6eB9R6N87wFGEg0Y51Efzk2nbJFr69JcNoWr
         fjz5aXPoKnzkbXTESspeW6VXdcN0bYaZokzCjjMYopowK7zqvdSfqkb1ncjo37ddptq6
         mPia+ISGirsrSLWGmVla2JHCF4KbelY6Alebc4xKGMSHQqQGNXuUnW3XJYNG9Tcy2Zdh
         nB29dioHFk5K7bxpFy3yH3RSyl/rgMaPWUCmIL14bKcyW85Sq23WCbnHHl5zcKjGrzcw
         BFR5WBwhGIhJ9vH61e3u/eRJ0FOL92liMFwivJ2Ms3igkkVsnK/oXBbYZkAeZ106d/oA
         9Dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785938014; x=1786542814;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W+FtOkXSTFNOnduj3n3KSEKK3xwTvAgLSzJMwQ5j5vA=;
        b=WuBRZHmBjqtevf8vptwLxA3pVf7Ey6PPKaUTD4gvsaTH4dZo455wYlx/Ugm34tA+jS
         Mvri62SSCj3QuQg2iKixWxikl8uGq8vqiaAY+DI4zOvFQ7iChCmjT9RbuaNJnPXl3g1G
         DjNCLkugBaUBljfDeFenNDw0TWCn3Okwnlf3KacOyK16BGQyUIkR/FFRI83P+QG/V9YN
         EdxzeqowB/YIgLM6ZMrItmNDW/zWWX3kigF0Ja0NU9vDqfw7M9bllPHXTwq6DaIBnjox
         Phmo5K0eSrKlXSL9DDuVPaCNHR6IwJVrojY5tE4eWeQcFz9lVwyGTEjw+qwLIiKiyBW7
         U6pw==
X-Forwarded-Encrypted: i=1; AHgh+RqNTC29lgvaeS6o5eWbleVtB3S2TGXLodtfIKW+NlmrrPboPA5dgNILeVMzoHuZR6uMwxnbX3SHHRNIag==@lists.linux.dev
X-Gm-Message-State: AOJu0YylT2aTuz25Il/pOlzvrTW/ggU2YZ+se6zfSgOByJHOfqhaEd4W
	LGoDvLD+Ujrm0LI7EAVVggz8vdlveO9mkh5dVZ8Y40FYKVBlEwdwbSG7fxKeXSJ1g//T93kwazU
	aE2LVI5j31A==
X-Gm-Gg: AR+sD10JMNXCzVlV9SmCdxHubqCZqJZwJRop4MJVGCzKXlPdtGgmNwytA43j1cCozJB
	8CgS56ssFY+5RirQUREKqzuzhyaPz+pe5y0vxFVkMuEit7Y5b5GCUdqTarSDPSZQe3tBBDJFpt0
	KdrS0bFyNeZZy0U7FJenxw+9a31U0od7n0t20diX6YmTarJLizeDZLgGYPC1XLIwBn1jWXE7xFW
	FGrjSEtHVclVe8bayzP6RcchvXFibwcVXZxxqq2fwMosv2wWUwu8jg4raZ0iXN5UUu79BL8M1Mx
	AIKUHJR25Mx0w7sMHMp19gGmb9odsn+ifyjepnK4xDbsSbXY/A4/KXOdo08Ovi7qqORno+0XOR/
	HCEzicux6dPtMlhJU+6jxT6D0NWNhNEZ59LEg65Nt/mksIw7k918C1d5APKd991e+SKsgzamL0+
	eXTdjGCM09FL+Y+bOcm4a2qcfoCysdxc59HRaBT6s2hA2hKvqOb8RHKw0paRU=
X-Received: by 2002:a05:600c:1991:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-4994e7448d9mr86632895e9.2.1785938014491;
        Wed, 05 Aug 2026 06:53:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b779:ffeb:9b9b:3a9b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49949fcb0c5sm159237985e9.4.2026.08.05.06.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:53:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 05 Aug 2026 15:53:26 +0200
Subject: [PATCH] spi: dt-bindings: sun6i: Add compatibles for A733's SPI
 controllers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-allwinner-a733-spi-support-v1-1-7bfd1141ebc9@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAFVAc2oC/yXMQQ6CQAwAwK+Qnm1S2SDqVwyHslatIcumBSUh/
 N1Vj3OZFVxMxeFcrWDyUtcxFex3FcQHp7ugXouhpvpAR2qQh+GtKYkhtyGgZ0Wfcx5tQgnEJ47
 UtBygBNnkpssvv3R/+9w/JU7fEbbtA4Ss/Np+AAAA
X-Change-ID: 20260805-allwinner-a733-spi-support-e30a9ac057a3
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=tjeFziad/u/dJ8yWqijM0VUOkYWgyCYz1BsP1SGqSnQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqc0BbXNtMYSp16a3Hz5iAvHlZOspwok4eoydFh
 URQ8+kp5z6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCanNAWwAKCRDm/A8cN/La
 hSnHD/9bg4eJC/YmvFzaaazakPMmXy47hHzZTMg8/pNF4kPFEnlvM9fslRS0ZwyjuRtEbXsaB69
 wVGH4/Jv9q0Yi3S2CsCLjgoPpVpNuD+cAk0FG4tC1EKhUyNQ1FYRPQGsT83ZvKeQU4Ex2La07Yz
 /NfEwieKVxTMURRYa2m6EcCAY8NSUfvpXI8ha+RhOiiCyFe6Yjf+IEIicp7UVTu9XCAnoSMeCQ2
 nBBCsShgom54uci+PwscGsy0D4024hWtAhMbRMLR/bUbLjuF5XCnFXByOQ3w+gcl2y+7EXU8uww
 AJfKY4FjoAroPWc+mjtVfDfVzMOCNhgNGz46AEg0fHyGf5ovPYN/tO4yheAsQymjj+Dn17I6UeR
 fV6p9r8eWz1/w3YdeQkpjX0jwkMvdH6RIsoi9VZmW5t+xdb1avkA6OZiMg5JDBdLa8RKTuBUju1
 lnzq4gt+yuYMAgqgLzvxaqFTM65nGlk8a5tDuqR0lWIPOoHi4CukQVK5yKDXXpQs8AvInYlJ0WD
 fWYlKQkWeqlyNihvdD6CALUD0nS+dQwpy6kqkEOxzsVtFD3M/PBM9C4ZVJM4aCf09KLdjj8pl+6
 PSzYzxo7OdBJHYyDXWdb1yddEjF9y60nSF8OdxNxvEaplgnryawqp7Ub9myQdCSAembuM5VKCg9
 1T5laTUca2aNlTQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The A733 has six SPI controllers with the same IP as the A523.
Like the A523, one of them (spi1) also supports DBI mode.

Add SoC specific compatible strings, falling back to the A523 ones.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index 6af4ff233158..be47c6e00409 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -36,6 +36,13 @@ properties:
       - items:
           - const: allwinner,sun55i-a523-spi-dbi
           - const: allwinner,sun55i-a523-spi
+      - items:
+          - const: allwinner,sun60i-a733-spi
+          - const: allwinner,sun55i-a523-spi
+      - items:
+          - const: allwinner,sun60i-a733-spi-dbi
+          - const: allwinner,sun55i-a523-spi-dbi
+          - const: allwinner,sun55i-a523-spi
 
   reg:
     maxItems: 1

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260805-allwinner-a733-spi-support-e30a9ac057a3

Best regards,
--  
Jerome

