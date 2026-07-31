Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA00451991
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514915; cv=none; b=Mp7863Z9WbWBfwPzXlqXON1Lo8hOymp05qpmD5HKRXtXeUrDGKOOceckGraGARu1RU/ByTm0cW/tntRP20Lb9w/7eK9KxWsWIsQ/Ou5RgnkeN7gi0+X5lOWKqvCGU8ljHjgxEE+N1wQJX2AyJvrU7BZnITGaJvakUwrzDEkE/J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514915; c=relaxed/simple;
	bh=XxPxlj15S9GHxpbr6kayVJohduiQuJOZXJICcGUo5pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sHLra7lNEJng74l0MuvbDLmDsqWFWxHSKQa7iDGY8PPWcW0FnngnPUHe71WaoSj1y+G3nOhfNynDYPW1iZeYQloEudLZOwOHqfO1mafb+9sHGd9AiFqbk0YRmoFUpErdA7Y0KL8pVaSMDHHwNNd122Xrynyju+CxUGTHpYM3Wgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oz1CJs0F; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oz1CJs0F"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso775345f8f.1
        for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 09:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785514910; x=1786119710; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uJ1sTQDdzGH3L1I7c5cySgVgb/wH3f6ziWC+LNjIF5Y=;
        b=oz1CJs0Fx1SQkdpCrrj6jKpxF5YDvq1E+ApvEbw8ewTAriQOs9OmVMpaVo7GaetmDK
         cdEt85ac+ufgKNYbR2sD2w6TXEKQltcX5ge+INQqPDbwc6zRs7dubWUywD/QISGrCWgn
         G+b1Z8ijKHG7kRX6Skvo653nQwiJdABaCTtOPuYE23YsGUXKHhj6Izdt3lTlOCeCmJUo
         q5V1COwZFeh5gYQYpsmgKvrjTlyCaofE8Qzomz4Z2x0IYVDPI11Ni4WAnxeyDfVOqQ7o
         1YcipBVqheolrYsY/4L6S4JH6okxBdZP84eZJm2/snHFfkIoRYd5+ty/G+lrIrbdCq/0
         X29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514910; x=1786119710;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uJ1sTQDdzGH3L1I7c5cySgVgb/wH3f6ziWC+LNjIF5Y=;
        b=pvalCqvpPvWacV3TkA3wQTp0Vb8eo2X9NROulPgb0eQhF2AlGbsi8ngCgvoJqv6vKL
         2h9Om9QODnmLXLmoWPVArhjGFA7QUi0VXDJiX+Hcv3/9Gt8uO/JKhpk4FzrB1lKDTg8V
         fTMajXcYVkzd8FYHCRRY4B3tir82KXlMQvlE96joOKz9U7gpt/dgqt3Yy6pDH3LFXH5F
         dlMCCXk7Un+aJdACdN8EMFJQ7pAUdQSk+CyrnGbC4b4eJz0no/k0O4w/3HjllWD9AvQa
         XBXAzuemj/SWOQbOanQtdo/yliTL9clS338ZoQeqqdoEg/aV+Mx40DDK1LuxmmmM3uTF
         ODhg==
X-Forwarded-Encrypted: i=1; AHgh+RpdiY3Ggm6dua0n3p8yMRjpcmOrzsDTc29aD3OgdNwoP/ja0UYf0Bq3i78v3XSc/Jun5dbL/SbD/XoVXw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv2SZ6bjn0HVg/yBkFW1pHSZQo0mEL2orwewHKqy0j5IZtsjUc
	MNs3eNd7EhldXR2qI6Mh+sjgYt75oBBDzZ8qBC8FrFLNWTbfXTiJrjTA2ndyXn8sp6s=
X-Gm-Gg: AR+sD11C8KNCG8t7V1mgyerXPlacAc7jzv+EDfaXs7cOis9hpUFIcJccG4kOA6UNTAc
	GsemCzxuTaw/gkQVxxYStk7LNJuCkpiN2gZZnUxXK81sxntRCFyBs21A27JVG9VxJfzhtayem0G
	Jt2o5jsSy2u9QG81f8+P8oeovuJGTXjNe7/U3ZpSWo+aSVnFUhK6ewrDVwjQRIFNMkcQqpSLuoJ
	recFf3fPx34tJNDm05sjYGdPy+0RgbnyyEREV8sF//Ttii9o9MaqnSCaAHUWa2lmHevkTszPTJT
	79S06xh44EIUMYbg6N487d6gh2p8J8y3vUCiqx0oLbV3UX4vnMKe/b/A/vX27sRjzcfcsg279Mc
	T8SDqB4rOv3/WNUQ20MmnX4hEBAC1jbpP0GUzEjeTQB8VIkv1eHwoDByMZ3Xt6lr5pRXlDvi9PW
	vFePY+wbwud6+UygGcTiHKXnVU3YVLHd09K0wzq9NMaoCgiazp/sE6eIDr23y+NEPXMKi7
