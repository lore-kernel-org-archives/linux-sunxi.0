Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF1D4AE8DF
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Sep 2026 16:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265962; cv=none; b=a4Roddzeqb078Nsho8GU7VnckhUGMziwXKdw7zEERsgyj8iaJw5tdTQUId+KbnnG8PQDRKIgCvBTdB7eLIjGU+iRMbeWxPzO+HkakLjxwrruKKWGJRZBTRJ51BVgpCIMb/X8KbgP1UtLDtltYb12wSb05ix5TGcFOfNmS5DIfjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265962; c=relaxed/simple;
	bh=3/FB35Hu5fJEEgD/yBfAAnwDqio0JQJdSJzCduCvMyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y4/63IIFosK+98rMajHZrhrsOWlJBc2u8qEj8x+QfITE2kwj/S3m0gEe+gb5/Chqyngy2ujY2u2nfex7McsdkmTtDZDYoBOV0wydpZIcfTgoC4zWTAM3N/yCwqX+DAlYKki4EgVQ+HFyG+h7JxcyNhGxhwfj2NrK0ZvK4dEw6Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HiTGtN00; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HiTGtN00"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48442ea8f59so522941f8f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Sep 2026 09:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790265957; x=1790870757; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wm09KZgtMDDuRCaDDlw1bVTO/lDdGx5khYMsZ7nf5Wc=;
        b=HiTGtN00PRPRIVbhPC9B57l7pyDPcxmohIifAbl0naIjlWO6QOlVuKbJvEj+37YUfD
         AzwOndf/zus/j+0bhtsgeHPSgRVV4s1/w8xdo55g7AHlko0mt0vhwEKahy2Jc1l1o7pF
         AUGYEOZPoR7GOHk5VHYF1AlMzxjjLfoH/GRVj+/zTzwERBp4e3Gw2nE+OOlDEZim2zFS
         PU6TftoOqz8BDEy42A8xS60Lp5ojynAHZ/ekOmRNCVYz0ElyACagB9TXwTw7dw0AS8Mz
         +i67IJLmEm9xaJQmydODw97dkC/H5n36CleotsE5BewZWjFozRkBu49VUG5FMJ6P6aXc
         QjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265957; x=1790870757;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wm09KZgtMDDuRCaDDlw1bVTO/lDdGx5khYMsZ7nf5Wc=;
        b=er3QTO9Qr9WSIxdZFc/De6pfUR7sVmD9hZjWWEZr+9PHLTI6V/MONg9doA5JIXtk0H
         Je1eb+hYKmNMNosNbyxGvHainWrtSezQ0P0dvosKN6q0Ictp+tWYgpG4w/1Ti6IvPx9h
         sY9b/5IpS03dGY5tfDtsB4jdZCy0Ny/u2FH+vnNl7sUwLYDWRETbJkGcZ6dd+5cSjUTl
         Fqq12XCZZQvv8fGNUURuR5/SWMXzpVMq4Ewfko43dQeJRIqe1a7Da6PFQaY5/jaWl/ay
         VqKhFFTLGVx3Uif5KcynOEHkUv5nRe6komk2AeYH8ht2voNNfbdqGBzqFtBTlkqXVI7j
         gMAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOryKgpzyhIcN57qPJDNEqokcM/RapK6b91GS/vfV1vSyTr295hDuRJKPBDnF+ph8PMviTWZQrRtwC/w==@lists.linux.dev
X-Gm-Message-State: AFuF++nTX689KHQZWoppTtkWSiGgO2FMoQNV0yAWkfhTzOnzuoXwFLkV
	SYC2WFeMg3JzPv3OvBTalvvPpJb/agT0cwx5tQDEsjrOs+TjxK3oZEN+QYxcRi8+R4o=
