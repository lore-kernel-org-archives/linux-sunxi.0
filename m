Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3731613B592
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Feb 2025 12:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759964; cv=none; b=aRiaNKQpG4t9qidhKPFfkTnZGIyiaZ9yDc61VZgeB9voCqRoCF6hBPPEQNIojB558w/cnvK+47+Gn6KwhwzvbVSEQ6DdMssTmhYsnQ/23DalaLwDTG/p4zMD7ra5R33QD9GW3gkvNTYGOeQsMGYZaLdaT8mYqaT8LN7NSxJzRk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759964; c=relaxed/simple;
	bh=6Ldci5NJcLk9QDLef0QdLFO2TFiUZ4r9u/pld6Lsudo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fT15tS08od0gPpEgO4joRZHH4TBh+e0MafeQxg7FKosdzsMbZLO/mQLiE3fKzb4gqE0qBJZw+eDoM01xOJX63VNmREMWp8O35s3yOu/6JnM5/XXQpTuQXNB7dwL6qJSclvxOa9b6C8Djco5Un+yYshirmWRu/TWQIvF8XZuuzaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjyhNOym; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjyhNOym"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dce1d61b44so630123a12.2
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Feb 2025 04:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759960; x=1739364760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnyUK6beMeleaf/vnmqhL9TlcUqLD4J+xrVEoCblRp0=;
        b=GjyhNOymRCGJIWE45HoyZNWz1ZrE9tvL03/wL7f4cWKGrkzwLdDXcZe5H1SLyQp8e1
         vacoein0tz33oJLauu5rwgE9SGuZKDx/NsDO0S1RwuYGDVYgyauF4XvquWIJsBpY5x5r
         FqlkKd0MgGUr/hQJUKsEYhji5rTlCAoedWG2a/gJyIvhMlq13uMwexRSO5PtyKprmNA1
         DG9F+uFmQnJzcd4kqvTpLQHRruW1G71qoSiUC08/CoVXTF0TSF4oMrM55TJ/8tgvv6EA
         zQS9a6GjZABibVjBmuFEntkNO8bHXe6VvZFuuNr7JmJFFJiObU+MQ0010aCqmcSoQ1LT
         7d8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759960; x=1739364760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnyUK6beMeleaf/vnmqhL9TlcUqLD4J+xrVEoCblRp0=;
        b=P90ktyVdD62/qcjfw8QfvDCki0386RGHl6WaObf1o9/eHUSH8EyKZKsM/V7hPJ/OsM
         mITWR4dOYMAfMf406TnoqPJaPnkUJan+gqcFOLDPRGpJMPqjOiwbZkkXKI/IzulTuuPk
         n2WsBQMG0VsXRu+XREsjSntwazn8UjZiQnPh5TaQc5mVgevQdhx0smPJEHL8Fx7vskS9
         s9Nk3VuY5BAhaeazqmVQMYPfhGs+RDaYyruJhiJN61o7aPuWtZD2yI66yanPje+8nBWm
         /5mYuzLU29F4R981EEYWrL/E2aJsLYruB6joFueDSn9wzmTUCbJ6x2UR4+lYZG+BW2C/
         dLyw==
X-Forwarded-Encrypted: i=1; AJvYcCUBHlY5GNs3hm+cnOvMwoIW6IaGNbDS0sJsY45GdFaj6w0VXfdSUWCwRqciOuaJBzQnCNtXV/epbbqqYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc2WkG6Ge82JafcZFLUeZqkMe2chmNcTpPUMKvn0APZtS06xP4
	59seUBnZP1gN7BpHfFPZvceXfkuC/a6fZaPZByQE/XrK7idbvdwu
X-Gm-Gg: ASbGncuqtqI+ntH3k+M/4SQ1OzgG4SPM93kJeb9iNROddddLXYKyA4EhalAKFzHbQWN
	VOKvtbzVFE2+Nw2daI/55n/+D0iy8ZG+pA/l/xuE3qUH86BdRI9G5H+1zvSwyE/NZxjeK5eT5al
	Ao0guIJLPxRymiBGnMvMSn4mMoJoBY2pY4X71JyqwwBY0L96toZd2si3QFfzCnOM4zO3zKg9FoR
	GSucilesk9W4F108k/3QF189zwdrUsvFy6OiZ38CaQhMYAzOrQ+cSp1u9SrS+4an9RJGjeAOdkJ
	NHyVUlQXbFImAabUUM+18IHqLiNKQk1eml8h5EONWS9WZw==
X-Google-Smtp-Source: AGHT+IE0wywWb/Z15BOQfyDS/LKQnpnhSIPGUcQiGwnAhhs+76luZoRksyVgrmGjUEmSc4D72uhXsQ==
X-Received: by 2002:a05:6402:388c:b0:5d9:8877:895a with SMTP id 4fb4d7f45d1cf-5dcdb732cd0mr3410442a12.17.1738759960294;
        Wed, 05 Feb 2025 04:52:40 -0800 (PST)
Received: from localhost.localdomain (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724055e5sm11559997a12.45.2025.02.05.04.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:52:39 -0800 (PST)
From: Andras Szemzo <szemzo.andras@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 07/10] dt-bindings: phy: allwinner: add v853 usb phy
Date: Wed,  5 Feb 2025 13:52:22 +0100
Message-Id: <20250205125225.1152849-8-szemzo.andras@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250205125225.1152849-1-szemzo.andras@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Allwinner v853 USB phy.

Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
---
 .../devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
index 21209126ed00..815742c4f5fb 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
@@ -19,9 +19,11 @@ properties:
       - enum:
           - allwinner,sun20i-d1-usb-phy
           - allwinner,sun50i-a64-usb-phy
+          - allwinner,sun8i-v853-usb-phy
       - items:
           - const: allwinner,sun50i-a100-usb-phy
           - const: allwinner,sun20i-d1-usb-phy
+          - const: allwinner,sun8i-v853-usb-phy
 
   reg:
     items:
-- 
2.39.5

