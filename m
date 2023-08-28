Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5363913FEF
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 18:19:56 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6bd0c953fd9so2377091a34.3
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 11:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693246795; x=1693851595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykR3sHre1Eir9GQLICxXH5WvC6+F9PzKSZWpeKVoRqc=;
        b=ZbJv7PE2AETfhGRQXK7dtdptnFRNUve9rMalZ6weVEa8FDeRTALC/XwXycTxhkt1EU
         jMWnJMUiiFPC4YVgDu7nZ3nqtVBzeiY13gr4io6pElNcnxnVUil4CRSEjYlhhZ0qZb3z
         0V0daMCv4EwSkTSaARi4PURxG09xudj6GneoGrSCVtm0BzBvqXlFnPLvG/R/cOTQmefN
         iDnuizbm5rmbVURiuQWSiBdAn9AnNz6JHqZMduTabqMsmA3RtAeZAo6zdBuJaBQOBrV0
         DDYhjkeT7RhvWTtrCUysyY65YdQBBX2TFU1ODB3qWSABgWmr27TKA13SGi2xpFRyxigd
         HD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693246795; x=1693851595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykR3sHre1Eir9GQLICxXH5WvC6+F9PzKSZWpeKVoRqc=;
        b=Y+UL3hW74qX1nnXBv+ClhRw1CuNZe0jVq3/+C2Ra+fbyXoE8H7ueNqyhyh/yD+5EGo
         dChxPk/HjqXNYbc+uHCQ1G9czmvUygNKNh8GDEC9581ROtWc91GiO41tEaF0KwxkTvRd
         ZOwpL8wdAa5BYBCqNqzDnIOwx9U6gl9tob4e7guPtTxidHabh4rj5wIE9mly1FGdX0pm
         d1u8hBDXpeS0llmdsALxCrT1GojXv/Y2kOX7kz2nO526rMtoW7w7yWNjtiMl4gy0wJN0
         QpxbTLL3sKp2xzVh1h340VJ0YxgJTRwDsu520SGSNrOEYmE3y2BX/9aflTkaINb1pOqG
         l1Zw==
X-Gm-Message-State: AOJu0Yxc07jlwNLFZnkx6XscqFTuYq6CCCAKsxXH+sM0DMV+lRLts+2G
	XOsk6LTtW0aSMVXhInphIKVwtUNjdij/7g==
X-Google-Smtp-Source: AGHT+IEqBjO52CBgxxPbfFieM84XReP6ihrN7rgx5Zp+Sa/l5vtvkWzkwtV2V+OA1E2uJgBo1Ycyfw==
X-Received: by 2002:a9d:7a43:0:b0:6b9:5b75:969 with SMTP id z3-20020a9d7a43000000b006b95b750969mr13082033otm.11.1693246795106;
        Mon, 28 Aug 2023 11:19:55 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id g10-20020a9d620a000000b006b99f66444bsm3695927otj.71.2023.08.28.11.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 11:19:54 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V4 5/8] dt-bindings: usb: Add V3s compatible string for OHCI
Date: Mon, 28 Aug 2023 13:19:38 -0500
Message-Id: <20230828181941.1609894-6-macroalpha82@gmail.com>
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

The Allwinner V3s uses a generic EHCI and OHCI for USB host
communication and the MUSB controller for OTG mode. Add compatible
strings for the EHCI node.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index be268e23ca79..b9576015736b 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -25,6 +25,7 @@ properties:
               - allwinner,sun8i-a83t-ohci
               - allwinner,sun8i-h3-ohci
               - allwinner,sun8i-r40-ohci
+              - allwinner,sun8i-v3s-ohci
               - allwinner,sun9i-a80-ohci
               - allwinner,sun20i-d1-ohci
               - brcm,bcm3384-ohci
-- 
2.34.1

