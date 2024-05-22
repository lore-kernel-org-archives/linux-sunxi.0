Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7029514198A
	for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 23:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716418901; cv=none; b=E7yybrZc40R3C9pxNDOnElXYYERdfGKmBRMfR4yjwj18lP6ONbLH2uaCxMyTwQ2EvA71v0W+f7+QOzuFaljkdM6UlWITEnCvQjr0LIz8Jgh6LK/YM43YNbwDp/ko+Kexd18qIlOAUd8ezf3nCICshOUDDbCdj4q7hlWYv5qXxI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716418901; c=relaxed/simple;
	bh=pOvzFgVKP/kGa6+Oj4KEJD4+I3wsBQtRuG8wg87QWT8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OjgGv2vna6iBbl+BxoHfeGNme1rx3IhvhNuvnisNKbrZztQ3Z7DpfGYvIWpYL1UCBSgb1cDoWstyBA4dqpIn/ondMtzMsGLn7VLSdFAWiBDnu5BczwLIqsI00ayYfNbHmx+zcRZ19PtTDr9uFCmPQREo8OtwETf2Cdp6jujlZtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0qXnKZR; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0qXnKZR"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6f0ef6bee72so3215362a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 16:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716418899; x=1717023699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2qTU9Hshqz6t1vKHlNCBK7tNf2KsTEuBaP1htzZOzY=;
        b=C0qXnKZRQpxIGA9CrsQyznt6LRwlt94G0ApN311IByeIOUt/ymP0+vzyhbpmAWMSCx
         gk28pXTare+889W2ULZlrxrk/liC8Xj49PLiJ+jYmGreDZhMpAlbQq99Gi55LOLJ8Iff
         5M8zh/9WiuXB9TJ3psJ471Bm3f5g8IC/jsuY6QLh0bTAb4pPGEcIizWcowzMLauwRLSS
         uOaaOLIJwuITfSiqpqQanP5FtPFBzqZhfc0qUPHZXwtOZJxu1u9JTPF+4PZrggY9h/1W
         P6qXqaVBTSl6xpLaMDEINPA4VOtSg3rc6Tq38q4Is/a+DuDfy2SgmBYsnKdZ52EZ6Klr
         5AIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716418899; x=1717023699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2qTU9Hshqz6t1vKHlNCBK7tNf2KsTEuBaP1htzZOzY=;
        b=KllTnWJLt2z50aRFCPI2zG9gVZB2Jmy7WJzj3ijMKjhjV4EjpSt9u4aG4feOxoZkZ/
         Wo9Yps7ZNzJueJf0CJ6KYR0fu6J2rjEvv3kVdKUW6A9FtthqbWerSP2VAAo6i205FAve
         H/MqlkG4DfRkS6dvnZVft+9Yqs/k4DZeVdjhxTPiYhG0uot/xy54uQ//Zeqfk3jrn2k4
         HAaI6ivJy2SuxndW+3eBwHddDONzE0o8kGNLi7g3zY8fiFNXfKgpaS2A1wLLSiaIPOAq
         zdjM6AoED5/lRAbMddhRuBhg9b/8ii2MkAQB7gEHj2zU72VF1Kz5JwBr1lG+KtFoAwDn
         CPmA==
X-Gm-Message-State: AOJu0YxLnz0yKYs12WUj/CwfRu+NisQpxG1Bac5qYY4+fYyIBqjlyQ/F
	bmSRzZXhvCVA8IrZ+J+WaGzJ5IQCQWAGyMLvtvOSC8edqX3OqGPHpKzUqw==
X-Google-Smtp-Source: AGHT+IF9XqDhOY3NBWbwuIvbwXqM3lJZa+22zq8hRhbKDUtdlxNWoBwWN/yX6ZfmEb9tQKYSYIuYpw==
X-Received: by 2002:a05:6830:22d0:b0:6f0:e79e:f1a9 with SMTP id 46e09a7af769-6f66518f653mr3454623a34.4.1716418899303;
        Wed, 22 May 2024 16:01:39 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f0ff995ccdsm4155936a34.34.2024.05.22.16.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 16:01:38 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/4] dt-bindings: mfd: x-powers,axp20x-usb-power-supply: add AXP717
Date: Wed, 22 May 2024 18:01:30 -0500
Message-Id: <20240522230132.364915-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522230132.364915-1-macroalpha82@gmail.com>
References: <20240522230132.364915-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add binding for the AXP717 USB power supply.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
index 34b7959d6772..a50c3bafa707 100644
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

