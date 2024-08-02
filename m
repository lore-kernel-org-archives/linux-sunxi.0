Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476031547E6
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Aug 2024 19:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626579; cv=none; b=IGL5rLC8oQ7Dlm58jsMVxy5FT7ajuinnzyeOFjBiBOMBOXjZ22nngw6OJPGhLtVbFiG+aqOkXlpXeFIKC3tKStOgLZHyf0o4Yz8+n8wIwSzwDr7dPRfXrKPI4ckUQSyo0a6lekQNXr4h8QxTRX5f/lBEfRehdx+xdQsNN0z/v04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626579; c=relaxed/simple;
	bh=a4Ix1bN7kYAyaexe/JE52OKfO2ZR8L/mUIPikwT94Q8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ch6AHFS8aCkzoREW2hkxqN9Q7tKX958lRkd4sR4t2gfh9x5U/RVpX2zg+G0mrv/B/pkzn4YOeIL0iX+ZD7WLwhqqYJcaNujMDOqLmD/f66l4v/uoA9NSE2WhdhOalep2Os5TugbFpV3o/dRMjfX2T/f6e0lsbIc5L8hDCeHUafY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOc6bCcH; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOc6bCcH"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3db145c8010so5428482b6e.3
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Aug 2024 12:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722626577; x=1723231377; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mouIfH8iXKAgiuPl+irz5vubIoLkf5e+ydr2Ab2V/ac=;
        b=VOc6bCcHGAsxXj36BCAFGdORq7rPPAqFt96sjmga227bZqvseDDNNjzWqUcknZ31Ts
         0hsdJsrnE3d9DACs2BMwt4Wu+Q2xCYguBMUqMaL63uGUjlRGE1y7kuFsqgZdrk0pie99
         IAMcL+TDiTva6uR9O3+CpcEq8OY7X782HB9julujxu9Tf1RGBJ4+58nV+Oqflr+w6K5R
         d0GIqsQqb66cH3c6BK6oxzWXVJ8cy4Mtgbpf8ASvf1ZhXsslPQdhLipEgWfXZ1NT+U+p
         Svo7SKFZYWT01q5uDREZdmENZq6tuqWXGEhTJ76AQ0Xnu3Pcezs37tWRnuno6kbu76ip
         Fgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722626577; x=1723231377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mouIfH8iXKAgiuPl+irz5vubIoLkf5e+ydr2Ab2V/ac=;
        b=jji0hjp9ctSqoWB+DZf2qr5B0BheSOwNEIAbYVH9Xo916rLal6VwwPY3oSfP3BteXC
         Nh8IZxJz+3tumQrS/VifYuaKDLG/a54nydzYpw7MS82a0gZBndXjrsO3YTiQkky85wat
         /xxwjDusPA8ebjyBiTFazGElfC93u8eawbcsyHK5UDtLgwUmGQqDSVVlz89JKHN5LbpZ
         efXZmC8e96E3ev1fbYRytuvkvb3jsfu2bgxlJavwuJv6sdBKhSiRF386lfLifCs/PIsA
         bTsg8hQui5G9w8OZqqIdqq02R9jjLB+JGgAkonx4+H9Gi8d7MSXxGh8/U6HsHcqO5BRL
         Yblg==
X-Gm-Message-State: AOJu0YwiuKvv8gn2t+qZngF8lw/lOGML4poEwqj63Z7lOKyLgq5W5ALz
	ubj2kd8t8xiguFgEfJuSPTaeUpMnMtPqmF5BgTq7O+j+yn2JeKBmBlVmSQ==
X-Google-Smtp-Source: AGHT+IEvGd6Xp975ECbxmLXitW6A80ucHgMhA2P1pDKhXhsdpg83qCIyCSwuxXQ3qrx89OpC/iWJSw==
X-Received: by 2002:a05:6808:23c5:b0:3d9:2b15:65d4 with SMTP id 5614622812f47-3db5580b007mr5610603b6e.21.1722626577346;
        Fri, 02 Aug 2024 12:22:57 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db563b7065sm584592b6e.46.2024.08.02.12.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 12:22:56 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	quentin.schulz@free-electrons.com,
	mripard@kernel.org,
	tgamblin@baylibre.com,
	aidanmacdonald.0x0@gmail.com,
	u.kleine-koenig@pengutronix.de,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	sre@kernel.org,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lars@metafoo.de,
	jic23@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 09/15] dt-bindings: power: supply: axp20x: Add AXP717 compatible
Date: Fri,  2 Aug 2024 14:20:20 -0500
Message-Id: <20240802192026.446344-10-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240802192026.446344-1-macroalpha82@gmail.com>
References: <20240802192026.446344-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the AXP717. It has BC 1.2 detection like the AXP813
and uses ADC channels like all other AXP devices, but otherwise is
very different requiring new registers for most functions.

Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
index 903e0bac24a0..e5879c85c9a3 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
@@ -26,6 +26,7 @@ properties:
           - x-powers,axp202-usb-power-supply
           - x-powers,axp221-usb-power-supply
           - x-powers,axp223-usb-power-supply
+          - x-powers,axp717-usb-power-supply
           - x-powers,axp813-usb-power-supply
       - items:
           - const: x-powers,axp803-usb-power-supply
-- 
2.34.1

