Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9156D13FE2
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 18:19:53 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6bd04558784so2755839a34.3
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 11:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693246792; x=1693851592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWvCZrp4/FEw0GDbjcUcDY3MsF5cq9comcRM6woTDxA=;
        b=erlZaRZMK8kEcD4c/XLvuMvgTKIPYYFL+n/1SqEWAGJnsOYnXL/DqNpiatZwPD307W
         7YTzeKrfzLxa1hqP48dciKlwQOUBl6fYCj0mdRRSBZlwT8Rhw48807os4Y9YJFane4Rw
         JEPqHeNoe1qtfmCc3MZ+Vuo9cULaXM0dJLM1AG5QkWE3vkl+EycjH/w7TNBZNBszt4JX
         6gONvq88MQtVWJ7P3FvZx6AV11LEhqNFQdsCnmdIO3hpKuZX2zjyTihKHA13BIkPSAkP
         CSiTHQBv6uel/nSkytWLeOmoVb0bATbATrymyq5dgysJp5AP6DBRESzaqyPGWsKkHf4F
         EncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693246792; x=1693851592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWvCZrp4/FEw0GDbjcUcDY3MsF5cq9comcRM6woTDxA=;
        b=jV03ii50S8t9vDi+x3JpTwk2NAZInsT+FQ/kFo5Mv9EMQVJT8aONSFN9S1I3HPk1pf
         bXo5W79BBehvYNR7K6nGL9aHUm68j8cthLMwVbUfrdqhHNmBkbthUUHb4i3n+0m9f0Bm
         HBN1TPGY2OdGKNwUdE0q82kjHGbmaSbGxIuzi6BaJ+/uUsqNJai1XOQXfDs0RQgo0p4R
         zbEoJBcNujQmP0QHrKNPjfJjnWVbVHeyg1zTvbrl5fMeGBL9EjdYWhKQ7u6ozilf9XTW
         FSb6Uumq122cW9UeZpukLx0zWGm7dQRHMbmucozbTH6+u7UH06ddTPYr3Uwe7ATgKk8n
         4zmg==
X-Gm-Message-State: AOJu0YzEASblCUa5c8UBjPsfDP20XWkSjUlCaT1SINxhG05vC82KVv1o
	2Fm4U5AVktHt42B/2irTS+9T4lg0oc+xgA==
X-Google-Smtp-Source: AGHT+IFc+T2hlIrbwkSb4/jXdZGl1BxD5Z2RCXyWxdCKLRzfTd3kDk41JEc8GpmLp2f/pEQ7eD9lew==
X-Received: by 2002:a05:6830:1e05:b0:6bb:1020:5303 with SMTP id s5-20020a0568301e0500b006bb10205303mr14843284otr.16.1693246792376;
        Mon, 28 Aug 2023 11:19:52 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id g10-20020a9d620a000000b006b99f66444bsm3695927otj.71.2023.08.28.11.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 11:19:52 -0700 (PDT)
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
Subject: [PATCH V4 1/8] dt-bindings: vendor-prefixes: document Saef Technology
Date: Mon, 28 Aug 2023 13:19:34 -0500
Message-Id: <20230828181941.1609894-2-macroalpha82@gmail.com>
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

Document Saef Technology (https://www.saefdisplay.com/).

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

