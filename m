Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEF22AB55
	for <linux-sunxi@lists.linux.dev>; Tue, 20 Jun 2023 20:00:41 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6b58788fc67so1738700a34.3
        for <linux-sunxi@lists.linux.dev>; Tue, 20 Jun 2023 13:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687291240; x=1689883240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiGy8htbAr2gbvV9bKxQ7HkyWZeBBF9Zy4H9doqhIUA=;
        b=KE71jmYGReSlpMy/QUYSVhc1c3geVKPJHLVtlb5KofZXNCJN1/mxOSatc9yOH44Ml7
         eQ5w0vaBhMnPPKlzuhnup5LYdzwghiS8VjJm1P9L62a1/Kqg8O5bGf0QdIzzT0GAphc0
         JqtZG6a9MLO3ALNJOIyTkFI8mf/wKP1oIcAq7ioX3793fyvluGCqaFjLD3Nzbrg3PHua
         GDFsXS9DozGS1L38tCJ7Nhtd9tR9wAAYx1QmVUJoS9bdB5QqgR8xoF6oD2STKJIwFeWW
         ezU+X9OVPu1ERHM33CxaU7dvQe+Hanqw7Oe8g4lDT/M9aVn4kig418DC9VhBhSPu6cmw
         KUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687291240; x=1689883240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiGy8htbAr2gbvV9bKxQ7HkyWZeBBF9Zy4H9doqhIUA=;
        b=eqdVrNlSrRTDKKJeo2xp1uABM8Z6GYLgE7yOsTXtYL9oFfXq9hAqKLztOJ9bmy37Nf
         qEN51g6Wh2QS9eD4p8KKFAHDXmXReRhTsJDDsNDDvlVqS8UzF6ZvmCRFwzot+TfWP+RO
         vjE+4/pvRH7D8Gclbz3uc9d0uzKVDhm1MVdDCFOPfr9WdOjuwEmM7sx1nbzTxSkT0bf8
         etwHyuPBkD3c+sBYx2wfaTWHol/46IV0MwH1UKtfl7G0YGr9bKPf7XrzaFZXaM9EnF7k
         iLCYYmkmJxgt+9lLtpN0Omu3IzMUJe/XCdDBKUc0tpMP+palkzYJ66wB6b0JPfev1y6A
         Pjfw==
X-Gm-Message-State: AC+VfDxRvuU0M7mOfJ0/42+5Rfo4Yy61WTM8SJvED7gnlYwdDQ4Oo6Ji
	JcnnRzdSRTvZiPcmjChW8rq5D9Z80Nw=
X-Google-Smtp-Source: ACHHUZ7sctlnFdmPLmfHbHVEND1asgL6TfdnosFvx0yf+/if0KXSUnXDWR8CsK4u+l+rgOcOivrZ7g==
X-Received: by 2002:a05:6359:d30:b0:12a:a36:3de9 with SMTP id gp48-20020a0563590d3000b0012a0a363de9mr4862537rwb.13.1687291239892;
        Tue, 20 Jun 2023 13:00:39 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id y201-20020a81a1d2000000b00569eb609458sm664197ywg.81.2023.06.20.13.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 13:00:39 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	uwu@icenowy.me,
	andre.przywara@arm.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/3] dt-binding: arm: sunxi: add Anbernic RG-Nano
Date: Tue, 20 Jun 2023 15:00:21 -0500
Message-Id: <20230620200022.295674-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620200022.295674-1-macroalpha82@gmail.com>
References: <20230620200022.295674-1-macroalpha82@gmail.com>
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

Add the board to the list of known board strings.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 013821f4a7b8..a886f8390857 100644
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

