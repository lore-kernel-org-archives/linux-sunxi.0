Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169734E50C6
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Oct 2026 20:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232103; cv=none; b=JC/q6D8EeGS2ay1dwm4ZMg7Gm9KlT5Ki8crLSSoSKhI0KMNw4cUjw6IO24agnR6jU5wRfDObJvMiCDk7mJ7lnX0fxljGcyW59FxJZhDPEVARI0nSJ1igO/2dyavxCaqx1KEveKrMZnaY91DOpBaofsa15aB+aVj/RIrvVzYTf4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232103; c=relaxed/simple;
	bh=KOfinKpMQsa5zSbyZ5FVh9P3doA6BZAOXn+lKRg+jbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dx59k5DHXFgpaXBa9CMJcQSuF+VCaQBXZNOftMxUqVlWL0kndTg7MEMQNMOaiL/fPGcNxKKs37A1VOMmfi2CcWqZqXqM9KWm4T/OZyuf6CFalUYcVbLxkbBCowC8tW3b2+6bcz2OsNU4XVlXfmZyGmdp4jzBD072BW5HiM7e3wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGYBZUDI; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGYBZUDI"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6ad186afdf4so3904827a12.0
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Oct 2026 13:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232087; x=1791836887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=MGYBZUDIgOIRjyQvU6yd7KqBwpLtBuhslf8nxQd/Ak2UR2gU9rd3q9FPvsDVskV0pS
         YTi6vic8Q8TmIAn7AY/5o5D9x9skv+rJtD7DFlx99QOpdREjuQ1vCvEA1h733fhwa3oF
         +2kNI99YZ46Wc72CULC4LmDrla92gW2N280p9bV2FLbCyRDNA3KdXHKongy+8t32hdQ4
         EQcq0Bql6HH0Xc3GD4PNz2Pkaqi2Xz0XeCQd2RkENoNZef13NWhhboRbyZbxS/73rgx7
         iornVjaYGrDjG7jlz7AilQukKmyxDWvUL1GF+x2XW/kpMR1RX4tA7nrj+RYtumA9IsGU
         SxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232087; x=1791836887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=CDtn+LRhDSOR10wcax3Q/4kZ+RzrG4Ya3u6hdjTstYzrH7CZd6KhQNHsjJid4OK2FJ
         U+5TbkG/x2FNMvpT+4HBrPAFmvW5sTMxDa70P5/HRJUFxv5+hFd3hgM3FVjPeQfLHd5z
         XtvG4kAI0P4xFxuUC4XZR+dFWq0rKwKpr1lwBd+wQlzXLX3CEF5Ut64bexQh0pbmm85+
         GvhErbvZketzJRtF0vN3SctOkx2KLW/2XHNtNLSu+fDU/jbeqcYCaLwgOsAsjIVCD/i0
         Ips5adYgE5qJkV8zhFiqsaD9TFHfcDL7nCKHsOVFOTLwICCmSCe6mT6tT303StuNY6Xx
         RYiw==
X-Forwarded-Encrypted: i=1; AKwUvBzR4CAeVaX/NPMnNRUnvISSIzqc9PEzV1/VTnaBJtEW90Ilna6w9AKqKpOmDfxzXYwnJSpuxuKoE+A7aA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKi/i15oZO85c6SDB1B61LrSRgW+rSMabQRf8dlQnEZDlm5SusO
	yNanrRgbSoN68ssj0F7f2eMMTVkHzdNH4ECERxrKe6cGH7VJZmDo2TdN
X-Gm-Gg: AYBFou00mVnQhxO+HnQhVNr3Y2OAg0xnJozDSc3Q5rJxoKNtBqJ1XPOqDDzjdn7ZoeZ
	0/5b31bKmIIneBbSgNaGi3m6I1vILk/QG3cUdwuB3o4iqOYOzfAUEU1LzpXcK6Q6wHBQCFmAcxh
	QP0hHaD4O+8G93xEogmNO+y+TMTPTivos8V58SJdbjqAsFGkL+Ed0vzQX6gwW48QvAQHpPg6M2c
	7L3LJBrNe9l8VyVB2+P0UgX5IH2qJypBpnjXouaUP16/O0aKa4VSDIFVIRbHNhIrFfp5+/ImKt5
	HjRWDev4pW5mUNQKsWFQRWPeGZgapZ/90KPauhJsY38EzfMar44UMBncce0O6VSKeQsL4nKkW9Y
	9FDfmm4DesS4+c396KGzZpkUVxo+AKXsA01/qnJWfC8Fhgu5WXZjdhCCc3XIJeEdJZjQ15lyWZv
	MsRE3XaYWVgAkAg114xldef0KaMPKf8XIdItMG18VU5lPkLG0aDQkXecFypDjpbwS3E0/atg2DD
	RhUhYonXmJXKypyCNrLdHdqA0bmcm8doA==
X-Received: by 2002:a05:6402:320a:b0:6a9:ae86:bb1b with SMTP id 4fb4d7f45d1cf-6af9e03ded3mr10580275a12.5.1791232087424;
        Mon, 05 Oct 2026 13:28:07 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:05 -0700 (PDT)
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
Subject: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
Date: Mon,  5 Oct 2026 21:27:23 +0100
Message-ID: <20261005202731.153971-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
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
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 45b7a0b6c626..b1f093d218f5 100644
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
@@ -144,6 +154,17 @@ allOf:
   # warnings.
 
   - $ref: pinctrl.yaml#
+
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
@@ -222,6 +243,7 @@ allOf:
           enum:
             - allwinner,sun6i-a31-pinctrl
             - allwinner,sun6i-a31s-pinctrl
+            - allwinner,sun8i-b288-pinctrl
             - allwinner,sun50i-h6-pinctrl
 
     then:
-- 
2.52.0