X-Gm-Gg: AYBFou0EWaTh+efEskuk3aA/mA3Hic5okzx9f2ysUx38FNtEb7bln4cDiqvBf77o7ff
	rHCH6kME6obn/bym8zKrGalapdw66cs8oyLt8Zy6h0A41Z4MXdpEZodkQRznWP+kVZG1SaX9+HQ
	0cAa8ZrnrFxUxKLA5UFG/ZZntePa1koFkHNwh6QxrzW2qNjAMJ4eQ3qE6HjC5j2Ee71GqjxEox4
	cTMTufLRAx3F76G0X+gt1wcXXeHVGgmUMH7bsMPqTg2vZ5aVo0X1u1WMze0Eq82mHEfQiMf70YU
	QAF+qpzEk3rXmzmaakJMvpgJgDQiIAm5NCF9uXB2dWEqJI7ugqFEVM6RLmxJ7oD9tqxb7jDI4A/
	uwge/MYSExEIWgbHJI24gYfS4V5mntvVGnSz1Md+bvZsi+3HF6c4oueUsccQjPT39GrGa6RnuCL
	7gK17q3byqsXzNhVtuyRG2OVV7+PQjSFu6fvdwNe5C3Ymuzzd4rG+Ls9QDDQrKpGPG8AJfdnsev
	xkfolpJNhKFybKv6g==
X-Received: by 2002:a05:6000:2083:b0:487:342:eb28 with SMTP id ffacd0b85a97d-488716f2354mr5536245f8f.24.1790265956591;
        Thu, 24 Sep 2026 09:05:56 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a314sm57278f8f.6.2026.09.24.09.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:05:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 24 Sep 2026 18:05:50 +0200
Subject: [PATCH v2] dt-bindings: i2c: mv64xxx: Add Allwinner A733
 compatible string
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-allwinner-a733-i2c-compatible-v2-1-0f5f1e9af969@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNSw6CMBQAr2K69pl++BRX3sO4aMtDnoFCWkQN4
 e4WXbh0OclkZmERA2Fkx93CAs4UafAJ5H7HXGv8FYHqxExyWfBKcDBd9yDvMYAplQKSDtzQj2Y
 i2yFIrZWWQvMKHUuNMWBDz0//fPlyvNsbummLbkYThh6mNqD5fUpe/vnMAgTkRaEynmfS1vXJm
 ldHNuAhWWxd36SP4JTZAAAA
X-Change-ID: 20260910-allwinner-a733-i2c-compatible-2883821809ec
To: Chen-Yu Tsai <wens@kernel.org>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=3/FB35Hu5fJEEgD/yBfAAnwDqio0JQJdSJzCduCvMyY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlbvZLEvbbuS573+cXazpNcRs3727Jq9WuvrUlsuc5vP
 GnLHkHzjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEwkmpnhD5ehIO+29na1ioXR
 63k5HTw2v71i8Pl26+GTAhOfZcwrPghUwbUw1KmsP3f/qr7Hzytu9q6t1HhuVLBFL95OeZtoRQQ
 DAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The I2C controller IP used in the Allwinner A733 SoC is
compatible with the ones used in the other recent Allwinner SoCs.

Add the A733 specific compatible string to the list of existing names
falling back to the allwinner,sun8i-v536-i2c string.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
This was tested on the Raxda A7A while enabling the AXP318 PMIC on S-TWI0

Changes in v2:
- Collect Conor's trailer.
- Cc linux-sunxi (not matched by MAINTAINERS/b4 by default)
- Link to v1: https://patch.msgid.link/20260707-allwinner-a733-i2c-compatible-v1-1-566340542bdd@baylibre.com
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index c4efcef59133..2a9e723a724f 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -34,6 +34,7 @@ properties:
               - allwinner,sun50i-h616-i2c
               - allwinner,sun50i-r329-i2c
               - allwinner,sun55i-a523-i2c
+              - allwinner,sun60i-a733-i2c
           - const: allwinner,sun8i-v536-i2c
           - const: allwinner,sun6i-a31-i2c
       - const: marvell,mv64xxx-i2c

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260910-allwinner-a733-i2c-compatible-2883821809ec

Best regards,
--  
Jerome

