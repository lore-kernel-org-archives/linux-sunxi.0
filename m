Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEB7449B31
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514203; cv=none; b=sY9qeTHvHW0VXT+tiFGqt4DCbbIlm1c096QAo79DHkJh+ZZn6GFhaGE8kq7H3ezxCDRluDk6rFR4rfAmxC24SORYI/OyKlsMcaK2TwzriMLEPK2EfR57KbdjCDsZFTCBRzQFY45KH+yP4Lq991x/zsRDjf9jr8BjKGjDiPAchcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514203; c=relaxed/simple;
	bh=c1BBB6bs8QkRJGVWb9VKH09aVOOWU4p3wPWDCQ5h4r8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FtV1oPcrzF+It8imeE/1vsR/ByxLtEzVeJlDl0RKoyiGhExfmAl6gFFt5P4o5QoC8bu/omQDLZiflCLdyw8GDi5e3iG/fmN9dbJGGQaPHyEPSaBq58XVhNkp8nk7NTfP1FhfMvxEULij1ProIbcPwalhtz9xcfBmnGVo7QTz4H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JLY1xCRh; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JLY1xCRh"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c197f968b3cso189633166b.2
        for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 09:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785514198; x=1786118998; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e6j3hHRJCAXjbnkzKw0InC59a2Jr/wtnnQ/J/lnUnRI=;
        b=JLY1xCRh0zw9pQwyJ48aQoA3kvpohVQimD/Ubs3kWrplSxpjiwIECvlEwr1sijBq3y
         y/Uc7j0fCqJO1RvkotUZJrRWdHdyXrSfPyXezfxtjVlY1DK6J+t2jZS5Qi5Qus2sjKr9
         /2COSJcUWYpF8+K9B69J4xhdZ1tWFdfTkf6OLG8IYVSKPGFyT+f3sQ/n59NzOj05szgN
         wEY5qrvnuk/BFhLrQCs4gy1VNN4id1GbqORWX1Xhtod65vvMY6P1SVA3cD8jnuELapbe
         UYmDsACX65pk52iJ4Xq6Haa5PTekxDbDifLPKUR+14Ywieg83QU9PSmPuuyFHJ6wrOSE
         VvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514198; x=1786118998;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e6j3hHRJCAXjbnkzKw0InC59a2Jr/wtnnQ/J/lnUnRI=;
        b=jaaz3IqZbA/7KCMU4jylu+g3wrELjqQ3DcLPq76R3E6aAYKjkNF1UDVcRRIEB0Fg1p
         4IzD5OM1m5e+gBIZfMUXbT5gLBYlG9+lIzLJTdUK8RKBEiMavv5/nbVAHCXhqmOkNUGf
         cHsdTwSSSHfh6r42FBHMFnbCV2Tde+f8MChMkkeHTbjt/mh4YrInXSCQ8TQv7A+uzc1o
         kjaMvkaVvsDwR+LsUnmYt79Pco/X38EcRzalHEpRHS192hQhvp9WXaJwr3VXGiTzJG9O
         GW4N2yZgGDM+VZ0sAy2HHDcGo2LSNo5IG/30WfNownV65XWu/ullayHlwzMOO4fhtgum
         Vl5g==
X-Forwarded-Encrypted: i=1; AHgh+RqHCxeaZDiFNZ9aCCn3mqj5OWiYfuIikSXNC/WrmYA02ZoKP0qDVM7JZTd6ZA1gnbWM9l+fQ7lKQW7FpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAjIkt5fleCOW7PVPtRLRJm/vC/0OLaXJjtl062fX4Wl9vTGPz
	G6npdC87RCnC4hBGehoHeC0cHc4YQedOYKAUXxYAkX6aqrnpNpVV5YweW1s3FVUV2cU=
