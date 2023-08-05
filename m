Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A4B1FA0
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Aug 2023 18:05:46 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3176a439606so2544307f8f.3
        for <linux-sunxi@lists.linux.dev>; Sat, 05 Aug 2023 11:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691258745; x=1691863545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ui9mFi+8YpeTm0k09SoqGWMWxqwLX8g/SM0GMtVVuxo=;
        b=JXaio9I8DD4b5kA/e3J4i8BugFtaIhTeAsqI8YpbFje4l002vWoSJ8cMKU0hUZuEmx
         lJAOUXG/CbuqOiK9JDZTQ473fZqnNUUQRQZYrGhXaFfFddAtxYbXuvYdP4MUOkxQVpCG
         6k6GEhMUUMZw+XmGLr874mRvlbYTfED9V1LBPWg0EqkDvmmI9ce4MBY+N6pZa1lcQNdU
         tR4H3XCjWUe/PW7LQiz97Swp4uEEos7FS9Z7u18Zjm1kVlHGpx/tx/NPI5jN2g5bkxQz
         hbiHrAB7ihoLl3P2ybOtQlJLx4Ha62sof5/RxtfZL1sivlBqdiis7qyRd3rRo0eCwJD4
         gekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691258745; x=1691863545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ui9mFi+8YpeTm0k09SoqGWMWxqwLX8g/SM0GMtVVuxo=;
        b=L5mpoJfASZNHaPV/T+043GOH6IR+lrHtCsAqN6z/mG3qFA+674hQKaUalF0lqk/PRE
         YxPLjFr3l62L5dB/IU4F1l/VxbdaFoS3xtOut8aNooHuGa8zVmfULcK62oczQO+/iInA
         UXSdNyrOknTcPfem7YRfE7UJ1zJITXbsSNXsgA2Xsm8xcLpOpnfpH9zKQh6hlxUgp8ZP
         9MPChWWHooYX6z7rlY4RXJpkCKyMgZgCWFnnQQgux+oJzwKuzmHOhr95rId9F6d90GEA
         ZevH8TjsGn6h/DUNWYDid4uOlJHorj8XTqs10yxxsOlhZzlEuM0r6/iggW44C9xg2+tB
         ZF7g==
X-Gm-Message-State: AOJu0YyvTUVjzSCg3AdsbCPk/gx6QILqSMKqMVrDYmF7UzwehOwdxPfL
	1jaWWBul8Lig4X+RIFhDpK4=
X-Google-Smtp-Source: AGHT+IH52KbShgZ7/MyYYljmA/7meZEjQcL6qqHPDeWo7emmXLPpHbnsfG22wPwvuhUIyNpA/ptA7Q==
X-Received: by 2002:a5d:4b43:0:b0:317:5d3d:d37c with SMTP id w3-20020a5d4b43000000b003175d3dd37cmr2878909wrs.24.1691258744489;
        Sat, 05 Aug 2023 11:05:44 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id v4-20020a5d6104000000b003176aa612b1sm5710402wrt.38.2023.08.05.11.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 11:05:44 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Ripard <mripard@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 2/5] ASoC: dt-bindings: Add schema for "allwinner,sun20i-d1-codec-analog"
Date: Sat,  5 Aug 2023 21:05:02 +0300
Message-Id: <20230805180506.718364-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805180506.718364-1-bigunclemax@gmail.com>
References: <20230805180506.718364-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DT schema to describe the analog part of the Allwinner D1/T113s
internal audio codec.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../allwinner,sun20i-d1-codec-analog.yaml     | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml
new file mode 100644
index 000000000000..7586076b9bc5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/allwinner,sun20i-d1-codec-analog.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1 Analog Codec
+
+maintainers:
+  - Maksim Kiselev <bigunclemax@gmail.com>
+
+properties:
+  compatible:
+    const: allwinner,sun20i-d1-codec-analog
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    codec_analog: codec-analog@2030300 {
+        compatible = "allwinner,sun20i-d1-codec-analog";
+        reg = <0x02030300 0xd00>;
+    };
+
+...
+
-- 
2.39.2

