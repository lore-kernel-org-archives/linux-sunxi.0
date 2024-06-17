Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADF21922F7
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jun 2024 22:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718661963; cv=none; b=TUKKy6Hr6USgav0oYTxz2sQmV4g/uX4483lMNAkWQLlZ85elgEdvBP77qtSVw0pETexqrwLQoIgZxyPBAQZwSxws8j7GskASrJQzpgNoL5CbrU/DImJ9wKn/uX2+KRBG9M3mHLKS0/jVo9gcAcHR+1gz6zChv9kzIWQMBsKZFFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718661963; c=relaxed/simple;
	bh=vSX80ON8QT7Jk17w76m3OpTB/4ybhhptsr9QuMGNPIQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i5NvWgVDXuN/F1Uf4aez4S/FOqNlNegEHRBlia09f1+GVpFc584vXM8GZdrWUm5NhuMiIPES8FgFro8JFsEXFPmuzjvN/t78EXrWsQ8QB118mtgU3hSbu3SkB+sbp4toJptESsn19kcDjGWUKy8ELHbB9F7I3TKsV41VLjL4HVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtqyJzRn; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtqyJzRn"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6f9b213ebf9so2044753a34.1
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Jun 2024 15:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718661961; x=1719266761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72c1oCxCl3E9fFtbjzZp2Yxwgd19L9zndmRoUlwxJeE=;
        b=WtqyJzRnrFwDa8ndjs7UMmOR4z4DIGJqkYBG7i8QAIkr4KGhKu3e5mG/xT3Rs5zQDG
         wpZFjV9JlpdU1FrpeVaGTXxK67Zr+yhex6dHy90KxaVEkrVdwa6WIAHUbzgAxtZtyQ49
         e35Ur/SsLkX34mZa0d4apJIFZfTj3dphjxf+c1WyL5d4X0CH/j2pGjM6VNslom8mnQkv
         ubTLKIcPStzuC63j0sR289fp74SKgGvvS9e+ZbT5jhjjXqRYALMDiNhoNTwI+GGz1RRw
         O4LbrmacX4iNNLUjhsieYEnE+fsFA4ulka4jRMA2NIODG4ZJa6c3fD2Dv7HcfG+x191D
         V98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718661961; x=1719266761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72c1oCxCl3E9fFtbjzZp2Yxwgd19L9zndmRoUlwxJeE=;
        b=obfGGDHN+Hf57XXEbSF7VY0XSQWUiDHT/ffT9ub4Mp9Pr0r6u0UbdRH2UGTnL6jc3w
         DYNu+uG7V6J3auVZNakVT07Ys6EFW29LckCgbB3hk2M/WM4YfaWWcsDQ3lGyS2B+A7ml
         rg4xkb5YqsnS0YB4wlTrSu3+vIuWM/py8tHBCyUlTmcvl+bwtLJQ4GciE3/gOrzzCZUo
         +rWwtYGm8g4a127VmQy5vqYJ2T+wkI2e/qlS91S7iQOV0RRmL27oqYPhjiBPpNf67cc6
         GlUweenS68/gL9Nt8vo1FbwbMFctD1XDGuBPR1m1yc9wvP/R9UjOQsLjRdL8DKXeUOs0
         MDtg==
X-Gm-Message-State: AOJu0YwdbW9egLwffQfJ/i/MLq76RAlttntFjXL1tbgwzjmTy3gpV+w4
	nu/+OqitxcZIVIxC7lqH7xMPHWRQpe7JZEeF3Y4nJRnS7jbbOemaCcn6CA==
X-Google-Smtp-Source: AGHT+IE9x7T2l+/foUb1Q9R5OJWa5Z1pPLXeYGeinTqk3kSXkdgHG61T0IPf6oTedgA4/lrD6wlwRA==
X-Received: by 2002:a05:6830:349f:b0:6f9:9d6a:2c84 with SMTP id 46e09a7af769-6ff15cd3226mr625445a34.4.1718661961372;
        Mon, 17 Jun 2024 15:06:01 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6fb5b1b0fa8sm1664232a34.28.2024.06.17.15.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 15:06:01 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	sre@kernel.org,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lars@metafoo.de,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/8] dt-bindings: iio: adc: Add AXP717 compatible
Date: Mon, 17 Jun 2024 17:05:28 -0500
Message-Id: <20240617220535.359021-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617220535.359021-1-macroalpha82@gmail.com>
References: <20240617220535.359021-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible binding for the axp717.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/iio/adc/x-powers,axp209-adc.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml b/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml
index d40689f233f2..267c74fa2d0c 100644
--- a/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml
@@ -37,6 +37,15 @@ description: |
    3 | batt_dischrg_i
    4 | ts_v
 
+  AXP717
+  ------
+   0 | batt_v
+   1 | ts_v
+   2 | vbus_v
+   3 | vsys_v
+   4 | pmic_temp
+   5 | batt_chrg_i
+
   AXP813
   ------
    0 | pmic_temp
@@ -52,6 +61,7 @@ properties:
     oneOf:
       - const: x-powers,axp209-adc
       - const: x-powers,axp221-adc
+      - const: x-powers,axp717-adc
       - const: x-powers,axp813-adc
 
       - items:
-- 
2.34.1

