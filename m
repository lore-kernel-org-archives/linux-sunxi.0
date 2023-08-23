Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C7D200A9
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 21:26:05 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3a88e1a5286so134293b6e.3
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 14:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692825965; x=1693430765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PsnfB6igmvyfdO874DjSX4Ed+SZpuHTROoxrDZZ1WTU=;
        b=mtyq3Tr5JuVhF2NGnGE3GgbIMP0hi09mfv5fTqjet3vk4ouy2DFHTILWF++F8C5FIW
         GmFiAQLUT9n9qyozHZNZnwWtykPniXz0eupSTUQAS7ixRafibiU7+oC97tYDzh4ekrBQ
         vyvEr0HE5tY8cYJ3sZWKJOTkpOs/bi/x8cFUrbQWOHr+dMOGsnK+U1ISSAC5huvkeO8p
         JHOtcWrwz7gC1W37gk5ZI055nvehXmj0QrC31SJIVLGUMzp7b7UlRi1Z0eMWsyEm0XsE
         4W9Xe8TvoTjt9IeK99p4ZAwtv5UTqrF2RFzk1g3o20mGeex7b0CrkNvwNBZRGdiKcnHl
         cLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692825965; x=1693430765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PsnfB6igmvyfdO874DjSX4Ed+SZpuHTROoxrDZZ1WTU=;
        b=FIEU08oBjga6O7eLIkkYEUNSHTxe3eFiN1o7MEuBe74HpvPP9dv5Hgzx1ROrgRPwzY
         r5UvPLjYyFNpmam5qGdf2bpXMjHyBUwYNu/fD+UZv3DSa8ZEpG/KUVdpKBqhyjMGcRSk
         hLRcUoQMp9OmWFjze/HRd2wih7jQ9Z2rJ6116HdCKj19cMsVIgchNZ49txQL5XzfM8mO
         E4+P8P/DJWqVkWDc/DG/OMK5o1zn1sYUZK5W8FvkJwMrGiy7/mMCM9d70M58ub2EoIUy
         SaDCHAGPCzx21WbmpHrK1Inx53+bJzA3/Z+cL/hnrbbsj8RRUWB3jdBjIeMQnj59CJBH
         EC1w==
X-Gm-Message-State: AOJu0Yw/ZQCZwOsnYKxQqfMcJGOsi03tcICWUXLBqzeYtV9RYKKFiH4r
	lTVXxPKFhLPBoqL4BnNiPNUBSzPquZYKLA==
X-Google-Smtp-Source: AGHT+IHHbeCzCfqeEkofU4A2PRzYKfZNQvQiEpNoNmmQaEX8uUW2G6tE5V/nWzoJlZDBmgDWdrF8yw==
X-Received: by 2002:a05:6808:1822:b0:3a0:3773:f294 with SMTP id bh34-20020a056808182200b003a03773f294mr21653465oib.8.1692825964773;
        Wed, 23 Aug 2023 14:26:04 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id d26-20020a05680808fa00b003a1d29f0549sm771127oic.15.2023.08.23.14.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 14:26:04 -0700 (PDT)
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
Subject: [PATCH V3 4/8] dt-bindings: usb: Add V3s compatible string for EHCI
Date: Wed, 23 Aug 2023 16:25:50 -0500
Message-Id: <20230823212554.378403-5-macroalpha82@gmail.com>
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

The Allwinner V3s uses a generic EHCI and OHCI for USB host
communication and the MUSB controller for OTG mode. Add compatible
strings for the EHCI node.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
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

