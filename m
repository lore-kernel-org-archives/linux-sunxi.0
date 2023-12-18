Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E57D199B5
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNN74e+A"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9fa2714e828so334207566b.1
        for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 03:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702897591; x=1703502391; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8/JnmQCAMS2cYksRjeaCp4G2NnTSXTyff3BziFBU7s=;
        b=RNN74e+Aa1jq3Pb6BUv4hS5pT91aplz98iGwtUXsR/no38N9rhPRWoU/IkCPFud2Is
         7mBK4H8JRj5K9M4GqarEhuFTmD8Dm0KtRmzydF2pYjcpgfmXAcMzPRrRwhn0R+FYO13d
         ypiAoND/0vCxtIptfg4Zs1IAFTfbEwS3unPzDiXAc7rD6xeYLt24+UDfnUmjXEtk52ap
         Ts5m+yjai4+XkoandQ7JYl7lcJlz+Zj1cJOu+qBem7XtLOBR2Jja7lel3QgocUHPxDjQ
         3Jc0ZRMjczdZ9eBeO6Gbc8ZGBY23WuKUjn+ZLWGu4IUhdU0vR8k9GufBADTL58yfggSy
         jZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702897591; x=1703502391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8/JnmQCAMS2cYksRjeaCp4G2NnTSXTyff3BziFBU7s=;
        b=w6r+Z8BuP787tyUgVOueNin8DT6x2DwhRbvGk7DACT5FAMf6w4WDzm77mT4OjTdPSM
         h708SZ/Zug4rex5xd0hfV3ZDuWiTwu/BQ1rm6/E5jJ5pzhoTbV4SKNqUVITKT6W9Lhnd
         eyeNjarcL2mWQ6/FJyFpEY3g0Ymr3sLzm7hHnysIZdaegGSP7TSco0J1msnyiD/yVcxO
         sDEDGYiLQ+i0CQxlB8aQsazaU0d9eG/jHPl08swQRMmdrqVtWPKkTJZIoAaB68zF1XJV
         v9ax3p2YyB5h5N0c0hi7s1PqD/vt+e6YyEM2fGE2FMYLFuNpVH6Wuv/rSQyf/8jd2tI5
         iOoA==
X-Gm-Message-State: AOJu0YysKf3Gfu4F1H7USPojQVbsL2noMMGxm0QWMw5jNyvA7jTPDPmz
	h1jVME7h5SbKTLYIAKQSWDs=
X-Google-Smtp-Source: AGHT+IFf3fTdcqRMdf1nMW9QU6h5ioPHWtIwlndls7xDU+7sKH62DkfHYo+TKGbOTDX/dltHActCzw==
X-Received: by 2002:a17:906:fd86:b0:a23:26e4:862a with SMTP id xa6-20020a170906fd8600b00a2326e4862amr2021405ejb.88.1702897591591;
        Mon, 18 Dec 2023 03:06:31 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.164])
        by smtp.gmail.com with ESMTPSA id pj4-20020a170906d78400b00a2353af1f7bsm1406769ejb.92.2023.12.18.03.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 03:06:31 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH v2 2/5] dt-bindings: opp: sun50i: Add binding for D1 CPUs
Date: Mon, 18 Dec 2023 12:05:40 +0100
Message-Id: <20231218110543.64044-3-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231218110543.64044-1-fusibrandon13@gmail.com>
References: <20231218110543.64044-1-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for D1 CPU OPPs.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
index 51f62c3ae..fddaa3216 100644
--- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
+++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
@@ -23,7 +23,9 @@ allOf:
 
 properties:
   compatible:
-    const: allwinner,sun50i-h6-operating-points
+    enum:
+      - allwinner,sun50i-h6-operating-points
+      - allwinner,sun20i-d1-operating-points
 
   nvmem-cells:
     description: |
-- 
2.30.2

