Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598E731E856
	for <linux-sunxi@lists.linux.dev>; Sun, 10 May 2026 20:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778444213; cv=none; b=H32O6oj1b/CfpOpqBzNkSbdhv0gDirxncK6osFGxsdx6DnthMeHgNdj1o0p/uAuJIiC8zAAUuWEAHJ0PD6g69XROjSAplpUjoIzzhjSGxxUQxuCjvYCe4hR0Gaf+NlF/iRkLgKnmRl09/25gwHHPRBuzD4j8K+M8kj4EqIf4tXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778444213; c=relaxed/simple;
	bh=hqQ8ah5uFEWJ7YrNd8GjM0Dh1+dBzkUDyqXlw3sqBJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z0dewO/HAJMqpNjkPZLQZXk0MdHd0A4kv1V3iD06w6iNqgi8ZP4b3zguBQIrLzjlNH5LO9bYOSnnyX+DzAByKOA+qXQmIH2G0xkqnfVkjGgDR4VWQu+ML7zhTCUYgb8C2AgmTWLKuazwm+qbd4QbVLibfcCkTcGDlIm9hMmotZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H74Z4Wzt; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H74Z4Wzt"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48e82c23840so1451155e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 10 May 2026 13:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778444211; x=1779049011; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rqwwjElFE8r2tVuzO7w3VDnRiQGORrv7X2AdYrNZjA=;
        b=H74Z4WztbhWddIy3wGOm4zDKtUYMdjrXOEGdpb5mbUu8AOWkAl8h6PwG/aJQcWSGU7
         Ln3O/YUHJ6AvYs+p6ApM6zDZa8YLv36RHhoLE0wbutgXqPYrcw5sYgims093gVH/8FeR
         dW1Ho2xVSVEOqLDmTsC7pN7SJYZ0xsGzuFMGCsfTJdtw77+2OkqMAjZHpBbHqs5f0Hb9
         pJ21xKqH8evq0YSpNGAMO6doGB6QE9cdNZqD17bhJhwqXFsNmqek13xm8dxPnb/sSXWt
         4ZQ1arv1TmTRF9Hqk1dIsnEjlyYtK/5HZe1DOFljq39t6F3sGpGvXsjol9Jvc/N60I4x
         28hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778444211; x=1779049011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+rqwwjElFE8r2tVuzO7w3VDnRiQGORrv7X2AdYrNZjA=;
        b=DJ3IstyMiOPrkCAeAb5q/fY4IyEdsNyXjudyuh0ZZaKC6LB1CS7UpbuheJC/tqHMub
         rhx02kYJ/b/BUdhEq/KLSX6HG17olkw4DD6DpGCkhiCloGe4Jd6n7EBryaOpAjg6fJ+1
         aZI3oC0WkdGJ8gtRTNXVPFHDgJhxzuCSeffSUbUDbcbUUQAEl9SShZthOZntpufbycMP
         MrTW9d0GxwKV/2+t4N/7kKABwMattjgT5qODKmPPLmU6/ZidzcPhI8HGntb+Pacpq3uE
         Ht1jG3VkmBo/IJLf/sEAy95JgMuRkQPnmEutLQO7mxCE2K+Yb3VYw6LSIX/DvAWoCByZ
         p+1g==
X-Gm-Message-State: AOJu0Ywuohoyv+8Sh3DDLTTkcGBDj2uTSMOZsNH1Fls9zTSIGk6Cnn2I
	u6rAjVbK2CskAWVF3Ak6yqS+cBFd2ZCcya3IhPYwswHXxgbfUWOPwkFUTREKrYik
X-Gm-Gg: Acq92OGNtAFKv/uiCOKUU2BrCKF5WEH2LJp7LnQKjU8Pgd2miJwsJ6nFuG5X4whQFVS
	Z116gygbjBzxyYi447VafRysXcDt/IsjeXprz3295nsh9aa5PxCLotBDqgnadcrxErmz936uWEY
	06ebB+SOLvSD9FHYppsN49OqKedodKFHc7Z2LpMIeGNcoWLPmRIC7Wesh9OgHrMp+g63qK03cTw
	Q62F5jGXI6POHl4YTwB2L88Hlb/SJ5LAJaWg+Q+asDY3lolEMF0iBttzmlfQT90wQVknIDBmXiC
	BsSJdCGmq/8mhZ+Gh4xTcmjzYTgtx6VLzRaL//fyJdEUsmnchaimrkhdVfAzyWXiTvQVwDEqcAo
	Q9hqAzJtPxcqw4Ke6OCWFmSdJW2eIFGlFQMBRJyIOVSYQIh29NqnfqXsVYximK1n0S7SmnA8UQH
	Tpc7ciBw8OcbTqygXnJW8LcUJsik6N6/jsDY5jdA87RilM/ARHjShe
X-Received: by 2002:a05:600c:3548:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-48e51e0a6a2mr320516385e9.4.1778444210848;
        Sun, 10 May 2026 13:16:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7040a8f1sm127667145e9.11.2026.05.10.13.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 13:16:50 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
Date: Sun, 10 May 2026 22:16:39 +0200
Message-ID: <20260510201644.4143710-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Baijie HelperBoard A133 is a development board around their A133 Core
board. Introduce a compatible for both the Core and the development
boards.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---

Changelog:
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board

 Documentation/devicetree/bindings/arm/sunxi.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e6443c266fa1..d7b9dec81165 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -96,6 +96,17 @@ properties:
           - const: allwinner,ba10-tvbox
           - const: allwinner,sun4i-a10
 
+      - description: Baijie Helper A133
+        items:
+          - const: baijie,helper-a133
+          - const: baijie,helper-a133-core
+          - const: allwinner,sun50i-a100
+
+      - description: HelperBoardA133 Core
+        items:
+          - const: baijie,helper-a133-core
+          - const: allwinner,sun50i-a100
+
       - description: BananaPi
         items:
           - const: lemaker,bananapi
-- 
2.54.0

