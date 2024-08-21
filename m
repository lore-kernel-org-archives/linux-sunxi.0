Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF40617C7C4
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Aug 2024 21:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724277459; cv=none; b=ISdtwmxaoj1KUIy0EfUuVMCC5QHz8WxFry8/UtVD9Uul4Iqo+NMJFrlq2gD708tlXmM1ynfUtjaEYjgxoTLUFud07lMFbvB+abRYo8mluC8C9v+/S582/tNCLPbrsFBWm9xoCE1qxBJ5szBo/FtnEjCRmeEVUbJ6sNZtWK0oWW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724277459; c=relaxed/simple;
	bh=2N5vSF/orr/5lpFq7UMO/MLBrEUsCTaeamXg7ihD/v8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A8+7q1fWtAnwq5+pFIpsjk1f7OKrsZlDfG5zTxAFHvohlm5tJk6n5Yt6pGdzo+9zFiMZ+24zH8Iqip/evyuaoR7vHbwIV+Jw9dQO0kuUut0hgW6R9FnHNC2MoEYMV3BQPHHwplCMSfIzyqAwV8skr0gcjMNgPZY5Ya9589lSysA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrzHRtDK; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrzHRtDK"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3dc16d00ba6so92526b6e.0
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Aug 2024 14:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724277457; x=1724882257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBLcUKDVkwPFiYRJqjb28cNXraCEW6YLxwgaARvC0lA=;
        b=FrzHRtDKLIrI7n77HN8u9XzTQ+ThOpQOsea9D8oA1BxSMXpLS1vKJDSTnoFzH7c5eE
         fGkT/H0LVD9kOtdSeqMS65V2OkzhFH336jNK28rQLllGxQdDxWNDSiLynhVnaE7Dqw+a
         3yM67UajRR7KJxewpFYT2k7OY3XD3aEZJwIu3qvsZSKUXkEGZ0O2VvWsCIDhvyM4woan
         w3ItKqkAHzujL83kv7weeMqcnAeoGyaaN7jdL3yP9CWr3aeOKq+bxkWERZdPJ1q+daSG
         NwlPbDLcmiUwcdOfhGuw0yKRGthNfxCu3MYKvBoTY7A2+2WrT+d3hiEo6zD9N5kgFzeD
         lijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724277457; x=1724882257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBLcUKDVkwPFiYRJqjb28cNXraCEW6YLxwgaARvC0lA=;
        b=JXKTkFw55sfdTfi2yveHKestan7zSk/r0n7fZjgIN8t+0JASoNWbmHLMByqW++zX62
         D1RysqSrXu1IdgptSvXBAQ/NB/9cVgbZJHkbAod6cY7nAp8c7WS/g0kkKEJFmQzOMotz
         j6DGjAuVZWZ1QdTqRsYcEHUvEBqdM30+KR/0zH8dxKt5GMdvs9HHOul3tvB48cd/j8tA
         hKEDntO470QuNnNb3tPRDddArHvbNiFhR1AxMB4+Cwvygw5vVFJRIL4TENLy3AuGZywI
         AmH3Wz2oWIBzpmq1lK2gPYEsmuCoAxsC7kDQ7l8im7pCtlqqHr4or3z2QHrI3FN92CY0
         9OdQ==
X-Gm-Message-State: AOJu0YyHE1fQ4u8ZfJ2F336qMiEcNTdGxBlG8JDaXzzc4sodQ/JQ88uX
	n0o0BPHD7bEAGjnzuUj1VfFQTyKkdMxgACw7tPhYITr9HAqmeNjBlwpbYw==
X-Google-Smtp-Source: AGHT+IFBH/Id49Is4rvox6d7qJv1gU0KdeZpKbRB9tXQkrhso5+9Wd6ArhEi7XMb6kv3+haBhqqwxQ==
X-Received: by 2002:a05:6808:654b:b0:3da:ab89:a808 with SMTP id 5614622812f47-3de19510ef5mr3509342b6e.20.1724277456885;
        Wed, 21 Aug 2024 14:57:36 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:81a9:2325:e0f7:7376])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3de225555b6sm47070b6e.17.2024.08.21.14.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 14:57:36 -0700 (PDT)
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
	jonathan.cameron@huawei.com,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V4 10/15] dt-bindings: power: supply: axp20x: Add AXP717 compatible
Date: Wed, 21 Aug 2024 16:54:51 -0500
Message-Id: <20240821215456.962564-11-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821215456.962564-1-macroalpha82@gmail.com>
References: <20240821215456.962564-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add binding information for AXP717.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../power/supply/x-powers,axp20x-battery-power-supply.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
index f196bf70b248..5ccd375eb294 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
@@ -23,6 +23,7 @@ properties:
       - const: x-powers,axp202-battery-power-supply
       - const: x-powers,axp209-battery-power-supply
       - const: x-powers,axp221-battery-power-supply
+      - const: x-powers,axp717-battery-power-supply
       - items:
           - const: x-powers,axp803-battery-power-supply
           - const: x-powers,axp813-battery-power-supply
-- 
2.34.1

