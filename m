Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795159335;
	b=JJR4Cqse4lvT600MyasjD9+ow+KRhhZSNPLeLE2nIzeYzFyOMm9gYaR/Kc+Nq3kxMHjF
	 0ir9W2XL6nA18Ko1mxcZLekgFf6OBsxkb5As+J/XYRCXwoCQaW7pYoqxGWInNrEFlGeEt
	 WUaNBcBlwwFLV/aOYR1EFpvcnBMnsJd5fL8RILAmEiqx4im3IafGcHYHmUYATJ1rD8rys
	 MwZByTdLtzWCXsvO+XiVNuhnySabxHao9B/U7bhL+W7oWuvLPmxttLfx1e42vXgbZArie
	 tsBBSoSFwUHa+YZ7vQTMSls4osvsrZlV0uz7UMPwGPhN9yP/zdBJBeEbo8Ncvvn6NZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795159335;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KwRrc7jJFjacNOYQ22+KumrrMJDm4/e2Aq0/zpjEOGY=;
	b=Ek5jm7BAtMXWnnwfEAnQe1kD76yT8bDL3GaFR3+FTIVx+xq135vaSPDJZuqUn1Lg7Ojl
	 ZofNTSfJN0At0udT85xSGkCqQZ2uSmdc95IAoqxrJaAakSvEz8jT7VPoVczwGtcuGa62M
	 J76tob22Zx03OmqqQckfbk+Gjos7C3MfFnXSmBnFLCpGl8Y/9fxlfrBi5oTR3DVUdFuI8
	 o8ex1Rp+HA2NHAzkmQuFKVQnMkt/1YFOfd8UPF+W5TLGYBS6axfkr6rOdUUjsnLzoGzvm
	 jnlkOwR5ejxZ2CFmm9D/Dgy8FzwBGm5wTAYAxBvhRrC1qjzkYKsw4qp3YlLTA9VK3kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AR6hGc0F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30615606A320;
	Fri, 20 Nov 2026 07:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AR6hGc0F
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795159334;
	b=KfofeOJVDifvWALXiZJy8vrJ05YiIVAPycKrn1+oh32oz/a9U/58pUQHDl1EJxwfVZUD
	 v7PfVNlyPBZfcJpE/KpSy4yzKIzlu6pJ71ug2+WwoWiS0Ld0i54MwgPyGrn3OLl6iFXiP
	 swTmyW3klxp+VgPqSEUH/DhzvdXBPHh7qfJ8J6sXX7b43OGjJqqAexRqgnxXYVy3XWniQ
	 hVuzjFRwyDivSBKmSaPcyjK6/8NqWS5+xDojjyupD11CeL+QMHqznU3+Vq2aMI8GdIZkv
	 SBbmU+7o8PuczaeA+s2f4ovGygwGG4OMpSjbc9iVllMb9lhETfYMhlX8Zsoutxcri7A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795159334;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KwRrc7jJFjacNOYQ22+KumrrMJDm4/e2Aq0/zpjEOGY=;
	b=BIejPMlC5Rn6Ks4XsZKVXpk0lNEj+ZFnm2rq2gJarLMqdK3yO/4FNuQ0cXx2mb7ntdYD
	 6jWwcaDHyHZkrjx9J8nNTwblGeLHu0VWaG0YfxqBUGsyNajbZUUloEqCnAQ4P82rKO4AN
	 SfhZzXfPG4xRe4Ms+sItCnbQj77gMBc490shay27BybN5zt7JrAR5b1oxyTsTyEBV0yrj
	 iV9MsXUa/iWvmkcghz0UYc2vycjzlMjq6FSFINLntoy0DFSZcodgL6UGZVQQyFVuE+0cu
	 3IRRQ1ab/DbjpXdrQHkny8Jp1ddNnAiK0aQW9Dd78seAR0xL2fFu6l5H+icVNqAio3A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 391361F000C6;
	Fri, 20 Nov 2026 07:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795159334;
	bh=KwRrc7jJFjacNOYQ22+KumrrMJDm4/e2Aq0/zpjEOGY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AR6hGc0FWWvzA7TxqsXIQFaJwAxG9t/GiRMKFboQjVVH+1ivnk0Tsb912GOCfiVeB
	 z4YzxeUEE1te3BrBtEzhohNjNSFpfor4SQVTeKFLEVr0P9uk7TmBdJLJrez2b9GTIi
	 N4IMOE3kkLqGcfBAM1P7e73YsQcxnmAKZoDQPJvbeojxQ4uWnxnduGDApJM2ZO5Q8k
	 zlZO0MEvhPv2r0SCttYHrVQyNhQu7D6eExMcO+lFi1flxmIohrMfWMNl9wFy8c0bvy
	 dTuCOXSluqCirN/10wMe7Ze7X1QLx4BG48Claue9KxMSanOjM6D3YHwtdwyzpirpqj
	 Oeubqqpcwm0lw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BD00D4975B;
	Fri, 20 Nov 2026 07:22:13 +0000 (UTC)
From: Rajan Yadav via B4 Relay <devnull+rajanyadav0307.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 01:22:13 -0600
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Shenzhen Kickpi
 Digital Technology
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-k5c-dt-v1-v1-1-d9681df67bc0@gmail.com>
References: <20261120-k5c-dt-v1-v1-0-d9681df67bc0@gmail.com>
In-Reply-To: <20261120-k5c-dt-v1-v1-0-d9681df67bc0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Andre Przywara <andre.przywara@arm.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Rajan Yadav <rajanyadav0307@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795159332; l=1286;
 i=rajanyadav0307@gmail.com; s=20261103; h=from:subject:message-id;
 bh=gFo6j59NzHKrlOvLgDxrGptA4LIjDH4Hdw5hr398y8U=;
 b=fFpAMIAg/lv2xBPfX2kce0TU5AiNuFAAajV4OUITbIHuTYyxTXr5MeOoYbe4kC1sej5l5Qq7W
 6WdSvsIj/s1Acp0v5kKMtccaa7nlP+78pRUp8XmFIMVrfZTnqcAY8Qf
X-Developer-Key: i=rajanyadav0307@gmail.com; a=ed25519;
 pk=4ZPeiP5qrv2b44q/Obxi2koUS70Q6npbttJnpUoTlgg=
X-Endpoint-Received: by B4 Relay for rajanyadav0307@gmail.com/20261103 with
 auth_id=1391
X-Original-From: Rajan Yadav <rajanyadav0307@gmail.com>
Reply-To: rajanyadav0307@gmail.com
Content-Transfer-Encoding: 7bit

From: Rajan Yadav <rajanyadav0307@gmail.com>

Shenzhen Kickpi Digital Technology Co., Ltd. makes single board
computers under the KickPi name, such as the KickPi K5C with an
Allwinner A133 SoC. Add a vendor prefix for them.

The company name is the one KickPi uses on its documentation site
(doc.kickpi.com) and as the registered owner of the KICKPI trademark
(US registration 7747802); their e-mail and web domain is kickpi.com.

Claude Code (Anthropic) drafted this change and its message; I
reviewed it and checked it with dt_binding_check.

Link: https://www.kickpi.com/
Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f..a67f9c1c896 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -919,6 +919,8 @@ patternProperties:
     description: Keymile GmbH
   "^khadas,.*":
     description: Khadas
+  "^kickpi,.*":
+    description: Shenzhen Kickpi Digital Technology Co., Ltd.
   "^kiebackpeter,.*":
     description: Kieback & Peter GmbH
   "^kinetic,.*":

-- 
2.34.1


