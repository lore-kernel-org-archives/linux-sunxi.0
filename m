Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEBD3A28E
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Oct 2023 17:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOpWqwh0"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50802148be9so2009586e87.2
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Oct 2023 10:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698167602; x=1698772402; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9fNjyF1v5YksnWbAbpME/leIFX1OZIHlz6r3I23R8Y=;
        b=kOpWqwh0S/eWSzAdxMfwVvNMphyyt26GVIoZO0pWPEyw2iAlviJY9/rNHaSDfoUEQS
         CDdPizpJ/8QwDoJuqko+LeJfwcx5e9gtwUOw0HQ9ibIKuk4hmiKzpEwU9STAj17vs9o4
         Zni1APz1buUOr+S5sS+yBKUuM9EBGDDbu0oDfdVXUs1qfa/nFGg5YpLGIjqliSjz5BXi
         GBwcR9xyfet05eaSmfTjibHXdNPbcpiVSPGFFak+uPou584TDRyFvYfh0HoA4uMIYbGh
         XxD8Ihn4WEcPGR3b9fBF4qdQF+ZjNNo8DjeoZoC1LF/dmTwKVR01RnmYd+FHmEFB6aJH
         ElGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698167602; x=1698772402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9fNjyF1v5YksnWbAbpME/leIFX1OZIHlz6r3I23R8Y=;
        b=XFxRIr3u7KubowH2ocQgtM+/Q9Rn6RZVc+P2z6/jw5EPGt0FeUKntfZ6bwtCyHm3Vv
         efxG4sowh1MxS9hrFwAUpBruOroMX1qcfDVSa/tPykpDvEPFVAnfdehSxvLR11hEcse7
         2dppvSGVVE0OvU6Uys2Am3qCUi9g3QA/LT2Nn5HNWuL5E/VaP9ekbOqR0X7Vrqb2Y+RZ
         KnBQ6JPed6bjV5dW4GvNaBh8kXpY+GHz+nvSvgmFRyxcPvUSPguz3nd4g3wQma6ONUXl
         CJXF5L1UqCoiFIUNq1UdndrNXl52nOsxicosHH8zVgLoWD22PRXY3GT6Kfpr7MyY4Azn
         zorw==
X-Gm-Message-State: AOJu0YyILSR8SNCyDO+tLX16/6HY238QmUtqapZFwkhQ7rU4l+gg1+O8
	tc5jIlmpr5DJN60r9BDdjcY=
X-Google-Smtp-Source: AGHT+IEcCwgneLND5o7bHUBISV9MdVzV/sMKw7Tq9M+fpNLyyTN50vBBXmjkI52iU1JqHSFil7yqoA==
X-Received: by 2002:ac2:46c5:0:b0:507:b1e2:d3c4 with SMTP id p5-20020ac246c5000000b00507b1e2d3c4mr8591914lfo.58.1698167601562;
        Tue, 24 Oct 2023 10:13:21 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id o12-20020ac24e8c000000b00505a5ea726asm2202413lfr.309.2023.10.24.10.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 10:13:21 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 6.7 fix 2/2] dt-bindings: eeprom: at24: allow NVMEM cells based on old syntax
Date: Tue, 24 Oct 2023 19:12:53 +0200
Message-Id: <20231024171253.19976-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231024171253.19976-1-zajec5@gmail.com>
References: <20231024171253.19976-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

This binding supported NVMEM cells as subnodes and that syntax is used
by few in-kenel DTS files. Modify binding to allow it.

Reported-by: Rob Herring <robh@kernel.org>
Fixes: c5330723d5a0 ("dt-bindings: nvmem: move deprecated cells binding to its own file")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 6385b05a1e62..b6864d0ee81e 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -12,6 +12,7 @@ maintainers:
 
 allOf:
   - $ref: /schemas/nvmem/nvmem.yaml
+  - $ref: /schemas/nvmem/nvmem-deprecated-cells.yaml
 
 select:
   properties:
-- 
2.35.3