X-Gm-Gg: AR+sD11pt3mbYp8PFKsyIjYR5jxHZmWKEEorUOp1sCAc9cEivYftTQnoG75jDKxjfcJ
	7BIU9s5Hqz1WRgGpJFQCWyD5rWfreMqR8JfMDKzun5FaPX8nlyZQp/6YXQ1zOQqje+QoYO1N1NT
	MGCW5NPgvSV9ju1cz14whyJXffgQbHjE0WycvnlkBW3S/uo0Uiti4MEYAsQFZSK+ShJafTgrzRI
	9Jr0VWISEM6KwKuz8t07NjuJFHKZXbvPS4CmU9D0ykLwbI1PgZ8ZHVH0iU16W80JWE6dDK0HRsK
	Py63gFZ4dmkU9Mb9tWRcDYtuxaWOjLtaJG+p1EUab1uwXEUvKB5KPbi+1RShjmqOEevn0Ls8pn4
	kUPXq+3mqwFkel5829LmWYkYX+dsYaufevPP7vlpyzCX6DjmLKHYv4UFQXN7Xz/5zD5Uk70CMWs
	SaHcgE4vwsogiywGC0ZToe5h4hVPbFnRtSjqOfHneEk2E6ycxelBRYb3zaCg==
X-Received: by 2002:a17:906:f85a:b0:c15:cc30:6c74 with SMTP id a640c23a62f3a-c1fe816fa83mr13218066b.44.1785514198430;
        Fri, 31 Jul 2026 09:09:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd4562667sm6729424f8f.24.2026.07.31.09.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:09:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 31 Jul 2026 18:09:52 +0200
Subject: [PATCH] dt-bindings: irq: sun7i-nmi: Document the Allwinner A733
 NMI controller
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-allwinner-a733-nmi-support-v1-1-61e4a0825b20@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAM/IbGoC/yXMQQ6CQAxA0auQrm3CMAbEqxgWAxSowTJpQU0Id
 3fU5Ut+/g5GymRwzXZQerLxIgnulEE3BRkJuU+GIi/KvPIOwzy/WIQUQ+U9yoPRthgXXXFoU3Q
 p674+O0iDqDTw+ze/NX/b1t6pW79HOI4PZc8kdX4AAAA=
X-Change-ID: 20260731-allwinner-a733-nmi-support-fb026869d941
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=c1BBB6bs8QkRJGVWb9VKH09aVOOWU4p3wPWDCQ5h4r8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqbMjTXlrz8rv5mNapSZHl5WcOPxLnYyYNtyA1v
 pQrskCrQ4GJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamzI0wAKCRDm/A8cN/La
 hZQED/9s3wGP6F3JuJnfZQb8AMYiff+jEIymztKBJmuUapVpEX1g6yG7VgtcuinzOj50NimCXST
 C5F4G0DVAjSJ0aNNtqfMnpuUHfZRGMers44mqlkR5eaUcs6ivK8NMAwCKfy8dW5HbWSKoEjM2vf
 BlpME3HnSpanmW90H5I7Q/+wYL8nBEtBrb5AwNV8eXjt1GrsVAA+QF2kTVZWNGWWEGTUol7I4mX
 6/9NK6wAnSZj5YFQtLfKH3yT5rO4dASNYXlGymkFjudS2R3LXarLSy/VWib4GF0d8KrQWUVLFeU
 jVQcho5P9+DOn16gFnf98uhRrW8O9Ye2HoP6UL43ICmUjNGuqaDEcA9F1Sja2Kls4G87S8XdewI
 4xT/YCKhbI3kf1JQvExxXe70bMvyqa/E0fE0OaUCT46OpU1s0CJTy05Abs6bHasfjp7SaX0hR6H
 vnvAB9ihBDboKlmfYqfhiLhDzE6rtPQq0PLwmo5VhWKlwGwKLt1myTUJbgFd9JEB0LmBCbDij1n
 GeGD9K/dzURhv7nXn0PDQph8Wde72L4swPxCy+zooa7IJPPUy/jJvtgM97FZA8oUi5EuQyPpvDD
 EbH6AadYG1kzLJOg5KG5/GRL8LK4khnWzPi7CYRQ9JgTna2edissvwBqYS769OE+afxoNzqb/FU
 mQLn7PvJkUM10BA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The A733 NMI controller is compatible with the A523 one. Add an
A733-specific compatible string, with the A523 as fallback.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index 06e3621a8c06..bb9273ec2457 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -33,6 +33,9 @@ properties:
               - allwinner,sun50i-a100-nmi
               - allwinner,sun50i-h616-nmi
           - const: allwinner,sun9i-a80-nmi
+      - items:
+          - const: allwinner,sun60i-a733-nmi
+          - const: allwinner,sun55i-a523-nmi
 
   reg:
     maxItems: 1

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260731-allwinner-a733-nmi-support-fb026869d941

Best regards,
--  
Jerome

