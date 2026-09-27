Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8933C39021A
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 15:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521946; cv=none; b=rVb5t75vivI9KOUrue7PJcXtYOJQy+A8s+kg/G2ZjT2x3L/FoJvmthNAbevQl9u/06PaolbI9T5YCFbBNKZK2wFeM/CYmgTIwIwU3bqWPebAUqFFeHDU0+9w4PufUk1tQjvl0OFpqORYA2ED2d1FUreEDkcLlxSek0JQ3GwUHZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521946; c=relaxed/simple;
	bh=IKu+NW7V12nnMBgKKHdP7rj1fpU2GspG4UzSnncTVMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jh9ZopZngWD0K6xRqMe7JteitZ9h/uHDkAdupgxScHvINaX77NulG5JUVPPxyDDaeFavQnXyUsR1y5NG1dysh+7yv/QiuYjv577aOk1pRLzetsqHP/tCVlMsmf06UCFS+bfkCGFCTZgkTsy4zyxoSIokA7m8BaIKW2I9yTpGyU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AufMBlHb; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AufMBlHb"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4888129c46eso1080653f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521943; x=1791126743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=;
        b=AufMBlHbkp3/9CEFmGXxeFsr0rdd5a2U/4LMuEi61IRB50b5sgYIbH1UyqCh9MbD5X
         5ZijPrX+sNxIe7+aLTOzkzBH86d53uIeUQuAU4WOgP3uK1zi6ESE41xVHnPaCATb/vk7
         /DHTZCwjTWyXdCBxbJg/BJ7K3yJGk2CZIt23uWQKPUIswf6dLRwxQLdO2cNOcneVZHig
         qVPcLH0T1fAgciNBOlaTeAjRTT38bSlyRi85ApEz9akjc7A+0LG+VpQZQhDMCMCl+tyK
         dHRr/0zHba3Jt50G0H0qYcaOzOcuGwKCXMiCRvgOkjaOGnANG9cxmLjXfR2FzYRwDRI5
         b7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521943; x=1791126743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=;
        b=azHVup/fLqseUzul7oPS4Q+gyq0AOAb8hQ3lo9aNNgL8Uy2vFwGVnQ+CEYCytZWj/s
         42nBw0QJ4mJSWbYLBEaCjw1ZYeFd3o8vKYtUp7XUj7kKOcTElH7VXYOu+WvMKzB93Mu/
         ixK43AtZSB5v19v1985L7483/CDPCfxJXeF4F7C9aNkBUdMhxuMT+uniZcTRxIWhNWFE
         Zy4Ap34DOEROAKH8Gi2f64sTCneabl3zLnW7qufbpl0jcQx5VlKGSPPNc7xJY2TFqu3O
         6LyiX2anQNzfbb+udTHzm+WrV86IANrHOTSVtDuTqefxvYFzMl2RVA+7DzvIPM74njHL
         mvVw==
X-Forwarded-Encrypted: i=1; AKwUvBwZ6h2MbjEn/03T7pFA/r8dCII+svmb89lWOJyZ4ZCrIdzz9sgAGas6t3VJ0dZn+QStwxhY/xGh/Gtikg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKgAGohykvXZNUyEVNQupxFP9ArY6FRiDgQ6ESOHDqbV+A0x5Wf
	pnPFlocDPGctQbUl8s7thhfo6iRJb4bJbgh1EqztJK79RG/AbbAEYAo5
X-Gm-Gg: AYBFou2wb5Jb6o/gCkbftxx3wcjN5uctjFuUfygqbdkgMfWGoFR8zDcfxyGMqjLG/96
	+Zm2LgWrGzHSoYplTbkfCYlB0Ts2yrxhlm44GzcWobswBXHfeJpTd/6KpBlfcpWU5EtJnWCzFPX
	jKlCgQgloes4Vb2aPjcbKvmsmEqQ8WUPAyulthpvyHd/vw2dL1dL9M7AI/OYl2sFeBS8cvq80Gm
	akgRfEpzimvQUvHF4xQKnGLNzK8U7Q6W5Uo01bv0RUBz0/m47LA9jMROu7XCBW/VC/R42efGsLK
	5gxsW9f2j32DvHyQ8dqRersilLuZI7ultW38Tli+gBvBpDtq+cZFYffL6i8vXSG06wHXfFDHZT1
	x/ZZpAL0q0dNAVPysK7pR3p4O12FgP8ZLBBPD1yB2KpWqHhmgVIFtSBxgIOo9Q0NULiIQCTVSit
	hvofU4iAgpsMrxghkdSKhIj7BzL3+V681TR3tdTw+4HYfiYWtTDUpQvevEIuSl0HhsS7z0RFAOF
	/DcBNqQXb1b0QfCfibj6BfF8XwB4Sdt
X-Received: by 2002:a05:6000:4693:b0:487:342:d141 with SMTP id ffacd0b85a97d-488774f4f02mr11163439f8f.23.1790521942896;
        Sun, 27 Sep 2026 08:12:22 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:22 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Date: Sun, 27 Sep 2026 16:10:10 +0100
Message-ID: <20260927151016.186493-6-pmazzini@gmail.com>
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

The B288 RTC wires one alarm interrupt, not two.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f2b91186ed37..1699e3576b91 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - allwinner,sun6i-a31-rtc
           - allwinner,sun8i-a23-rtc
+          - allwinner,sun8i-b288-rtc
           - allwinner,sun8i-h3-rtc
           - allwinner,sun8i-r40-rtc
           - allwinner,sun8i-v3-rtc
@@ -162,6 +163,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun50i-h616-rtc
               - allwinner,sun50i-r329-rtc
-- 
2.53.0

