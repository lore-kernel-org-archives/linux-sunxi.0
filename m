Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A2A2C9D
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Dec 2021 18:21:30 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so486982wme.0
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Dec 2021 10:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yuM/SdfKQLHrjcyLgHfF3Sato5LO/cQMcLshE9oQn64=;
        b=Oc1glAx9ooL9XMK3XBK3yetsuhBDuKP8OM6GZ59MzIs+PaKJDn+IUDMchSFmbDSvBC
         PnaDnBw32U23IZB0yXjby2F5SiV/dCZoHsAzxQ9TjeNnReylzTLF6TZqLDj8JvblROCC
         xFfCBsmO/w6n9wEo13ChHSS3QFA+eUvdEEkU2p8HCVmQLsj0JWPYXRLOnjgW53NyKAfh
         TPk9Aq3QaowCRIW/qDiQajgc+dpBZGQd2sZMfY0oK9eg4Zr4EkPsZF9Em3BBK8kq4WQN
         J988HMdyPYYvgCJKZkJ5q/241BXIfPUDhvqpKPMC3jaavht0iv04xlxgXPB4uUzUs19Q
         /vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yuM/SdfKQLHrjcyLgHfF3Sato5LO/cQMcLshE9oQn64=;
        b=QS5Oh4F5xWQnqvrahILNUioKde33hkyr2TnCp3mXElWjipGtoYdqpUT2r6wf7WiBvB
         WlhNwpB2B4t/wkHGS2cFmICPn12PqgH1olB3RfKyJY7OXq1QhXmBL6jQNTUE/YL+I6RY
         5Uon12Fv+qcjMWMcAp40teTWsgSUASYjZy+r6qDwoOffHfn40DykndN8jlhmLGYlPY9Z
         jHa1cGZOHZEs24g4KdQV6bFItjy4EonLMF5Rk+fo86gQQahbRmpJzfZpgLihLDM5TefT
         iGRdwuafWC/ibaVYEkoz2Xl/897wXJwgFiemj9yrVCmT+l1nPSi+KHkUybfR0Rb+e298
         0tuA==
X-Gm-Message-State: AOAM532IZomYK2tmWP1RQ58KfRDxXofM3B+w0USHdvCbApHQLssQp4jH
	c5wIb9M/QNrzsXRk4eqC8KI=
X-Google-Smtp-Source: ABdhPJw7zlCx1zFhjTin5TXNN3RE35rMroict+M40JheekUbsyMM2CUyaTM2OpGtkZ+2YqM6eKZQ5g==
X-Received: by 2002:a7b:c097:: with SMTP id r23mr8794547wmh.193.1638382888511;
        Wed, 01 Dec 2021 10:21:28 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id f7sm604705wri.74.2021.12.01.10.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 10:21:28 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/5] arm64: dts: allwinner: h6: tanix tx6
Date: Wed,  1 Dec 2021 19:21:13 +0100
Message-Id: <20211201182118.1213806-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds new Tanix TX6 mini DT file (less capable as Tanix TX6),
adds MMC1 node for wifi and enables bluetooth on Tanix TX6 (no bluetooth
on mini).

Please take a look.

Best regards,
Jernej

Jernej Skrabec (5):
  arm64: dts: allwinner: h6: tanix-tx6: Split to DT and DTSI
  dt-bindings: arm: sunxi: Add Tanix TX6 mini
  arm64: dts: allwinner: h6: Add Tanix TX6 mini dts
  arm64: dts: allwinner: h6: tanix: Add MMC1 node
  arm64: dts: allwinner: h6: tanix-tx6: Enable bluetooth

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun50i-h6-tanix-tx6-mini.dts    |  15 ++
 .../dts/allwinner/sun50i-h6-tanix-tx6.dts     | 168 +---------------
 .../boot/dts/allwinner/sun50i-h6-tanix.dtsi   | 189 ++++++++++++++++++
 5 files changed, 220 insertions(+), 158 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6-mini.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi

-- 
2.34.1

