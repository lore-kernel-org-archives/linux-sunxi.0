Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26D5200A4
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 21:26:03 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a850f07fadso3048760b6e.2
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 14:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692825962; x=1693430762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4T+nedyKV39uMXbBu+mfzPEhqpgVEZ6od6RS1A1F/g=;
        b=l37Mr0YCIkO+taC5fzntK1Wc2g5XkZDPIyDxCk3AGz7vUYtAsgvsIO+UCnKr20nJuT
         Pb4ZSk19Rs5vIPktjHBECn2uyLdppL5tp7gGJjTkhV7G9CtsYXIrqo8Ot96Vwx7WK9v5
         okfYUbO5ZBsSD91WCFlNPxU+relyvaM768C/eDSlHiGj5OTasot6g8Nm5uPfKBasNpms
         wwTEE/eR3lBTUZoBbj89Vm6oeehK9VqLLY3+fkVT6IDTFt+x+v3Obtixj7EaixMA62Uv
         Y5iSkXPuIe+wVEoPnLBHe3NmMa7y8kIXexBErUl7SXd7NXHEx4DB5Vc3c/SWzU9sfcXe
         HlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692825962; x=1693430762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4T+nedyKV39uMXbBu+mfzPEhqpgVEZ6od6RS1A1F/g=;
        b=gklcguNX24v9kDk+Aj3VY9uAI7y0kFyPDoqz+qBvtty8kXngn0WJd06wmDIKseg/n7
         L6M0eQuamWPgJmt9riv/Idlq5u69sjzC87Se2Zfm99Zz9fxitpn+SC6EN4qOr5MPimKS
         NUMfAhPmsm9bANiKXZb4anlIBzJk47Iul9q/VB9rpTlNENNDQU+qzuXKn6bV0IHv1TA0
         mpQnGOzY7cgR8KDQ/KFSef8KUQEDDr3s09QdqFKCQCtgwQVqefHuEKinIP5ZxdpStHcm
         51MBk1I6fe+3/P9FceSZFty0vk9s62vIAZ+H1e6PnIyj3z0nIPAKWKEMkEPy7/Fi55Kw
         Dfsw==
X-Gm-Message-State: AOJu0Yw2xqJxOIwghjxLBW9EgSLVl0wgL6C8+4jUvtUgHwfH6n+hZNdD
	WbPDrpnscl2qHVTZKfpw5AObU4ZFnHG5Jw==
X-Google-Smtp-Source: AGHT+IGZVd1pnjk28+Kjchg1BoTxizV6CJnH3+9xSigjOHPE8gFkfFvb0aiotjWzodLt4nP+ktkqZQ==
X-Received: by 2002:a05:6808:138b:b0:3a8:5133:483b with SMTP id c11-20020a056808138b00b003a85133483bmr15513983oiw.31.1692825962541;
        Wed, 23 Aug 2023 14:26:02 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id d26-20020a05680808fa00b003a1d29f0549sm771127oic.15.2023.08.23.14.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 14:26:02 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	jagan@edgeble.ai,
	heiko@sntech.de,
	uwu@icenowy.me,
	andre.przywara@arm.com,
	daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	neil.armstrong@linaro.org,
	noralf@tronnes.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 1/8] dt-bindings: vendor-prefixes: document Saef Technology
Date: Wed, 23 Aug 2023 16:25:47 -0500
Message-Id: <20230823212554.378403-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230823212554.378403-1-macroalpha82@gmail.com>
References: <20230823212554.378403-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Document Saef Technology (https://www.saefdisplay.com/).

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index af60bf1a6664..dda90f9d264b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1151,6 +1151,8 @@ patternProperties:
     description: Shenzhen Roofull Technology Co, Ltd
   "^roseapplepi,.*":
     description: RoseapplePi.org
+  "^saef,.*":
+    description: Saef Technology Limited
   "^samsung,.*":
     description: Samsung Semiconductor
   "^samtec,.*":
-- 
2.34.1