X-Received: by 2002:a05:6000:110d:b0:47f:59ef:bbb2 with SMTP id ffacd0b85a97d-47fd72b904fmr539478f8f.17.1785514909845;
        Fri, 31 Jul 2026 09:21:49 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd41e296csm6440334f8f.12.2026.07.31.09.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:21:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 31 Jul 2026 18:21:45 +0200
Subject: [PATCH] dt-bindings: mmc: sunxi: add compatible string for
 Allwinner A733 MMC0/1/2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-allwinner-a733-mmc-support-v1-1-e9209e3f9761@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAJjLbGoC/yXMSwrCQAwA0KuUrA3MByx6FXExjalG2umQtFUov
 bujLt/mbWCswgbnZgPlVUymXOEPDdAj5Tuj3KohuHB0bfSYhuElObNiamPEcSS0pZRJZ6ST8x1
 FH5h7qEFR7uX9yy/Xv23pnkzzd4R9/wAckiuRfgAAAA==
X-Change-ID: 20260731-allwinner-a733-mmc-support-c901bc312eef
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=XxPxlj15S9GHxpbr6kayVJohduiQuJOZXJICcGUo5pk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqbMuaGBEtOXw6eyEAQdb4ueNcKXVnLyzMw+3Ow
 a8chhWa/IaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamzLmgAKCRDm/A8cN/La
 hR1PD/sEk5V/TmB+PixkJKTl+qwb33DuOqRp0owY1d0HZF7hDO+R6nDvpCaUe5T2Ggv5kjSICDO
 5oxaZsYafCk8FDT2kEjEMVEt8ip2q5IaCNCvU6wrOr8XntnbCJV7UAW7QDPEOxhuKET4J7lLL/k
 fdajXh53to6Jb7TnZUnws/ji73UQpptTVgcj2iowcc0/yzxYjENuvx4jh4FNKpvhjYLS+JwvL2w
 MJgvjIB3YVTHyHxFvhC+3rdf6XA47PuIuX1Njj2xn1hKoFsdRvISZedaOWqdENe2dPHcQsDw6BP
 8hJQb9pMAgorYFy53+c0SwdLz/2yS+272cUOGW4mkFY5zUfngSLFhCcA/ObOorfsTtG72l0MOi6
 Jdxe9ZOsWt77g/zNj6nNh+9L+o/Z2r6iIRv2BDJsEZe/JQkVev1vUIeoGQ7mQz1Gk1nv+Ug4vV+
 PCmxP4HikD+k3uaDOeN/tTYB5+GI7Nf4aEN5cwjt9VuXl8Q6474tnY99TqB5abiMt/zikW4vVhN
 ZT96Hz9gCkVJXSeCFxyMFimDrJb/WWhH9e5afLEsy0oPV3hRt+souELk+e/igMJfaqBNYmjgJGo
 EkeOqbsv+NOEiAHdV2BCYd/basqgQB/C27NOMLgF1N9AVz5A4EADDZdnHVBhN4vebI6e6obgoDR
 If7GJB/TYksUT/w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The A733 MMC0/1/2 controllers are compatible with the D1 ones.
Add an A733-specific compatible string, with the D1 as fallback.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Like the A523, the A733 3 first MMC controllers share the same IP block.
The 4th is known to be incompatible with 3 first.

Unlike the A523, the A733 4th controller is not dedicated to eMMC.
This 4th controller access the memory through a different bus. This is not
supported (or tested) yet. It will require a different compatible when the
time comes.
---
 Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 9f3b1edacaa0..9e9610bb1eda 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -56,7 +56,9 @@ properties:
           - const: allwinner,sun50i-h616-mmc
           - const: allwinner,sun50i-a100-mmc
       - items:
-          - const: allwinner,sun55i-a523-mmc
+          - enum:
+              - allwinner,sun55i-a523-mmc
+              - allwinner,sun60i-a733-mmc
           - const: allwinner,sun20i-d1-mmc
 
   reg:

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260731-allwinner-a733-mmc-support-c901bc312eef

Best regards,
--  
Jerome

