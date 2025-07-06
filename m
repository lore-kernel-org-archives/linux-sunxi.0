Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75A54C83
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Jul 2025 02:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751770634; cv=none; b=uSNNLkCATH+VrdK+jP84beN3fKSgcC+zT1J+D3Y0LvI0YnLZSau5P2rd7RrMApTFqIOUTM1bA289lNshOj5l3Kpro65nQZFagL+VTcoHuy1adVJ9Hm+GjemdZMzZKj79eOZ8YaTe93110qB82eZCjKntuHMjHBiYc0xs943hkQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751770634; c=relaxed/simple;
	bh=CGe/rgczZVclez4vXhm9vtTagkppEerQab5ddWg0Tgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eR3fkqyzCnq6gyTgwGEI+/ojREwRDROQ2DrxuET7sf9ONIai0AQAQGyIQSWzvWHvOj1nXotUlwDn0J3cPKzmjNkmzdunbSLY2RFAso/K/ieOLVLHvdVuzKAt4LDLxkiVRhM9fhgXl8wUxm6xJakdmQ33d290Bf7yBKlYH/emoQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uk/uXAAW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uk/uXAAW"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553e5df44f8so1866815e87.3
        for <linux-sunxi@lists.linux.dev>; Sat, 05 Jul 2025 19:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751770631; x=1752375431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn7t5Vn8pMvyg/GganPpfVWGq9uNzUBvg+YEuGMms78=;
        b=Uk/uXAAW6wlZFGHB860qamiOwyP7yiUDcIMovkFqvbIxfkUm/NKQ5ZeeSvQGbvx2+T
         vNvr4D1QIExX3z9ygL8jzluGRIktUg1EVyLFPK1k/ugdiXqu4dZ1OD8C9Uj/T6aWtAzo
         jLjloXcmOG5qodi4eEsoTxphgEs8FAONwWdhGx5DshWa8ndNc1d2Mzhw5gbRNSWbZ/l3
         nzEjvUWBSi3La0X1KNcc6ftgQl6j0Ob1Cosy8ZCxdKrSCPts9j8W7Kpu1OHNA/CHSJyR
         QGPJRP4bOWeqgrtYt3vX78W8DVW2gM3DZp4OZ8ItM4XwC3feC9AGqTu0YMD2+cc5mNo/
         aRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751770631; x=1752375431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rn7t5Vn8pMvyg/GganPpfVWGq9uNzUBvg+YEuGMms78=;
        b=wG5GusWUYTp+YA8C6Zzq+5zLBXevrR+E9RlBvkeOx9yprD/9ZUtin8htY/2H3Qin3a
         LnZoiGFTfs0tHY4O38XXRnYu0e+VNGJRpAtk/r/Nsuppp0zZ0Acyt2EQ7XQqF2pMNydK
         YTYyN9K4LMmsrJxNlgMSteY0KI8r7tkzY3YVHlFIwYVUjPdWkoDf4zuJdGmJqiVjESzH
         Y+75srhfit8xKl3nVSPrAoRHhtspqEI2JmfFzvDveXKr38nnarthcWXEokjg/6HS8A5s
         UGAlojDywzC5Rp+NLLEzvFfiby+NDqWmZphQsxKPIzrLUlmA3idxvJGCF1D+DdWJGcWG
         NOoA==
X-Forwarded-Encrypted: i=1; AJvYcCUk8yAu85HoAc5iwWTucO9OTlPnhLanMUq2osmo0K6jd2xQ3wgnYlrNUN7+P25n/QXY8P7n6vu5cnHrBA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0xYNE6WFmVXznrJxwuEBCoi3U+m0KQDlqriRtyUmMos+djSxr
	uDheIwuoVtF5lAHQTKN6sjCd7r2Jmp/nbUIhHXHd/1xM1D7Cof5+H1iT
X-Gm-Gg: ASbGncsu8uif5lQTu1n119ibEkIMyEOBUlESwRI6vtA+Bq9kVfOUXORgM0RRosbWwF0
	+malcufebT6drs8HfHtsirNhS2StOSkNJpyeT2OgogGFNCkb/FLAzXwntnLHHeAAmstOblm7uDs
	3bebST45YdiU8eIpUP19TMZIr4X6nc5PTz9DocGqPh80z2lSzej2ijSkknxwKqhedYtsLhf05nv
	bYurntjzp9qtw1yvbyYfb7+1Dmx7XytzwznErNpgYLxrWwfzzQqg4Pjjd3XvwCNGoJOvggik0OH
	2ipIIUxJDjJ5pSvQzGG5BoCrgyPEqUanUg3DEVHlxasIt+WhaDXYhv8cZ3/c1M2jyCfQc6k=
X-Google-Smtp-Source: AGHT+IG7c6DkgUdK6MlS+lGxlxrwGbt7Tzq4+q56B2tWzJqubkeFQQPt3FbCuONr9HeiGCNfS1d13g==
X-Received: by 2002:a05:6512:ea5:b0:553:a32a:6c2 with SMTP id 2adb3069b0e04-557a1235e5bmr2012238e87.6.1751770630659;
        Sat, 05 Jul 2025 19:57:10 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b7b4fsm788573e87.198.2025.07.05.19.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 19:57:10 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: sunxi: a523: Enable Mali GPU
Date: Sun,  6 Jul 2025 10:56:21 +0800
Message-ID: <20250706025625.2707073-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

This patch adds gpu support on devices with a523 processor. Since there is
no support for image output yet, the gpu is disabled after boot up.

$ dmesg | grep panfrost
[    3.826968] panfrost 1800000.gpu: clock rate = 432000000
[    3.832305] panfrost 1800000.gpu: bus_clock rate = 200000000
[    3.838353] panfrost 1800000.gpu: mali-g57 id 0x9091 major 0x0 minor 0x1
               status 0x0
[    3.846050] panfrost 1800000.gpu: features: 00000000,000019f7, issues:
               00000001,80000400
[    3.854134] panfrost 1800000.gpu: Features: L2:0x07110206 Shader:0x00000000
               Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[    3.866011] panfrost 1800000.gpu: shader_present=0x1 l2_present=0x1
[    3.874108] [drm] Initialized panfrost 1.3.0 for 1800000.gpu on minor 0

Tested on x96qproplus and walnutpi 2b devices.

Based on v6.16-rc4 with patches:
https://lore.kernel.org/all/20250628054438.2864220-1-wens@kernel.org
https://lore.kernel.org/linux-sunxi/20250628161608.3072968-1-wens@kernel.org
https://lore.kernel.org/linux-sunxi/20250627152918.2606728-1-wens@kernel.org/


iuncuim (2):
  arm64: dts: allwinner: a523: add Mali GPU node
  arm64: dts: allwinner: a523: enable Mali GPU for all boards

 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi    | 15 +++++++++++++++
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  |  5 +++++
 .../boot/dts/allwinner/sun55i-h728-x96qpro+.dts   |  5 +++++
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts  |  5 +++++
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts     |  5 +++++
 5 files changed, 35 insertions(+)

-- 
2.50.0

