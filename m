Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE35165F1B
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Aug 2024 19:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626578; cv=none; b=GPG1MLbu2uQ5UXpBIzifYaaFaePreHdT6bcYvTnJkREHUw7SqYR2n6tw+rka8aU1AQH717I8tm/Q3MezoUcrqXyBl02jxxczLV6FtjqSFYFOg9x/ZLV8y8xG0jIYZzcn9T2biSJZQ76Jx56KZZ5f3WrW/4h3WhxVD3ULB+tzc6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626578; c=relaxed/simple;
	bh=f8AlV+mmh3WAs+Msf35YzLUk4BjA6ykCslKCpn/PXLg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pJDZFVE52c9Bid71hLcelJwXWQ/uE8/gWxJ2Gks6Y8NGnqNAjAuyXE3ivxDgkLHU4AhxkiKSE3shG+t14lpr+XP1QNW5W6vvF+7wJ27Z2ecE3GRIhnSYro4F1Kwo2/CBhVJhy0qVfJMwm58T1WNIMMDO4hmiyqX7NJRygo8JoRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wnd4WS/V; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wnd4WS/V"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3db1e21b0e4so5605042b6e.2
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Aug 2024 12:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722626576; x=1723231376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JKFFQnfJOtoACQdVtR48AZhBo/Ifj44v65RGoC713c=;
        b=Wnd4WS/Vd2kqjPjgXRHDLfWI8TBdHvOBfPtwYcIlj9Vbqs22laCj8Yufo2Fc2HM/mX
         ArYF0plOzkc4WMZECOp+vy6Hf6KVR2GVa+zeqOBgd0gupfe8RewMD4wHlERv/DvObNQK
         no6Qtal4VNWSu5lvt0sh+N4OmDvY1CBKGbBbl/H8NPmFRIgwSUZaeT05tD4iKdlZSd2m
         roEyFHhTSCcWvH5k44GyMtnXqEvffCdB/+RYVO+S4N1+tzBwl7UKK5hw3JFIaNW63zNm
         TX1irMv1YhdDZZN/M+LR5f+sfG8zNZeTiUwwf2QNJAcWo68otZ3/o7w7ekV1CBFEKLFB
         d5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722626576; x=1723231376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JKFFQnfJOtoACQdVtR48AZhBo/Ifj44v65RGoC713c=;
        b=azBAlX220zVOG6Acswq6gpkRWAoRd22v/HVU0nQRrx3pch9kZz2Q0Ue/2rQ7Q989zc
         gaRYJ1H3AMnZr+//wVs0U9sokDqOZnmVbc6RdKgNubyxzzNLncRvAZTWxSib0kFuPK13
         8IzPKhqwoz9v86bk8S9lEk5EcSRh9rUvRb0GhDoHEBlMJeRsboHiyBgHFC9nfNVa6+zL
         D7q0jHV3E6zjMbNHjUczMBIUUDXcvFu714a6gfdV8BP7juVP+Orn1i6pEzc/HqSjOAJK
         slkJsytSCzC3TTJi8yxsD81upYeJNw2tVprti3lwAe2+J32KzGUC16WBf9GHSSk1XDJ3
         hZMw==
X-Gm-Message-State: AOJu0YwCONXR445xbES4N4r0oq29j4fWfFhSCSMFLJagtyySOnczEbGf
	sYQMYgBnTTNWNXmPQQxJFxKH2N8MmkoBVySeX1ShgANeafC2mdGmk3itEw==
X-Google-Smtp-Source: AGHT+IF3I1srJKWNYL7jsDJ+sv7ElDL9LAdwud9872cKrlkAH4dok6Ad4PODlX3yNJcRGI/V+jR8vg==
X-Received: by 2002:a05:6808:198f:b0:3db:fe8:f744 with SMTP id 5614622812f47-3db558123e9mr5306167b6e.24.1722626576429;
        Fri, 02 Aug 2024 12:22:56 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db563b7065sm584592b6e.46.2024.08.02.12.22.55
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
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V2 08/15] dt-bindings: iio: adc: Add AXP717 compatible
Date: Fri,  2 Aug 2024 14:20:19 -0500
Message-Id: <20240802192026.446344-9-macroalpha82@gmail.com>
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

Add compatible binding for the axp717.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/iio/adc/x-powers,axp209-adc.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml b/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml
index d40689f233f2..1caa896fce82 100644
--- a/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml
@@ -37,6 +37,17 @@ description: |
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
+   6 | vmid_v
+   7 | bkup_batt_v
+
   AXP813
   ------
    0 | pmic_temp
@@ -52,6 +63,7 @@ properties:
     oneOf:
       - const: x-powers,axp209-adc
       - const: x-powers,axp221-adc
+      - const: x-powers,axp717-adc
       - const: x-powers,axp813-adc
 
       - items:
-- 
2.34.1

