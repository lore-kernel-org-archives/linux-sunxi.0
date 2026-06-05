Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD41447799E
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Jun 2026 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643406; cv=none; b=sXf5iQ43hh7gnIgtfg1721pYRIXC9SP03w0b7WPPDJOh3AklKeYti+Oot1dVkanOVizo9lreQJldMEo6sfu3dHgytoLlxfwu2JN06FX12Xme3jgCi7gyo38hNx/lEhD8IlAhB/8q06G+4/eNK6L+8qY1T1ITVYvhSP7/c43CQBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643406; c=relaxed/simple;
	bh=hVTb0DesiLB14DyOmgF2mSD+qdL2FylIfKbrjfTiu3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=scOv0U7dq+yh2ht0L2nrWxtiwUQXbHCNXrTwO7kwmvz6T4oLhkFCenWtLND++iD7WpTXtIWuYD70zTJjZeuFtAKB8XIvPCgqCT+fkwfJSTXP7dHr90lZLavXWi8w6Qb9yhhhqK4MbNWhNx3IX2uOwfIZsBUkBVZhkzs1g19awuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSKvfC/M; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSKvfC/M"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so1058512f8f.1
        for <linux-sunxi@lists.linux.dev>; Fri, 05 Jun 2026 00:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643402; x=1781248202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRiUKaQT1nJBPq+KqxNJfa8ue8e7/Pl8K6UY0lHo7O4=;
        b=YSKvfC/MiAeFnrj4LqDN/p+/BZiaylfRYZxUUgpyhp+APbHf09UMC+mS/PiHta1Vym
         PMKWSwLixQi0he4W2y6AZ5wbONSgXpEDz5AtT1A/s8eD8KWUgVB2fJ8bG098TyGHc/Iu
         EY/jbA2algXsYBKxKbrmO2IYvrlPY2DRJHHDtvjCPjI+8Lxr6h6wGBgwZXiLnjDsff5k
         bRYxKA1AdGCAs+0KwuJUjD1YRrLUzlkgqWRVdsmxSywcV96QxRbMe4pZyHWaI0wajeMH
         U1YoqEJqtDnUbEHy1hpeVoN1yQlpq1xNj+yQOYwvm2m0zFt23Cj6JhrZMqDedtfInRkE
         8oiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643402; x=1781248202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GRiUKaQT1nJBPq+KqxNJfa8ue8e7/Pl8K6UY0lHo7O4=;
        b=jWq2m4vjUwqOjjIGoRoh/qyBQFZmIHqGPgIxVSWzOCbhtHyqMobcHfiX8TpJl5kmfX
         X0zUucEXKhCFqPKpiTqOQ4fYsKp6zZdmMn6vlx81mshAa2xYxhhcN5bZ5wjJmg7itn1m
         brdZTZncqDVfjFHh5LNl/wumDg0Qvjq6MvTM+IREXcaE2/LgWRUD7vZkBy9jftDTMTNU
         RTWmKkg06myXYaRFhD8TnRGMawJpC+33cPajCLCSMlj0VKIx/wr39zrKhjaONUvbKC0O
         ORxmw8z6T0hOyxgL6kapQs5e8o/L+8/ptRhzbwCEYzx1VnSNvWgAFG6p5LBoTowdua0K
         8TWA==
X-Forwarded-Encrypted: i=1; AFNElJ/Axo4NzBDjxm3UunYj3kuiiWqYX4pm98d3ekcSBWh3X9wKMLO9l8m3wgvWPE0xaAEDGY9otD9Z21Z0oQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcTmJiKae21sosdzA52j/RLjgQkQrQxFukqC8UT7olfXWgYaHO
	zGK/MVhS17d7eQl7meOk8fI7UQPqlp0+ugf0pvTwVzdnHd+JqT3icogt
X-Gm-Gg: Acq92OFeFDapQ0ftYlsto6JCwL5VeX4QVCoOmdTN7H5Th0YudDbpcaaHCnSH2xkhnIr
	7Wvbd7+mAY2vM9acoTMQpy1m/ps8H0f0X/eO5rdUY8uMjeKOGWc7I7ntw57Tp1mf/i7SpA4IlBj
	/D/U7LqAlNzV2xYPiW2swc/XznJMBD2hB53t7nvLW8e/cX/Qo2zqiB05rUb3pu9JaIFRWXClu4a
	VW3bvx/vM5/b6zoOPJgzUZo5h57Z/NXv3eNBg67gebrjnhvgo7oFpRMIwgJ1EmPXPSJsJtuTXNR
	6v6DgFIyk7zhVHSe48iV8L5Dg5+LRi2lYx7RMmV0E+Umd/M/ecPbcD9MY44MI1QyrcfCXn25nRB
	WVf4uf/r1Jgpxttu+I3R5aQy3BsqGa8Y+XkiI6eYZDc7I2wjLPKbvNsru0x+sxqosNzCcLLixGS
	oGY1bSslU0ulFVwFxVJG0vMeK9vQk7bbeDyjPVH0iumhhqF3Khn4loaWiohL06AY8HlbKmbgToB
	1fVTburcrpbsrFg4OBysw==
X-Received: by 2002:a5d:4ec7:0:b0:45e:ed7e:f900 with SMTP id ffacd0b85a97d-460304ee4bemr2656740f8f.6.1780643402240;
        Fri, 05 Jun 2026 00:10:02 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:10:01 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 4/7] dt-bindings: input: sun4i-lradc-keys: Add A100/A133 compatible
Date: Fri,  5 Jun 2026 09:09:18 +0200
Message-ID: <20260605070923.3045073-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A100/A133 SoCs have an LRADC which is compatible with the
versions in existing SoCs. Add a compatible string for A100, with the R329
fallback.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
- new patch

 .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
index 6bdb8040be65..524c8b51f53f 100644
--- a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
+++ b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
@@ -23,6 +23,7 @@ properties:
       - const: allwinner,sun50i-r329-lradc
       - items:
           - enum:
+              - allwinner,sun50i-a100-lradc
               - allwinner,sun50i-h616-lradc
               - allwinner,sun20i-d1-lradc
           - const: allwinner,sun50i-r329-lradc
-- 
2.54.0

