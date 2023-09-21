Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3091CB670
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Sep 2023 13:51:44 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6bf038b8f87so1100252a34.1
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Sep 2023 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695304304; x=1695909104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGhQthT64pdSxzZ5aTBXuH64J4biaW8ztdfRr2G2cDM=;
        b=gZaMAGtYD8VCq0CFSw/yhW2jMxYvr0LqIOPLy7O+NbnCDLjMFW1yfu9Y/StUm8GT+M
         c3ZJFuCVB0XyT9uKtVhFhMG/eHfgTWFAcGnhmbWqlUJoNg9TEIx3iKhEl0FJVKJFG+7Z
         DrIaqpIDUxpfSOqc86oIIGUPDN05AeDaqbE0ZBiMEcUM/lHQSaV3VRlmabrWy3iiG8aq
         zAhN0ayOWZ2YQ+UFFu05UPEhs7nJgVGrZykQzPt8SqQwC9ObsaZJ1kMFs09iZqw7PFb3
         hYuLe3wkCjwmxwnfPteGt8XF/8suETx01QFgVzzRUANxOmVEy38qXDJkgCrPalz+7Zww
         7MfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695304304; x=1695909104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGhQthT64pdSxzZ5aTBXuH64J4biaW8ztdfRr2G2cDM=;
        b=HjUW0sgwxFqoZ8JGqY+4xmtQvS4pLhQnxBYLi0AbLlSq/p/QrHyFXJeVNAAIJkec8x
         WUFn+PDFO8Zo7Z+E7EK3MHFkLJW1vdI5XHgiwJAu4lOH43oWXMO661k4DjgloTTHEc2f
         7gCaVZ/hob7bSNAmpKIxMm8/frfSfCtFmErPPZdJ4EsGY6kdwyC7GoRBw9Q6BiIC8iS6
         YQNM82vTkxd7HISVAbNngxwWSfn/e3IAqpLq2k8h/uvL1+WhlHcgy61xYKrAnqJaMuVV
         IB1P7Ej69B2nFi9SvxyeGPw8Yf0gR7I3JF7tiufPZl86XDzIVCE3o1jQA+YqrG3TPvrX
         zj+g==
X-Gm-Message-State: AOJu0Yy2/HxaX0uQ+CPjP5QkQmJlcJ0N/9CLWFlPSsLu6Tk/zaO+uK5F
	2Rhb4MllBjR9hhP1zoG2uehPc+Nz8PI=
X-Google-Smtp-Source: AGHT+IFQVVG38WqZPkPmlbr3yI27dO0u1qCiqzelHFDwYcdOfrEBXKSAnbit25UR1O5vmrNYQEj09w==
X-Received: by 2002:a05:6871:282:b0:1bf:42a8:2cd2 with SMTP id i2-20020a056871028200b001bf42a82cd2mr5550149oae.25.1695304303940;
        Thu, 21 Sep 2023 06:51:43 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id z19-20020a056870e15300b001d7034bc222sm547064oaa.15.2023.09.21.06.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 06:51:43 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	uwu@icenowy.me,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	andre.przywara@arm.com,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V5 3/4] dt-bindings: arm: sunxi: add Anbernic RG-Nano
Date: Thu, 21 Sep 2023 08:51:35 -0500
Message-Id: <20230921135136.97491-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921135136.97491-1-macroalpha82@gmail.com>
References: <20230921135136.97491-1-macroalpha82@gmail.com>
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
index e4dd678f4212..1929a0a475fd 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -51,6 +51,11 @@ properties:
           - const: allwinner,parrot
           - const: allwinner,sun8i-a33
 
+      - description: Anbernic RG-Nano
+        items:
+          - const: anbernic,rg-nano
+          - const: allwinner,sun8i-v3s
+
       - description: Amarula A64 Relic
         items:
           - const: amarula,a64-relic
-- 
2.34.1

