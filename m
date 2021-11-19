Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317FA2C86
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Nov 2021 19:15:14 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id b1so47396395lfs.13
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Nov 2021 11:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iD461cMCR3D8128ew9tBkbAfCtFZzMKZMMxb7s46+RU=;
        b=gTjpKdaYWkhNkovaew5KGcNpMaISQDibEo6/XSTeggSsuFuF4TALOGgFjYA08qftUx
         EQF4+9DrPyA5iSQymFEC0JRO+4QdcCNy2j3roDH5P8fp6w38V2F6ax/9GuUO1I0Mc8Fr
         jcWdgVtkZGxXhckJ7lS/q7ceObBZOVWbrbq2/NFVaIsnzoIFXqsosTEEWyk550fMlTZy
         AB3krfKlw/tURAzP0fLf0v/IuOIFctX9KsWuOGWPoAFq6sGMxl7h26787JyLoN07cBwS
         PzuLFHaUEBExq272OIA6viFLsW3GapunK87eXUBsKxJ2WFjKTAflNPQJoAYQ8Mqc6+No
         ihvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iD461cMCR3D8128ew9tBkbAfCtFZzMKZMMxb7s46+RU=;
        b=k3Sry8K9doE5b8pKKyBXZwRCd5XG2V52TWWyyqLHX13/0PT5r6Yq0IFN1P6paTlRMZ
         5ydoBQLfGnZwoRHCTWeqzjhyw8rkLj/3XRg0C6VxSE/myGSJX1rurmekaWKX6kF/fsvU
         ZUb40+Os5C6wSKHXxxdPPj23V7YuUgx4hGoxPrB/2WGnjWw51/dRXrWoBLgiy+OSHJYU
         a4N158aSStibew6nEWeK4IKQoJKD0uzc5pkXGdkqF8CniXxwZy8jSmM8E3lm4lzl7NWC
         1D/iObKsU72GjJTR7uveoX4+6XhEK6zVFMcnStGK+jyUG2LUrYGqT0BPbp8IA1CsZUyP
         d3cg==
X-Gm-Message-State: AOAM530Ml9jzXCQc+W3Ja/lk4J0d2BDXtkj1KkOeEZ16asu2Z11GuTer
	G5IwTIz3CLYSJNLskE94CEQ3xw==
X-Google-Smtp-Source: ABdhPJxzHbyZ1+gjb1fbFkVsotlhbZUWvYxneo2G6p3Uka26R9gliZ8WhF6Uwus5kxwjh1rV5IBXVQ==
X-Received: by 2002:a19:ad0d:: with SMTP id t13mr35570063lfc.161.1637349313159;
        Fri, 19 Nov 2021 11:15:13 -0800 (PST)
Received: from boger-laptop.lan (81.5.99.121.dhcp.mipt-telecom.ru. [81.5.99.121])
        by smtp.gmail.com with ESMTPSA id d4sm67676lfg.153.2021.11.19.11.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 11:15:12 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@lists.linux.dev,
	Maxime Ripard <mripard@kernel.org>
Cc: Evgeny Boger <boger@wirenboard.com>,
	Lee Jones <lee.jones@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] dt-bindings: iio: adc: new compatible for Allwinner R40 RTP controller
Date: Fri, 19 Nov 2021 22:14:55 +0300
Message-Id: <20211119191456.510435-3-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119191456.510435-1-boger@wirenboard.com>
References: <20211119191456.510435-1-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R40 SoC has touchscreen controller also serving as general-purpose ADC.
The hardware is very similar to A31, except that R40 has separate
calibrated thermal sensor IP, so temperature sensing channel in RTP is
not documented and is not to be used.

Signed-off-by: Evgeny Boger <boger@wirenboard.com>
---
 .../devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml b/Documentation/devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml
index f591332fc462..6214477465b8 100644
--- a/Documentation/devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml
+++ b/Documentation/devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml
@@ -19,6 +19,7 @@ properties:
       - allwinner,sun4i-a10-ts
       - allwinner,sun5i-a13-ts
       - allwinner,sun6i-a31-ts
+      - allwinner,sun8i-r40-ts
 
   reg:
     maxItems: 1
-- 
2.25.1

