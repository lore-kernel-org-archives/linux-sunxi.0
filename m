Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93450221540
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 03:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772681653; cv=none; b=AYw5tlQbyeb6Ctac6xmVZ07rqwFxEx1pVC9pBWi+jC7/A4Sjg+UuG+Fw7cI0FaYbbOHGxJ6Ij+ahAjwSF4stb+N4jSnMTauj4OHKDRTD82vAe25zXIMZx4x8kB6B9QEiELDY1jP6P29omN/tLdgVUOvmxO8fpdSOBoyDwfZrDpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772681653; c=relaxed/simple;
	bh=NMf/UuC+6nAcyqNjQFRCqhg1UGaJWlr8nrgTlWj+vis=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SwfXzIPN2qUkADNis7cF6BgQmou2eiWBfyOgUtspYx9hDY87BCM7lDIaXSzUA248lvb8lXg8XBRbEKCuQFQTjcPr7UDq2/OoVdfFcf9PDYDehPa2xjsmVrMLUtwq1aN5FWcQ0WelRZeqaiwE/vY6QLbAtDAD8VkqQnIIWEma1XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uhon2rv4; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uhon2rv4"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-506a7bbe9d0so54871351cf.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Mar 2026 19:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772681651; x=1773286451; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lRmZpXw1Na1Jt0sZYZ3Dk4vuOehC4OWy1CGhTN9jzyk=;
        b=Uhon2rv4CT1y/z3MxMdxUOZI6ErgJ3nb5B/Sn2FbPfJGZa0A+Erfprkq2195x74BBX
         IVzoH/c9+o53YMqufJk7JzKbt7i81kzEK8d2T8pYqQRit75ErHZMCk0NzKWIR4JiCo/z
         aS3hP5uaZa8aBCVP4912YL2jGIfWmQnx+l6cgb8zP49KdRkDnz3SBBRxuoLHt6d/Q2Qy
         0tdEzuRH0a67CHf9uLjogpx5awoshuJtIaxVHGLLZZwGKhLZyt0CMj/YaEitZ9bLpv5X
         gTVeOZQesLUmcl/GHdBvaBExH3XXWqZCRN6OOHsQ2eFU8DhvR5+sr44RrvGNQtxafvtu
         mIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772681651; x=1773286451;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRmZpXw1Na1Jt0sZYZ3Dk4vuOehC4OWy1CGhTN9jzyk=;
        b=BiX9y52h83aH6gLhsc42uL9+4kvl4RBO8NgNKHJ2qXxZCQi+SBg/nYQ1SmHYog1ZmX
         sOWCTO7wV5o03SuNcBLB8qwehAgJlelc7FhNDCyorxm9GlmQwPlVwsuJKB1sV6iIKP3u
         8H3Z10Q4K6nFfgpOZDl76m16J15b6JsS9kL7qq4/QbEAQ7k16wkGM1BdXWjLDS0CN9v0
         sMy00siiOY5w8suXf4Flbq/sOaHvT9dTp9X34Ti6IuSmQ1mw/RkPTimGlcQU40OcrSTl
         YboezdCLlZTIuoCpBqV/T8SJQPIHr6/IbZ5R54zHeVw5WswAU7Ger4eloveREQd+1/zK
         fOIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMWXDuWzFzynpIoXOC+dFkJ/26pVP05Q0u4Mzq7kD1xeuQHkY9raps0Lz+IXU6y8K6QFdKb25NHaJ3qQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywhb/+ypUOHbmfT3+EDJfMdv0Pp+UescguKtUngCFrIL7v0FJZY
	6I53HjCthyduq8VBLpNG4FhK7sYx6vC3eHyJKlQlz4pX2koL4ioHL+H1
X-Gm-Gg: ATEYQzwxOKPxLBvug+CqyMW/nQkNpQGR4hGd8bzsjqE4IvZnM29pctd8P8dRnFwFCA5
	VQNFKrlSsBi1wyzL4hM0PvdVd/AnPJFCVk8T63SMcTgy2hO2ur6xNo4IMTh+H5dxynT5H7VSkdW
	//lh06vg8an++GNJnIDv0d9+NMgqQ+52hcQQ/v6iWbDQdzAIjFqsxo9Ic/1uVicJ3KtQ32xxezx
	ly64wcPYVSSF4HpBVZuE5aCV1vfStdxo4FpoEtmd4TrTSvQa7sXIkKbwdQldXmHOwD1Igbzx87k
	ORIowy0Cqx7V17ytJIJeYy/j7J5lxfeVBHkQuIsKd98SbtJn+6Z/NVewjZRXokg9fift2jfk2Ob
	rzamKgYJAjukYy6ONA687kpCRcpZ8Ji/B98XwVj1wp2q8nJL++OV8bB4cCe+48ilD16szUSeeSP
	ouUUww8ffsXPnpXyIcLE+9Awb7OKUpbh4Cwf/b+A==
X-Received: by 2002:ac8:5f11:0:b0:4f1:dfc8:50b with SMTP id d75a77b69052e-508db3fe6f9mr57487911cf.76.1772681651474;
        Wed, 04 Mar 2026 19:34:11 -0800 (PST)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449630b6sm190667601cf.7.2026.03.04.19.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 19:34:11 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH v2 0/2] allwinner: a733: Add A733 PCK600 Power Domain
 Controller Support
Date: Thu, 05 Mar 2026 03:34:06 +0000
Message-Id: <20260305-b4-pck600-a733-v2-0-ba6bbed7d253@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK/5qGkC/3XMyw6CMBCF4Vchs3bMUCoXV76HYVHKFCYKJa0hG
 sK7W9m7/E9yvg0iB+EI12yDwKtE8XMKdcrAjmYeGKVPDYpUSQVp7DQu9lESoamKAvOqISbWda8
 bSKclsJP3Ad7b1KPElw+fw1/z3/qXWnMkVO6i2fVdba26DZOR59n6Cdp937++DMi5rAAAAA==
X-Change-ID: 20260304-b4-pck600-a733-1790e0e48d49
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Hi everyone,

This series is to introduce Allwinner A733 PCK600 Power Domain
Controller.

Allwinner A733 has this one power domain controller, PCK600, which
shares the same BSP drivers according to the package provided by
Radxa[1]. Unlike A523, A733 does not require the resets, and it also has
different delay values. Apart from these, driver wise, everything else
is the same. 

Add support for A733 power domain controller by making resets optional
on sun55i-pck600 driver, adding A733 sunxi_pck600_desc and dt-bindings 
definitions.
Tested on Radxa Cubie A7Z.

[1] https://github.com/radxa/allwinner-bsp

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
Changes in v2:
- Fit the pd_names into two lines
- Link to v1: https://lore.kernel.org/r/20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com

---
Yuanshen Cao (2):
      dt-bindings: power: Add Support for Allwinner A733 PCK600 Power Domain Controller
      pmdomain: sunxi: Add support for A733 to Allwinner PCK600 driver

 .../bindings/power/allwinner,sun20i-d1-ppu.yaml    | 17 ++++++++++-
 drivers/pmdomain/sunxi/sun55i-pck600.c             | 35 +++++++++++++++++++---
 .../power/allwinner,sun60i-a733-pck-600.h          | 18 +++++++++++
 3 files changed, 65 insertions(+), 5 deletions(-)
---
base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
change-id: 20260304-b4-pck600-a733-1790e0e48d49

Best regards,
-- 
Yuanshen Cao <alex.caoys@gmail.com>

