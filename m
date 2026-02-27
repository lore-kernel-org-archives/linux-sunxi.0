Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8361544B68F
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Feb 2026 15:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207896; cv=none; b=oZoNu2w0bkiwK9RE1RJSB8PYhD9uLWPPkyxuk1MSchnMZrgSv91ov5WoMiFiMe0tkXmhuEPcL+e61J4F/ch0etWQRgl0cBVY5ADzJYoNMVLkTjL33B2KpuUQ2OskYitY9zbaNNG5SRiStTCXKKG1vHleFus6ddDfOlIB6xTJf/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207896; c=relaxed/simple;
	bh=XdU3nfAUg7NOuFYXw520PUWUSfgQGz35Uu6SwOu+Hus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kP1IqtKmCaVyoNA620zZrE2fkPbmcu20kyceoB3ULUKJdhsVbY2psh0aMWMvNuZr1N/vKBAAHWjdTERFBL4wDt+wkZu7dWx05ZsVo0CgXOXoNh5BFsii0zfGG1hlbReUlxJEH/XWdOMk6xDL0EtigXQXE843OnKWlR5rqQ2j5JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FM9mWcQ0; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FM9mWcQ0"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b6b0500e06so2843868eec.1
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Feb 2026 07:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772207891; x=1772812691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dFaHfPFCueb/MdBlAyf2+ElEWghzCTWqL/iqfEI9oM=;
        b=FM9mWcQ0hsTDhKxPe4olaX4d5hf1APNpCIxN5cMKw4u1+Ef25J+5sQ/jfb/RBRC/a6
         ZCNT763aVHfKtesjXvfealyZp0ZRMUhAzUNpinEkhHwYZW94NFdQTEUl1DVbfTjF1j5l
         DwZ9qObd6Od6npmSET+rXk9FBMuZNMGy1so4W3IRzq7ywhOruBhtSoiofVn8tdAHK2vw
         AeTWGqBZ/ZimEGh5hRDIpiaYYaXXVQV2yr5gGsv8+dVdPh0KPpNKUUjmO21Jjzh7EJ/Q
         CUYMtSwCyaUa260FsH1EVFf53QjKnKoiw6C5+/L46wNnvZdgQcKP02HM9/HgiZ6MsZJF
         adWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207891; x=1772812691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+dFaHfPFCueb/MdBlAyf2+ElEWghzCTWqL/iqfEI9oM=;
        b=fYwGlo6pAZwXOcJ/jW8TyzRRI0AV23OwC657sFlrIe6Z89cipOiHnAxIJCY/+MGqDE
         XNVs3u0xHkJ/4YUN/3Dx50cYDIQZQSAtQ91ZfI8jKBUxDlqfiw86udAv7qv2d46miQ6o
         zYcolQ7jNF56+CcziA9N/IC98yxmPPM28NnhIgKDA+9p9NFudXUBb3uXzqNOVkVDksot
         7gRKDZUWaUai/sa+NmiGIkerAJCKaEqxC3vayQqP2hrADFUq0VAc3jdQQoGLiDunDvQK
         351VEJTl+eVKR07NljovHUrQXreNg4rt0xegTBg5Y+jw3622qpvBiJ4CJl+Ce0QE/slH
         sycQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTTkvZt1FIivfwivJ0rqWMIn4BqoJgPIuvfP4Eeyy+erYvb8w5cOFL84Y3uRQizviczBA6pvHotyN02g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFS27YGpOKGn/WmiwCweEVqrv0TiJVQ5ZmFg7Uy+NDhZuCt6vw
	VVL3R5sxuwhbHOGlEipG2poFHBBhHH2DHagE4jQvwS+YkE/cIyobLBrZ
X-Gm-Gg: ATEYQzwxpFe+Pl6nHg1zU6oYH29orYfmNxVYvtn4eXJRnudWK6GmRkjFZhqtUhZG6zz
	PcSdGK6OPTOWek7wAqZFrP09uQ2dsQmw0zWdyOBiGnA3bba0fm6DSrbLDDD3U98fMkkGXYHvF53
	KmUZdgHccMr58dGg25cQDKRZ+qFsJ+5FEmFBvr0BbCpU4Mhw4pT7cAb8Js0FDQsBbikjDyPIdhL
	NYEHvPuDVFqaG2Nqy4+vv1OtglU8KcOFw19BFLvFlh4//rxSew/VYUgLm7SgmtGzPvneCoVH5yM
	BjCM6O82yO59N1f5iEz8kM/V/5naYanhd31GpX2NyqcXAE0eT+dw27p3OT2Va8cnuv3/r+n/4wq
	Cq3E5GPZWltAG88keXELUQLrdB0cGS6IGIOEwzSbT9Ywj79r7otOZO988o0jhBA4/K16oVf7KCe
	Bqlj6U+z9wrRgXCnvLvRsl8FC7kmR7tAjI/T+aExsNrqeOvMTt2vFD6kQiqG7qpvzN8Td8WcC1
X-Received: by 2002:a05:7300:ed18:b0:2b8:2910:dc9b with SMTP id 5a478bee46e88-2bde1bb2712mr1314460eec.3.1772207891266;
        Fri, 27 Feb 2026 07:58:11 -0800 (PST)
Received: from arch.localdomain ([149.34.251.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1cf0115sm3833508eec.8.2026.02.27.07.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:58:10 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Beijing Ultrapower Software Co., Ltd.
Date: Fri, 27 Feb 2026 23:57:58 +0800
Message-ID: <20260227155801.211376-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227155801.211376-1-jerrysteve1101@gmail.com>
References: <20260227155801.211376-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Beijing Ultrapower Software Co., Ltd. is a company focusing on global
mobile games, ICT services, cloud computing, and artificial intelligence
solutions.

TaiqiCat A01 is a blockchain-based terminal product launched by UQSoft
(Beijing UQSoft Interactive Technology Co., Ltd.), a wholly-owned
subsidiary of Ultrapower. Its dedicated product homepage[1] was once
hosted on Ultrapower’s official website[2].

It should be noted that UQSoft's official website[3] is no longer
operational, and the company appears to have been discontinued.

[1] https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
[2] https://www.ultrapower.com.cn
[3] http://www.uqsoft.com

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..bb16ae90a4f6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1731,6 +1731,8 @@ patternProperties:
     description: Ufi Space Co., Ltd.
   "^ugoos,.*":
     description: Ugoos Industrial Co., Ltd.
+  "^ultrapower,.*":
+    description: Beijing Ultrapower Software Co., Ltd.
   "^uni-t,.*":
     description: Uni-Trend Technology (China) Co., Ltd.
   "^uniwest,.*":
-- 
2.53.0

