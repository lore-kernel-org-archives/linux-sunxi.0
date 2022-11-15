Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411952597
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 09:07:12 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id n17so5081649pgh.9
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 01:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTYdVIALUl9YpoP++eVlpJmeUKMRDCw8t5UXvIltjl4=;
        b=Zemr7C/GHx/NegieoNzHXBrXKSnkhmJEj85qj90eZoGg1EssVm3kU0vKtctNXmWkqB
         mKEQVjkdNTTJM+g/b6pIhoDQq1xy9HwDrzjGkKR8QLfNY3c1Q+ZYt48oYdQcclJKy3Wq
         uNE9mfi6sI10qu+bdYAZvbKKgMnOH8GL1duU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTYdVIALUl9YpoP++eVlpJmeUKMRDCw8t5UXvIltjl4=;
        b=lVHl4/vKklTrAJfNZw3l4GBGHyCs24eI3lQwuYU84zSjnmuotQePEJRzoR0LrUbGMp
         cYV9GeqHSAt+9/pSw4UFpCRyhee6VyTX8hqh4tWvkEVEudf19ZI6BqrE35/Z62ByEQZh
         Ot9vY1YyqcfsLfqPCj7//lhdNO6o6y2whgJUaEnkPOE/+s5NapfAY6hsXZPfVZImpXDm
         OFXZ3GAqhTxy7HXz6b9qCWM7MTbkh2ybLsYPvANXq6t40LrUK5tAfwQVTjSSngdBDRPD
         kz37gcPcsMLRBMv/0Eh0pCWa0oePXrHBBdugaHKL9UC9PHUzbmR+BHlJZKMjEAKaorvZ
         V6KQ==
X-Gm-Message-State: ANoB5pn1EzKNqsvAujEZd97ys+iL5Ds2YYv63KT02OmCuJ+MvX4+IsFR
	af75k6+K2OW6KYQfTx2GDveC3g==
X-Google-Smtp-Source: AA0mqf4maw/zOnFAm6mK7X2FkowQqKj5X0F+diwR9KPfh1t3egiDv/bNjxyvC1awklk5juosr0kv7g==
X-Received: by 2002:a62:648a:0:b0:561:ada0:69d7 with SMTP id y132-20020a62648a000000b00561ada069d7mr17616150pfb.9.1668503231802;
        Tue, 15 Nov 2022 01:07:11 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4d49:6d15:b250:5977])
        by smtp.gmail.com with ESMTPSA id q16-20020a17090311d000b00182a9c27acfsm3378830plh.227.2022.11.15.01.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 01:07:11 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: dt-bindings: allwinner: h6-vpu-g2: Add IOMMU reference property
Date: Tue, 15 Nov 2022 17:06:43 +0800
Message-Id: <20221115090644.3602573-2-wenst@chromium.org>
X-Mailer: git-send-email 2.38.1.493.g58b659f92b-goog
In-Reply-To: <20221115090644.3602573-1-wenst@chromium.org>
References: <20221115090644.3602573-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Hantro G2 video decoder block sits behind an IOMMU. The device tree
binding needs a property to reference it. Without a reference for the
implementation to properly configure the IOMMU, it will fault and cause
the video decoder to fail.

Add an "iommus" property for referring to the IOMMU port. The master ID
in the example is taken from the IOMMU fault error message on Linux,
and the number seems to match the order in the user manual's IOMMU
diagram.

Fixes: fd6be12716c4 ("media: dt-bindings: allwinner: document H6 Hantro G2 binding")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/media/allwinner,sun50i-h6-vpu-g2.yaml           | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
index 24d7bf21499e..9d44236f2deb 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
@@ -36,6 +36,9 @@ properties:
   resets:
     maxItems: 1
 
+  iommus:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -43,6 +46,7 @@ required:
   - clocks
   - clock-names
   - resets
+  - iommus
 
 additionalProperties: false
 
@@ -59,6 +63,7 @@ examples:
         clocks = <&ccu CLK_BUS_VP9>, <&ccu CLK_VP9>;
         clock-names = "bus", "mod";
         resets = <&ccu RST_BUS_VP9>;
+        iommus = <&iommu 5>;
     };
 
 ...
-- 
2.38.1.493.g58b659f92b-goog

