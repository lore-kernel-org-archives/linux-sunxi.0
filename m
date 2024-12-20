Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1E41BEF9F
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Dec 2024 12:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734696044; cv=none; b=JNcw99xo+6uDpv4bCqv2I8ZeGqoJjo4hP9G7oq4SAmzPVcj5Qp9D+mFOfLUkCg26Xvc7f8tiXWey/cyGdhBhj7nfBgcNmd0xgiaT9R8RGW/WbBPEmIs01ppX5bf2ODUWZJBiNfZBTLTkcVslAb9MPX07VSE+9c1wniDFns/NDTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734696044; c=relaxed/simple;
	bh=WPaf9+f7z78MLonieCgvlL1vPCUCSw7zVcDi3rsIbZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yr3YbWbgSjcVIY/+FLquHk3o4cMdXDcLaZAv+SSZa3eWF+zkmoIFY0UtH5yeIv5vlSqd2TLohAYov+w/UsNxqskiNJm1POhpI+27Ab2Ya0CpvezODcj+ptoQ4Meqa4UPINJYXpmcF/mxsRzcwG7XbtLhEKj+SOV+RYeYFxhkzfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7C9SOcf; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7C9SOcf"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385e3621518so968330f8f.1
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Dec 2024 04:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734696042; x=1735300842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oK8cRe+fHR1VWCxiDadEgLXPU4PatzYvmC0Gyvp01XQ=;
        b=k7C9SOcfkJvKhPXzCmmcP1nMQ3iXLA7AJgIWhyyFeLCe4Qr4mEpzLiNjCw9Qyepj3E
         PWGQtzsCKMJsq6HooXS0hGwVgbYLlV/xUOI8U8SAjuc4pK5pzbvCTWCyshTV3YXsWsWI
         zp23vHqbX4GZMZyKcAS746qrpoO0Wa4H1t14Rzcl0mZggJL6ZBj/cbARIczAOQv2iy0d
         RhPyqo4xM1dJNEltx+UXCLHnFqpenFVTUWL/z/MEz04a0jGbp1/Qmg4DvpweblSpvG1f
         5L7E45QARPSG47v7GF1IPi4QoFg20od8LS9xRwI/k+IX9LKDj59Arwc73beDZ8KqHcv4
         SUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734696042; x=1735300842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oK8cRe+fHR1VWCxiDadEgLXPU4PatzYvmC0Gyvp01XQ=;
        b=BiWMMfz7TA2y0V10hYGC2MxpmBZYG9TlzF7kz7Hu+hHsoKVo8lXFT4c/MBnf5v6Zzj
         LdPq9HxaLzQV3t2OIIqEemXodjxw5ROy0edVR49iBEF350tsvU71SmBZ/NTExXqV1QoO
         eR0qlaUbMGPiLP32PxVbodGWGJQ9JaofhlTGOcnIBMOP7Ial1czv2wcsqbbkMQalDHXF
         NGP5px2PJ2Y1j5YZeRGE+16/+JAAhVzyxZKAif6wO0aLZBAxvmoPF3LsorSfmIVaOj8s
         92jXAW4AzLJTx8O2ECGdKjkvcXjjDGNvTeojXNnP3D4XeJyR4W4EIYkOICEcBWaYFYIs
         69pg==
X-Forwarded-Encrypted: i=1; AJvYcCVE/qPsTR82A9dmTFUSZRuZtE2+49wMrFWjj5bLfDw6qERUe8nBEtgD24CpnM29PNz2gHwuGJ1vMNTbag==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYPTB/rMUt3OwxGZkvCYs5NcurhX1Ha53KpJFbX2kdwo4Astwx
	+S79PTzdftkMHiHvOXo47WY28Fw1O5JSIisIWxuF8pRwEiDbGUnE
X-Gm-Gg: ASbGnctof1DCYnRs0/VboW1MuAytj8d8AjkToZnBCnDfS01hQCfpa6kEGwbMXRqCX7s
	P7lZ/uO9Q08lLPm4HE9cwU0GQBXFXLFd/wPehVo1b7TP2ILLNat5l/SjHIgR+w4J/fJNxCg/qpP
	qgm6tDjNT0WUw4H/VKIG7oGD4fTbfQ+m+Z6s0P3rScKRanoU+yOUEeMtKQPEXYFRHSSK28JoqYZ
	Og88nUBAVBU5w8B+8jLG4sX4MvH27Joo1BDG5cletu1ChX3DGL+oLW9AL3FlaHrBijBAv5aWzTG
	I5jCJm7yzy0MsXAbref7jo04XI4ZC//TTfIx89ZVJyAde852/Eey1RQhyjbtUg==
X-Google-Smtp-Source: AGHT+IHGkBxd31pWu+xtwPWlWhzqK08a5e0QfwzpYag5XqwWVGkcAgvkQ2m1qj/zjZ9WwhUM2P+gTg==
X-Received: by 2002:a5d:648d:0:b0:388:da10:ff13 with SMTP id ffacd0b85a97d-38a221eaf55mr2906782f8f.21.1734696041476;
        Fri, 20 Dec 2024 04:00:41 -0800 (PST)
Received: from cypher.localdomain (e.b.8.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::8be])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8b830csm3921038f8f.108.2024.12.20.04.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 04:00:41 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v2 0/2] Add support for WiFi/BT header on Pine64 A64
Date: Fri, 20 Dec 2024 12:00:29 +0000
Message-ID: <20241220120038.3137248-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the BT and WiFi pins on the WiFi/BT header on the Pine64/Sopine
boards.

Changes in v2:
- drop patch that enables the WiFi module, it'll move to a overlay later

Peter Robinson (2):
  arm64: dts: allwinner: a64: Add WiFi/BT header on Pine64
  arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine

 .../boot/dts/allwinner/sun50i-a64-pine64.dts  | 17 +++++++++++++
 .../allwinner/sun50i-a64-sopine-baseboard.dts | 24 +++++++++++++++++++
 2 files changed, 41 insertions(+)

-- 
2.47.1

