Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C9445A2B3
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 23:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763379; cv=none; b=ausUd9coQ1GmSIf8bNxHacCzufNoRTwAa2q3PDr39fvDjjXDeadHucGCxuLBYfjPIdeGDo1AAHEiGJ+t0b+MhAzsiWMNAEQKH5gvfT8LqIixIFk5IQtMiiOoPFOSYHmgd2nRw6rBg7gPU5LbubcwSoD1co5fnn1w57B3UHUPt6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763379; c=relaxed/simple;
	bh=p2luxpgausQjIcXu34TXu0p86I0tMOO4Cg1dU7QLAbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LT8ISY7i7lRjbE6GS17ZtOgLdB9YoP7r2Gth3T5PNbjxm3JvEvUWtTUqwG8yyRMQyFl9au9zW3zcMWqzOL0OW3G/bcAa+IOVtJJq5mfc/aR6oZPHMdMoiBFRDqiI2GhGX8YU2V873rWaC/QOyEelFG8c9evHCbTw/w9Vf2ouvwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6+88n0+; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6+88n0+"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-81eaf3709b4so706267b3.0
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 16:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763376; x=1785368176; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fvg+6+1EtvjWR0RkLSp0ui0eU2DSRzRszmxxfr+HzU=;
        b=Y6+88n0+15W4L90XALVP6bo9Mexp1uQItYQVFg3kVRdr3eJsMF1C08BOlFlP8xkZCc
         b82SQf01252wflAzoUFo0J3WU51klS6qkkCE+EoG2GSIpPxNUkAX2/Ymyk2XMamBgw8m
         7pt7bQl8Lkr/mASZ0AjgffTeAH6Q1KUaVnVjojHuxLkcOw9lNswvfWH77YIKf7F87KzE
         Cit4iIlzMXGBqiG1qav3pkGTkR2Tpw9oj/h8gLsnyMfV3mRwpnSGRdFaTuz3SMtpvkXT
         y3uftSwhmzAo3PE/MCrnVqHodL6U6IEukFaZdLClyXDG98QMbKxVhIkkINmBVn+ba7hF
         TyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763376; x=1785368176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/fvg+6+1EtvjWR0RkLSp0ui0eU2DSRzRszmxxfr+HzU=;
        b=kNmNI+yOhVBIQpaS9NN428dSHAJuBK6siOxlU2oJhkF4KSN9JV3f2gtsN5gxRtE1Yv
         qbhWf+IiTfk8VbV4xHgxYdaB5+BVcq+NHMC/s0UvNL0tqoBf2/Eh0acmY7CHTtehkELX
         Q7NfTItOJ/afPzS6mSajT7oISsdcIdU5Mga1X/GjsSwylSlkszj6GiSK9GApZnO3Zrm3
         fxLOkQfs05B6CkOxBUlUxXomox86vhcRy5aUbirjDrEXzQJZOoi+vElFmW8HzmlOMmBQ
         QxqbFJeqgSXBbCePRpP+OU07UMLqnpp2KLxcp9FXSo9wvu/H3nSvLNDp4jD+XsdZXJQZ
         ixmQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTRmqLfSLEaDqX3rwG4FT70mXYA9+WsuGQ0m5+x/WF654T5DbUn6ciz/IaU9BvD503TnG7rdBkDKdA0w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy14RVg8f0LdIodkkLosW8EN3fvqA68r2UTB0LvjXWtUVb/8ojl
	6rPTD2ztjwowSwLIai/5VgZpIStaFpp/ez04QWZx+bt2wIFbrSe9kOjZ
X-Gm-Gg: AR+sD12o8j5P7AGSQNzTC+H0UZO7UIcHT22sZZ33ljPNg3diCNP93CL+HYW4BgiJUdJ
	IhZO1kixPXvdHXj7XPNszR4tbQJK7Gp5PZjOaG34Xdo7kriadEOA2/JcO7keq3GZ5oOncpwxbVT
	yD0OVp8lRkXvvQk+3rWIr/ayR/Sw6dJz3ycE2L4EGKimHKZxv5Wj0mbFDQQOdb0K/a4XTisMxz8
	hdQvd3dBnnTSrgkVDt9Cfc0VCNuquADKQpHO0aCrEUM6D+PSA4wji8tDxuy2ragZRFwWhDMWOll
	FsTgiZcK2/dkEuxqYmjAuMp7fX1YNKAzYQJY1aKqEV8xk0VHblkTH5h5ArBFLWsZ0dSD35CG5ei
	VhiwbpfLCNE01DUbdaP+JWgQknmpKGeOuuUG+/DfZu45ZAVgL2H7eI03a+NB3xZHhujy56iRP24
	EyoKbxWcu9tdY39DfC81LzTx6dH74Bqg1Kr26VXQhYmMuy50I=
X-Received: by 2002:a05:690c:6b81:b0:80d:e214:c2bc with SMTP id 00721157ae682-81f4c2a96bfmr2265757b3.35.1784763376007;
        Wed, 22 Jul 2026 16:36:16 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:15 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
Date: Wed, 22 Jul 2026 19:36:01 -0400
Message-ID: <20260722233604.3001063-2-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722233604.3001063-1-utilityemal77@gmail.com>
References: <20260722233604.3001063-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
The reset defaults match the fixed behaviour of the older IP, so the
device works fine when driven as an A31 CIR receiver.

Add the A523 compatible, with allwinner,sun6i-a31-ir as the fallback.

While at it, merge the standalone compatible entries into a single
enum.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index 42dfe22ad5f1..18b28feacf83 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -16,9 +16,10 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: allwinner,sun4i-a10-ir
-      - const: allwinner,sun5i-a13-ir
-      - const: allwinner,sun6i-a31-ir
+      - enum:
+          - allwinner,sun4i-a10-ir
+          - allwinner,sun5i-a13-ir
+          - allwinner,sun6i-a31-ir
       - items:
           - enum:
               - allwinner,suniv-f1c100s-ir
@@ -27,6 +28,7 @@ properties:
               - allwinner,sun50i-a64-ir
               - allwinner,sun50i-h6-ir
               - allwinner,sun50i-h616-ir
+              - allwinner,sun55i-a523-ir
           - const: allwinner,sun6i-a31-ir
 
   reg:
-- 
2.54.0

