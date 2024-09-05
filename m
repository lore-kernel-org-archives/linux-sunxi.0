Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A70019C579
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 17:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725557845; cv=none; b=SDVnfu/IBK8a7HpdlTIw09RYFsYj3XNqXd730ko2Nb91zIMhE2WsitEoxSubg2nCQiqX8r52nb6rk3kcEWXB0e6wdbhxaIOEX5b26HMFmpcifMQ4TSsXcCKAYYUFirs67OgXKIZSX3mdQCLigWJzctdtQzrnaEQhbvOT7UVZe8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725557845; c=relaxed/simple;
	bh=QAO4zUKegzIVbTCAiUAXPouHjb63cshPgOVmMLANiKk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hATPcsPIjc1iSGvsjt9+KNKsPrIMEMrHpxrv760vc4YHr6GnpMgFsv1fvPachXh2LeKWpEnyW4hWjTIdC78d+H8oBrnXIhlOU7qNa7U/ljLXpSSIP+fkgXWtkIReZN55MAq+HP/+Iw6snJuvSilwN1EfBsCRsNv53nnbysj+05I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnT86sC+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnT86sC+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42c5347b2f7so9142395e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Sep 2024 10:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725557842; x=1726162642; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v6dwp5+FG3mYl3iAH/R5p+Cpn2uLGGqSBL6USwliexo=;
        b=XnT86sC+BNPWK89oXilWxE1ONQy9nOoQMhhlFl3ofKwDQpY1xYY4OTZU/44247oDZ0
         B5MUqAkfrL8Ct501n17hZo7pjnxTvv/ij4DFh8xH4tkeYa3oxLOuY7Q1pu5yE1yP88wo
         Vhf3cardp0jC3cbCDkHj0O+vdvm2bqg76czacmRkrjoqGMtuSCGUfLra4hdg2qf7jPlH
         IMtXiw6lmIuj1lmlTihC3MWyIRkxO8ctYzKaaDy8TvFKpszowKtG411kfWqJf6u1hb2q
         5L76gya4g0YguoJdWDJFWFiSIyzdWRuRJmSeoUuVzuz5AP89182qQhpUrBHiLVc+WMro
         LuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725557842; x=1726162642;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6dwp5+FG3mYl3iAH/R5p+Cpn2uLGGqSBL6USwliexo=;
        b=gd7K+FQmyxnWJEMe8iLnurJdRGmWYRWEnSf8nFMxvacYjN6W6g+8mPq9HRH6UsyiW1
         jwbgbd1hAPWYVhEB3K1vT5JPKUI+LI9gKvJqvph6JLwd8KPjvx/RY1T1rpB+3hrzAjcl
         AHy/+5caDWgkH8cjYHTSix1iHDCAL19ex4C4DzAxK7prKHul46ZYLddtWa9vJu8G6yYg
         fTdO2HhF/PJJYftwP/umasD6yuHuUAuAX5omTgwPAxVvt0AD4Fp9Ipw+koDsKiLcx0zI
         ybgvl6iYn1Gzcz5W6OfwP1CLMECyOBK0D8DTp09lwHggKNT6Gxfy0FDMWIDPp2288VxV
         TMUA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ4WX53PICEzn1kZmFQ+uIiFoB6i4kAW3Dyy5GcGnkP9H3AmLer09dyTKiBx5XOSm6tqfRTwGAwha5Vg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo1p0N57K8oUCundTrdjzkVzmVCyGO03nehe2YvlFuC5H7CMO7
	BfNyL9vHVZM91B8fKex1rPpYXAgkXapTKLm4KZ7WaA2ENk0LARUs
X-Google-Smtp-Source: AGHT+IF7qL7hjpQRpe8F1oifMTqAJQN8x6pLigqqQWNP8W7C97x0zMgdmF7381zQz86A7gmatgOVBA==
X-Received: by 2002:a05:600c:3b11:b0:429:a05:32fb with SMTP id 5b1f17b1804b1-42bb01b4428mr160392165e9.10.1725557841763;
        Thu, 05 Sep 2024 10:37:21 -0700 (PDT)
Received: from cleve-worktop. (85-193-33-185.rib.o2.cz. [85.193.33.185])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42bb37f7849sm245704605e9.7.2024.09.05.10.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 10:37:21 -0700 (PDT)
From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
Subject: [PATCH v3 0/2] NanoPi NEO Plus2: Fix regulators and assign them
Date: Thu, 05 Sep 2024 19:37:09 +0200
Message-Id: <20240905-nanopi-neo-plus2-regfix-v3-0-1895dff59598@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEXs2WYC/4XOQQ6CMBAF0KuQrh1Da6HoynsYFqUMMAm0pEWiI
 dzdAht2Lv8k//1ZWEBPGNgjWZjHmQI5G8PtkjDTadsiUB0zE6mQaSEUWG3dSGDRwdi/gwCPbUM
 fqPKU89wgF0az2B49xvMuv8qYG+8GmDqP+uxJqCRs9YON6oGO5DY4wMyBgzJZo2otZaabZzto6
 q/GDdtKR2Fy/ru/P4tt6/+ns4AU5F3lhURTCKNOZLmu6w8AcuOWFAEAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725557840; l=782;
 i=cleverline1mc@gmail.com; s=20240824; h=from:subject:message-id;
 bh=QAO4zUKegzIVbTCAiUAXPouHjb63cshPgOVmMLANiKk=;
 b=s3bCCIt5WLyYQ6C/5gtmFO/gtd5JWGKczWJGLJvZzX771vKcV6GZEfFZ8h4SJIugdb4byUrNf
 MXegnWlLZ3hD4cOIv2pNkYjgcRNZ+ZDQ0KGlBS9uVusHHMMsVhPcF/z
X-Developer-Key: i=cleverline1mc@gmail.com; a=ed25519;
 pk=CQifx5FUgTQKAoj5VCYrwYHi235AkXQ5yT1P6gkaBxM=

Just minor changes based on feedback.

Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
---
Changes in v3:
- Renamed patches - added prefix.
- Remove the patch that added regulator to emmc.
- Link to v2: https://lore.kernel.org/r/20240827-nanopi-neo-plus2-regfix-v2-0-497684ec82c7@gmail.com

---
Kryštof Černý (2):
      arm64: dts: allwinner: H5: NanoPi Neo Plus2: Fix regulators
      arm64: dts: allwinner: H5: NanoPi NEO Plus2: Use regulators for pio

 .../dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts   | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
---
base-commit: 6f923748057a4f6aa187e0d5b22990d633a48d12
change-id: 20240827-nanopi-neo-plus2-regfix-b60116ce12ca

Best regards,
-- 
Kryštof Černý <cleverline1mc@gmail.com>

