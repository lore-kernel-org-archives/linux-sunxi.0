Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97487470433
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 21:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568536; cv=none; b=ZkIQ+GIudOtC8kMkolfiUJ7zYBjlG45lyNXy6abKrNInfdjz76FI6oUXMULLdug7EctyejGQtaxEQZkB0dY0bO3maSPlfotFroMyw4/fC5Mrh9tHRA6oar0/dKcFQMX9GOleHsEbCNXXbsOwmdNT8mfFQxJBQPNFcwc9XIlmX4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568536; c=relaxed/simple;
	bh=0CBhCBU2Ye60x8lfkWT28rE3Pec6oVMCAnjppoXmg0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Uqnb6e2DeHxze2+ZAQMPfI45Hd/2/FumoQWqnGqiPwhh4ewy/ODpbHfCkfVPfk+cDhMoAvXkSGX+kLEgoAyTG4ney7MU5MQ+HTBZLmltoFXIAXd6fA+iqpU2tyTDyrTtKtcegLaBIZrQOOS0MrZS1MTxNp7qPe2mB/4h3esvYWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=E/EjB+Vp; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="E/EjB+Vp"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso7726f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 14:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786568533; x=1787173333; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eS0igH6p3phd0yMFsnOQZ+4mmHdJrMcSmVlciJfLpEE=;
        b=E/EjB+VpaHMxcQTUGkQpOPgmGhQkNRdgPA/ajN9TadKbY0YUSSGo/vwyFJF+BVRxXC
         0y3Pt9gCDAWUVAILu3XUtUKmBDLwI1r4cS4YujoGiaAmGmMwLin9u/KGQnxriRuUiq/H
         A+KhH6p3js//sUn1Bzw46anYozDcy+a8ZQrDhNlJs0kZL6zLb2dz3+b3lhn17257Qnh7
         Q4xSoVn2oLfDObIrvIxczOc2W/oRUTXBCzRZRE8rS77AS4ch4U1P/YQqGJJrPAsB/baj
         4NWYSb7/mPwLKW4nMDPizyI/hd/uUK52VkmObRh2/0KWVW0W9MPeeUDwC/EgzXf0s5I7
         kcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786568533; x=1787173333;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eS0igH6p3phd0yMFsnOQZ+4mmHdJrMcSmVlciJfLpEE=;
        b=CFecUFk+8zXbKMmswdWknpb9MyvCmgjCG/8TaKFnTZn1kNDvMIluSylw5wFTUYU+HZ
         9SfCTBU/zol+lCgZI3Id5/JQO/J8FCO1V1qGkemZUeJl/IPsLDIPedL27A7lLSrYu5e9
         c7GXGepx1gY4YTlc0fDPiJZQRuVTKzM2+35DEH0jcEyAK/ksfnlDq6NlLmINxeQ74wfM
         3hwvSK66iuJqWNXhyTbwdkNa6UaPWHjondIHF6ppmEvTNeD09pdstVuG9/KQUuaPJp+O
         BIpS+83uxs83W8TtWUKjmwKwXjoNi28OBnrM8Gy1q8YmsU8dZLH5KzyQj5FFUiDsMzYD
         KEiQ==
X-Forwarded-Encrypted: i=1; AHgh+RovGn6g9jAA9wCE8QceOPBaZJGZdINSza3u3+wi0DWUAY470sKrBZWssZ9RWDFUTkaFV+3oMMwagxA1Wg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ/gQH0C2B6AKuj3z9dsUy1DZJzFB7rIu0syoki8l4HAj2weZX
	LpC7KOAjqWGT+pNJZmCDrq8aMKR8/E51EUxDGxH8iYCyp0jVRu8/2c8wmxvjoLMe7LI=
X-Gm-Gg: AR+sD11YoNhMWqACjAsmqPjbHhEE14fq5wRq6hXI4bGfJNnqB0IvoMLlFQj4k0wB/zo
	nu0KzN+mkL9XI6jPRSx2F4Fgz0hnn7uQCXNNZTC7UQBDoOwfTt+ibYPhX898o02Qs88soM5u0ex
	mzTjgRZAbfBv+I0xI0i7UO9NMFLTan7MT9SwDIkaFu7iMFZYpjvSnIP9reU9fDf6pKp9+iPiH9y
	S2vwnzTPy6SIADsHmcRvIuR64FBobiM3zbEKTMypj/MSzIJuoixLVraqT0yZ06arzJp0ErFxfx1
	xwJCgF1UV/LlQO+t2Txu1Qcxz1m5OkH2cMqIrmxcyYwRkojYza7eLOhoJPEaFrryMZWvYD9cPac
	UZF8yBf1ZvbyyNZJwiJeMkckXxCF8mqiSU8mGquhxJZJa/na6NK511Zn4bcg1u5uDk2AwasFFFB
	iOLfQ9AvJcdgPCk6FcyeyzVQqkUtZI/djhNCgQofk0RCSzd67FumN6O3yzk0w=
