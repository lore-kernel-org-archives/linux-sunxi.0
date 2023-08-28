Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB08213FE2
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 18:19:55 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6bca5d6dcedso2748829a34.1
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 11:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693246794; x=1693851594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNjQa0r2Npipwfdo98mccTbPwuwzF8+vGZNgT6+2uoA=;
        b=NA5le+V6YCsxEftnFqS6PUNX/OrsrwmbCQ11ey6cnmVHoEE3leJIruC/5Izr5t6R4D
         uC08KZ4ra2qPziIP34MDi4L5igtxY3G5PuM4NWUwipVDhwpw1YRAcs5F9siwrXzYW4kO
         qXcwgCHSgZqSz5dIuTnyoW5kvzgtkq0FGnygT1etzIJO7EByvcup19IHj+VOg3GDNG2N
         NS4tBSs9/1k90RpWXYNyfD8ZoXMC6JNkU+8t8sbywmbrpJVNbSZ6GJ+7Ii51sJ8Fp6XS
         twUsIdH5p1ST3MoFeVMX08r/vKG7PK8KtBcoAkJTEvaCIPOAAB3w6LFKKks6jPOmrAyb
         0cHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693246794; x=1693851594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNjQa0r2Npipwfdo98mccTbPwuwzF8+vGZNgT6+2uoA=;
        b=YcWr8mT53OsXvgfsbxS19ADQ6yl3g2w5ngL6bH4e3NW7gN031Y3QKAyklUWq4zNN7O
         4rHAMuhObHb2k/pBi+4Ndrumcyui/fp0EQaOcK/XSLrnGfkrshAX+sIF9smKkIIQFF1j
         4tcnLdfm2JSLJastqxnbreADI5cfdU1RR88n/i1irQzHWjZSCQQGtqGQ08O8+ScGqLVF
         VZzTRHwKTimkuPeDVdVfBWAi4qTWtczkc9xE1sflzgOj66m5GKfKfXSEXXXdVPVpy/hl
         ztCMuzuh7EeIDeslAKuB5D99ljaMihC2+i3KHnczHnyoYh9wuKKaF2AKHbKsad6Ni1FB
         YunA==
X-Gm-Message-State: AOJu0YxQGCOaSnYKKSNPdCr1Y4msel65ExP8b2D2zn3QWhdLgAaBR9yY
	wCF7m/I5TcdPeSWu2wOtADAxLm33AannKA==
X-Google-Smtp-Source: AGHT+IFO1QSnKPjEMtfBoLr7XMMbpaDqNcnkoNr4zQSKvDAZ781dHhwbXiklVKcXQ5HSb7ifJKxTEQ==
X-Received: by 2002:a05:6830:3a0e:b0:6b9:52cb:3adf with SMTP id di14-20020a0568303a0e00b006b952cb3adfmr14505273otb.20.1693246794447;
        Mon, 28 Aug 2023 11:19:54 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id g10-20020a9d620a000000b006b99f66444bsm3695927otj.71.2023.08.28.11.19.53
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
Subject: [PATCH V4 4/8] dt-bindings: usb: Add V3s compatible string for EHCI
Date: Mon, 28 Aug 2023 13:19:37 -0500
Message-Id: <20230828181941.1609894-5-macroalpha82@gmail.com>
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
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index b956bb5fada7..f37191f21501 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -38,6 +38,7 @@ properties:
               - allwinner,sun8i-a83t-ehci
               - allwinner,sun8i-h3-ehci
               - allwinner,sun8i-r40-ehci
+              - allwinner,sun8i-v3s-ehci
               - allwinner,sun9i-a80-ehci
               - allwinner,sun20i-d1-ehci
               - aspeed,ast2400-ehci
-- 
2.34.1

