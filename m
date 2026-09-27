Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A437F002
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 15:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521920; cv=none; b=iY7LnHy9PR4PMomNx+xrv1OfLQLEHim/WAHAXQL2ErPCDcDkseGiVkRMwYAEsVn9l7g3J7Rc8DVHKiyahG0RHDUEYBsnB+GyRChK8kdnVNemZ5Lw6ZAtpiQVXo6p4c2JiaXcmX4sjGcf9LlYJmFb9o+F1SOBz2SHOx+8upSnU/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521920; c=relaxed/simple;
	bh=Ai/Pt6iwST/hPrf66UHaVA/fpcI2B9b/ey70FIEcV90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqn9z162JvnpjcVJVDc+u/znQprOd0hbVRCZB7uayGb+wYFZfTDuC3ievkMnY2LnjpVSR8tcwVZC8hS5y8c9Dqd+rUew9LsOtvc1ueqN2hcZC1koEA/FZrUn7S1Bi3JdUlrbBLDpPkAhw5Gps49AQmxgJFxR8iuws5ozbL6ovks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKUZrSCP; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKUZrSCP"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so1217802f8f.3
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 08:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521918; x=1791126718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKsiUf1zswQ5v01inYZcqNF5S6iWN3Iz43ERd6nymQA=;
        b=EKUZrSCPw+BBrtlEIrffA0GcdOlrFkQeDRJCJroqY5KAt/wmXqZdHeAusJavVxu1gZ
         ITHBU85zo5xUPRzYgx7wxAYjx5q466AIGT1LFeT2FSBPGQoBfo2+DG+pG31iQPtUMsEM
         6xHUO6VChTZxZXDprNr/HcJtyIFKnmg34uHLktnOzU87LaN7X0uzXenoqN46aXmNPpdh
         mVWkGd7rZQsEBP9pXjpT7VewUyrQcNytqioso0gSKXJFChcl+EEnbYi9X9Y+D4vzJgxp
         aNbBT3qKYffp0xkonBsbQXPdDX4bAECglNYZcjUmgoCt06nMtH2pf9X9lEQw/9oNpMgl
         jLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521918; x=1791126718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lKsiUf1zswQ5v01inYZcqNF5S6iWN3Iz43ERd6nymQA=;
        b=q/jVFOmlT/3hPP3QXaG5nAYOH8qHQZK3cKSML1WWeByXulNfr8589X0SlMWhZ9M2e4
         5O6/7sWEl+ow+0+dj0CfhDMh50iRre3/Bt243ShSLeCaGWlVv+0cz0kquJyiScKezokN
         Cprh7pNEnGoefL/bfxzpWxo08t/UmP9AC0RP7XwYEXbaT4D2i8bhQTsvIGHnFERxiiYO
         LvznyafQVLQLIHw0QwoXVW76bJmC+FBbFG1Mf4I9p6xK21Ic77eVYWxLkZiXPa18wK3f
         pP9eY1Srg5jIiq6SDRafrXn6RZ1wFVpKiZm1F5wMGW3QJZQZzRJImyxe9cehPYAyp8wt
         fp0A==
X-Forwarded-Encrypted: i=1; AKwUvBzqAOJZDH8YO13pVrPCy4T5CctnX/CLJKeth4hiJQgFh9T/HKBpzdQ8aIod01q1PsRhGlpUw7SnXZP2jg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLRDwE/8ejFORseoiFIIFlGR1tvUj5znGZujIZBadmT99WJ0QzX
	Z4oTo8WWObtcKI2t9XDZ+mHeu4VvASQmjKxPmThaU69apgJRjHPwlRzj
X-Gm-Gg: AYBFou0YX1faikhEDH+w7pVEQC/IQrRw0fBTYXRkzBwHXm7b7Tmi7MT0tlMkE8aCFRa
	Eu7mJuKVgfEkwDhz/HNStXWJrvxNu03JB64mmkradU518N+z5IMNJPf4wpegPX4fQq1BrazLc10
	YSpJum4Kp11INTWndNnKbxCpEIdlU19DW/IWx5KVL4dBnQVC/CgIT4dsDsI8s3lEj3UQZgFl7P9
	8gXlhxueM2Axcwp0b9qgWWuj+hBHEqHJJI70IH3/kHkDTbhECRW0XoajgrWQ8UvFpcWMAYrmTQ1
	mqbfAAS224HJlEi2gli688wJr3+uN06A5CbYua4GmExtt3Qd+42dVA3VJV+5UOPbP9w+sXzvm6v
	6Bd8u9ieqBg6BobZKJu880LveAnEXivqnymcJT6y3SjTHMrD8MFDWxeHmIoQfw5ytbP+S69nKnQ
	S7CKGN0OkClpxUyo32JTf1PuxEui8ZXISYQS6uSx4NGtdWecpmQ/Z6f3hjZ40vxyFfUz3uZQ7+2
	UJV2ag8VW79FTcWVzS/CWd0AG5uZjUx
X-Received: by 2002:a05:6000:288e:b0:488:820b:7e24 with SMTP id ffacd0b85a97d-488820b7fedmr12875064f8f.28.1790521917582;
        Sun, 27 Sep 2026 08:11:57 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:11:56 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
Date: Sun, 27 Sep 2026 16:10:08 +0100
Message-ID: <20260927151016.186493-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 driver takes its mux values from the DT, so allwinner,pinmux
becomes an allowed property here, required for this compatible only.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 45b7a0b6c626..6fe3b6410734 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -39,6 +39,7 @@ properties:
       - allwinner,sun8i-a33-pinctrl
       - allwinner,sun8i-a83t-pinctrl
       - allwinner,sun8i-a83t-r-pinctrl
+      - allwinner,sun8i-b288-pinctrl
       - allwinner,sun8i-h3-pinctrl
       - allwinner,sun8i-h3-r-pinctrl
       - allwinner,sun8i-r40-pinctrl
@@ -120,6 +121,15 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [10, 20, 30, 40]
 
+      allwinner,pinmux:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Pinmux selector value, for each pin. Only used by SoCs whose
+          driver takes the mux values from the DT instead of an in-driver
+          table. Almost every time this value is the same for all pins, so
+          any array shorter than the number of pins will repeat the last
+          value, to allow just specifying a single cell, for all cells.
+
     required:
       - pins
       - function
@@ -144,6 +154,19 @@ allOf:
   # warnings.
 
   - $ref: pinctrl.yaml#
+
+  # The B288 driver has no in-driver pin table, so the mux values have to
+  # come from the DT.
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun8i-b288-pinctrl
+
+    then:
+      patternProperties:
+        "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z0-9][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$":
+          required:
+            - allwinner,pinmux
   - if:
       not:
         properties:
-- 
2.53.0

