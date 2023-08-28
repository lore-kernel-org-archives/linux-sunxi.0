Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A8E13FE2
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 18:19:58 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6bf038b8f87so977235a34.1
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 11:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693246797; x=1693851597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmejmVLGdABaT+qnw1yy9ms9gFGtTk5UP1kBkDFPK+I=;
        b=fN0+XEoUcxo6HhIr0v3hSF9U16fbOpsf+AvcRSObrikfvotysW7S9QHHZh6qnTEvKM
         TWTz+GHSBPRuZtPXJn4uC3SmyfOsv+J2S8QZd4p0XXVzZBh8Vh3KMj8kQN6cHIlMDKNI
         FPCGhMUXuRCJ0Jn2zkSn0aReyHzzJD2BGtPcaHQ3ZmHQGeQAuJ7X8itpgmjQJv5ZQ7R2
         VSsTAgZ1sUs7zO5q1hpinFNtaAUaFqGsL7OZuIts4A5evdel/5OOFEzO0R4nuRWmc0is
         g/Z9cZnSLJGAoVn/gwx0Id2/JZIYw6UtP2dViXYchWZfVJBsubRlctZJlaYyWYLw55GZ
         R9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693246797; x=1693851597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmejmVLGdABaT+qnw1yy9ms9gFGtTk5UP1kBkDFPK+I=;
        b=kplYpm0h7g+MX4THzw4M4RHIiPL8PRzCU9L6T+Zev5QnF6pmxDxMdbbd+gzjS38lRN
         dhu611Ifvv6P9nY+AyrOpPkoaieLUja7pN8wlkfO4Yyf83D5RbQyDMva8UJGxkszhixM
         rPatqfM8FSB0W8m2FwKNPZLZtk/LVkGgxqfhomcdrLYNxTq4cm/JyMhPwiw7ryJi0V6a
         oexE6JxaR9FLO6PWj9nGuJULm0e0yQ7EWQB3nZTEgc9JDku1qyNvbGbodk6VdbsPU3KC
         yqUclV2UrlwTNg3zGt3GbpKITr1iVXyGpNLt6iTlEYBx+9QuKTR/Rp30gGbdtPAio3Xk
         cpnw==
X-Gm-Message-State: AOJu0YxhAvHQa5ZGm+x/kSkecuOWkHxypZ+ALp/LhzoNCV4ZCvMed4a3
	3GL7O+op9hwMjGRYf7cntQJMrMBqikmIgg==
X-Google-Smtp-Source: AGHT+IHZVfqX60HVmqLYDm013Pz6rMYt9eBaSJnEHMtaesWXTOLIKXakQFw9Tg7osMCKdrtmbNiJZg==
X-Received: by 2002:a05:6870:d348:b0:1b7:629b:de06 with SMTP id h8-20020a056870d34800b001b7629bde06mr265979oag.20.1693246796617;
        Mon, 28 Aug 2023 11:19:56 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id g10-20020a9d620a000000b006b99f66444bsm3695927otj.71.2023.08.28.11.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 11:19:56 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	airlied@gmail.com,
	andre.przywara@arm.com,
	conor+dt@kernel.org,
	daniel@ffwll.ch,
	heiko@sntech.de,
	jagan@edgeble.ai,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	noralf@tronnes.org,
	robh+dt@kernel.org,
	sam@ravnborg.org,
	samuel@sholland.org,
	uwu@icenowy.me,
	wens@csie.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V4 7/8] dt-bindings: arm: sunxi: add Anbernic RG-Nano
Date: Mon, 28 Aug 2023 13:19:40 -0500
Message-Id: <20230828181941.1609894-8-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230828181941.1609894-1-macroalpha82@gmail.com>
References: <20230828181941.1609894-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The Anbernic RG-Nano is a portable handheld console from Anbernic which
uses the Allwinner V3s SoC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index ee8fdd2da869..806f25b561d9 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -56,6 +56,11 @@ properties:
           - const: amarula,a64-relic
           - const: allwinner,sun50i-a64
 
+      - description: Anbernic RG-Nano
+        items:
+          - const: anbernic,rg-nano
+          - const: allwinner,sun8i-v3s
+
       - description: Auxtek T003 A10s HDMI TV Stick
         items:
           - const: allwinner,auxtek-t003
-- 
2.34.1

