Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08FD437864
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 20:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752443; cv=none; b=DePn3KLYgn6fyk6/QfRQ2L46WEZK9xp3pRQS7DbLBliHlGv7u/sK2xizFofXaU9tEcluvAL2tNf1NXNgHiE2M12BBNX7GNA2cvksIocbwow/uLcCtGnuoF+BOQ+mTcMuoOl6xb/iLYvHz1A9TH6T/EK/0VBDh3WHqiPTE/lE9NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752443; c=relaxed/simple;
	bh=H7gc8EHhrE54TIGFPE01knw9jDcZnFRii3hzkCBNdj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l+L7xwEnGAR5LpWYrXx1i5p3wuwg9T7Lv/rWHfYgKNAztvO+0xy6Ij9Ko0L5L6wjMFELEIrRs9Y/FXwbHYHD78crfaWY4ILSSoXZEjvPMFC7nFnVUrmc1jPhflIr9PC1YKy9hgje7e2ZVG0pWWSggiwSqnxiqigIOi7fTBrZCdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XILswU8c; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XILswU8c"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso49883015e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 13:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784752439; x=1785357239; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xSx084TFnzGFnpguxyZxDPEBlEGv6khf3RChBzg4a7A=;
        b=XILswU8ccD8yfY5QtgqNDbYLYoy0YVaaMz5aIX40sRKe7OZ9LUSd/YdMpTlJ2ePZmQ
         /0IbZVNJNgnj8QPcFAx9B6zSEXq+nPC6qbnegeIIEd2d553jE3nIRXWZ3Fm3ozbY3qly
         5a33NANW83R6phnCIp7h4+wiEAwtpBtMFqlNZ6iNf0TxdTx0ASnHxE4dMLWuO/fxkmkS
         Q1IQpoAGFJpawWM6b+GyBI5W+zwCUrjIfwwnm2+4cohrChc6htFm0m97htd6uttuFKIY
         1DXRHBPmWLWa7Qz98NF+USV/UW251kclUsX+rXE/hVHixSe4xdumgokHHV7EvuS7V+46
         R/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752439; x=1785357239;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSx084TFnzGFnpguxyZxDPEBlEGv6khf3RChBzg4a7A=;
        b=PaYvMtZlW2BpYSxgn4VYKKQ0k7h63mRiG5V+HGo0N3Ut3bpjo4jR+C9pz1uEgg4pi3
         WGdZvj+fmvNXE8+tr0HzSEKCq89JEfPWYeItnzEWxZXfFgxHZO7aiq3IgbvBAtLEoIS9
         C3pZuuS8fKqJkSHohhsgP7hXGa3lml38o3mXhsQ2EVPhpN2EDG2chm5uVIWHyNF8tlof
         Tj+YvQxvE8aElB6l1MB29PhChdLjAS5xZJEXFGCURPaJQRKEaqYIcceHSSPPAdEZcw0S
         MISpnu8sQKG7kWBPEJYhMOppChdAyYumdsUlmKhgHudfLWl06kL/lU0ZsBiw4XEXz5Gt
         wJ8A==
X-Forwarded-Encrypted: i=1; AHgh+Rqna08m/MVB59LwjRZVp+WVkGe7IVIOk3uHnZH95aMdjqCVndEbnWk9MJeszm8INeXjDxKbxzQdpisiHw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1LZbjxaK2aEM5C4MDROKXcP/FPgr7izZJZthvYGKWXjgb7Ld/
	b7Sguk/tHdR0Dr1oOfG4w3AFJpLNAtvrv+DWx0NvM/XBeBGTH/xuSWn4
X-Gm-Gg: AR+sD11kkw8/iyWZYxBPY7+LQfG0Qgqa7TljHS5wcGb24AUIrgXApR6yUBxHkXp0Fkh
	PUXa+AhStVV6BWwWJKGbbZQxIl09b436Nlw3nB6KGEchPOqNfaZzzh2yoZz87hQVOy+iy2go/AT
	h3l5LzlJMsX7PfSDzvZUQuXNQ+m2HrAaelxwIYke8aC0CptjTi3dErK728txNomvnT6gv6ZfXnf
	Vr1q56H+PqLNSL5x4EHEHDWu3iXmnv6STfmYYwuWDUUk/6YPajtht8fWyCuMczykxZD+GnYB4GI
	s1MzNnsdMXzrQX6INPKTEZi6sctg3eKRr4iZlNyhpaLigmq+Ey+sZgmYfs62hkbSi3cSjsPlimL
	0INx9aAXpBawkKe2ivVGj38mosjwEiLn8e9vGCRq/CEQ6JUA+iLx27aI/MGfnh5dU1Oox+Llyij
	iMW5Mw01tqa1yoQzimXnCogJ0h
X-Received: by 2002:a05:600c:3152:b0:495:3fe1:4ce4 with SMTP id 5b1f17b1804b1-49573ce8ef3mr3009655e9.26.1784752438954;
        Wed, 22 Jul 2026 13:33:58 -0700 (PDT)
Received: from coolemuke.fritz.box ([2a00:6020:b320:1a00:c256:1463:a40b:d8c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956ab2f0a2sm63134945e9.1.2026.07.22.13.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:33:58 -0700 (PDT)
From: "=?UTF-8?q?S=C3=B6ren=20Hantel?=" <fugininsane@gmail.com>
X-Google-Original-From: =?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>
To: linux-pm@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Rossak <embed3d@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 1/3] dt-bindings: thermal: sun8i: Add binding for the A80 THS controller
Date: Wed, 22 Jul 2026 22:33:39 +0200
Message-ID: <20260722203341.2917852-2-fugininsane@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722203341.2917852-1-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Allwinner A80 has a thermal sensor with four channels which shares
its MMIO block, bus gate, module clock and reset line with the GPADC.
Register-wise it is an early version of the THS found in the A83T and
later SoCs, with the THS registers starting at offset 0x40 of the
shared block.

Add the compatible to the sun8i THS binding. The A80 takes a bus and a
module clock plus a reset line, so the existing conditionals already
describe it correctly.

Co-authored-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Sören Hantel <fugininsane@googlemail.com>
---
 .../devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 3e61689..718c44d 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -18,6 +18,7 @@ properties:
       - allwinner,sun8i-a83t-ths
       - allwinner,sun8i-h3-ths
       - allwinner,sun8i-r40-ths
+      - allwinner,sun9i-a80-ths
       - allwinner,sun20i-d1-ths
       - allwinner,sun50i-a64-ths
       - allwinner,sun50i-a100-ths
-- 
2.43.0