X-Received: by 2002:a05:6000:2a89:b0:47f:776f:3838 with SMTP id ffacd0b85a97d-48159ca6049mr1024076f8f.6.1786568532369;
        Wed, 12 Aug 2026 14:02:12 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:282d:879b:d1fe:f977])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4815a5c2769sm426055f8f.36.2026.08.12.14.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 14:02:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 12 Aug 2026 23:02:02 +0200
Subject: [PATCH v2] spi: dt-bindings: sun6i: Add compatibles for A733's SPI
 controllers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-allwinner-a733-spi-support-v2-1-937bff0fa78e@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAEnffGoC/42NSw6CMBQAr0K69pl+RMSV9zAs2vKQZ7BtWkAJ4
 e4CXsDlJJOZmSWMhIlds5lFHCmRdyvIQ8Zsq90DgeqVmeTyzC88B911b3IOI+hCKUiBIA0h+Ng
 DKq5LbXleaMXWQIjY0GeP36sfp8E80fZbcTNaSr2P034fxeb9NRoFCChMUwtxEmhseTN66shEP
 Fr/YtWyLF+qmJyj2QAAAA==
X-Change-ID: 20260805-allwinner-a733-spi-support-e30a9ac057a3
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1539; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0CBhCBU2Ye60x8lfkWT28rE3Pec6oVMCAnjppoXmg0A=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqfN9Q+u0hwY5bmCREf8SoJGx0s9FOJ2i+Jt28L
 XwaflMwzwuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCanzfUAAKCRDm/A8cN/La
 hadkEACsSQx6tBKrNKoNPl56rW05ntzcDV4ES4lN835wpmXCzKW5YfclSB1Hw3//6dDLcCm+Wzs
 SMFe4WKJsIrxRA4wEPiP4qPgbmG4Didsxhp2jc/A2i0Z0LeIDz++zLcvBNiqqYHDE53HyhqDANn
 QGkAootOt0gQXUrp6jB2BkVoNQFjjN6vGJd/5ciuZUmzFZ+YiK4KtBcCXQOB1ylzuI+/LzewAae
 xNpfs5uJ5OOLVeHDcpVRfVoN6t/uFLg15IKlRlCb4pqjl6X39UZXdpYhAyTRl59bdIzNcrI+3Ln
 sX2xVa69TcxRFX9PWs36m1XaWeVPT39/1gvadDYPop0UT4NBAC9hQ+gYFKx2Os5dCbNjofo0UXI
 ZuXD28tFriBHAtukty38MySAlJ/nYz23qImyc0obgyHDnzGBfH99+cZGX7LiD4ACLbHZ29OladY
 NfSavowucJuOI44ngpXIMBgtXq7TbBDoi3gXFz2ulpM4F4yNbESQfP31e2p7goeR1Szq07jr6jw
 LKk7CF/sTnqzJfJj5qYPpekMDgJoXlC+Ol+Ht4O0wvQ7CsrwXRAsUAjOoGJ5arFpaBVEvpt1saR
 fef9Tvm7vJDQVtnc3zVTtzN8QVYFtx21ZncuvU7vXTzQVI78dM1/2v5i5HPdz2bjtaLhy+2JRaA
 l9uFYaAreYhPgQw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The A733 has six SPI controllers with the same IP as the A523.
Like the A523, one of them (spi1) also supports DBI mode.

Add SoC specific compatible strings, falling back to the A523 ones.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Changes in v2:
- Combined allwinner,sun60i-a733-spi with allwinner,sun55i-a523-spi-dbi
- Link to v1: https://patch.msgid.link/20260805-allwinner-a733-spi-support-v1-1-7bfd1141ebc9@baylibre.com
---
 Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index 6af4ff233158..14c2f318dd04 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -34,6 +34,12 @@ properties:
           - const: allwinner,sun50i-r329-spi-dbi
           - const: allwinner,sun50i-r329-spi
       - items:
+          - enum:
+              - allwinner,sun55i-a523-spi-dbi
+              - allwinner,sun60i-a733-spi
+          - const: allwinner,sun55i-a523-spi
+      - items:
+          - const: allwinner,sun60i-a733-spi-dbi
           - const: allwinner,sun55i-a523-spi-dbi
           - const: allwinner,sun55i-a523-spi
 

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260805-allwinner-a733-spi-support-e30a9ac057a3

Best regards,
--  
Jerome

