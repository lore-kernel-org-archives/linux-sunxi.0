Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC62E200A5
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 21:26:04 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3a81154c5f5so4025384b6e.1
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 14:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692825963; x=1693430763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ezW7pQUr4Uiv6KQK4SvVMlAXtgqHJoKutj6sBeDTJY=;
        b=jroPstqhY1FkAery+D4mAdGymhaVSAfUQUTqXyNfVeyohr+95rjStSPHWoqIU1bPd9
         B/6QJAFRJomVTn9mAM3VV9FfQZay0+bqXR3jf3VZVCbafSwuekcwaoifPyo1UKLg+406
         FJH6/jRlL4LHXi4H2nkP70tE6vFgFnGD/Kb5g8unYFWN/yoH9SXX3BIkf0OGrk/4n8q4
         c6JQv2C2OyKIo8rzmy5yeUpgKo4if2QJ/Bv3kRL3VtXTv0MYIN171UYqMLwfGSEuRO31
         g4kZrrjiUJPryngOoJG5aRiwrU3meFF+jhexgN6jOirT+huZrTR/MjvJpPcCZXXvjDIm
         RzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692825963; x=1693430763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ezW7pQUr4Uiv6KQK4SvVMlAXtgqHJoKutj6sBeDTJY=;
        b=gCNsFJDktEX+n7jdziSZTWSVsMdrGl8jy2BkiAcAmzSAUzTpeHxKpMUNA6MH/Cdpze
         aIiPE/TO9I9pVYn+LI17MwVZAftPqNjE45Yka9p6X61fy1jURRDtOi13gJVRFBl92YkF
         ZJ6cRHtjC1dNjkfw9sJw6qCIqAOUkgiA+cmO/0az3R9454hJR3W6qXjecsHqPtDF/Q5X
         KtHR+hqR/CM30d69q5UIT/b/9d+OgnsfcJOWYoQxzSvDDb3cPisjyQwxZDPGyI3ibFxu
         rFPwY2xmenlo1WhlFKXrV74Sa7vD8KTvq/voTU2q8bi/UIvSN2Pessms8oezggDDjXlQ
         978A==
X-Gm-Message-State: AOJu0YwWROc2zgPyxEwLXrALJfDmayHsMlSzSE2vbD+4JAQq1JzSXays
	pFeBmTttKXuu8W+JsZv2s7Rr3bwPJhiPSQ==
X-Google-Smtp-Source: AGHT+IGcozbrx2EX1k9iSgPczInukFMXvcIaT6ZxtUZVedRrdqSvuw3I9QTxXsiPO7Bq/ll1+5Nxlg==
X-Received: by 2002:a05:6808:8c8:b0:3a8:84a9:2440 with SMTP id k8-20020a05680808c800b003a884a92440mr1931954oij.25.1692825963253;
        Wed, 23 Aug 2023 14:26:03 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id d26-20020a05680808fa00b003a1d29f0549sm771127oic.15.2023.08.23.14.26.02
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
Subject: [PATCH V3 2/8] dt-bindings: display: panel: mipi-dbi-spi: add Saef SF-TC154B
Date: Wed, 23 Aug 2023 16:25:48 -0500
Message-Id: <20230823212554.378403-3-macroalpha82@gmail.com>
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

The Saef SF-TC154B is a 1.54 inch 240x240 square panel with a MIPI DBI
compatible interface. The panel is used on the Anbernic RG-Nano
handheld gaming device.

The initialization of the panel requires a firmware binary which can
be made with the mipi-dbi-cmd[1] tool. The command sequence needed
can be found in both source[2] and binary form[3].

[1]: https://github.com/notro/panel-mipi-dbi
[2]: https://github.com/macromorgan/panel-mipi-dbi-firmware/raw/main/saef%2Csftc154b.txt
[3]: https://github.com/macromorgan/panel-mipi-dbi-firmware/raw/main/saef%2Csftc154b.bin

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
index 2f0238b770eb..04cc5bfce051 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
@@ -66,6 +66,7 @@ properties:
   compatible:
     items:
       - enum:
+          - saef,sftc154b
           - sainsmart18
           - shineworld,lh133k
       - const: panel-mipi-dbi-spi
-- 
2.34.1

