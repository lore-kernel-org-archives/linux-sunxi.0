Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9572BEFFD
	for <linux-sunxi@lists.linux.dev>; Sat,  3 Oct 2026 01:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790990839; cv=none; b=XAtMAsz2bLU0A9FUZdtEw2QM6TJ8ypO+xCnUX9lTCRU0i+nweFFzpWiaBPa/8sO2RBLecYYcLnUX9mhaDshRtuEmLbNdeokh8CZucWkqZeg4A37uEE+X4KBSTNWrTz/ckkrs4272WqotbbkR/dntPneMsJ62Bx3kc60yvxU6+aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790990839; c=relaxed/simple;
	bh=xzGuW9gBVTdyd8yJ5Di7BkVfGMr1p8p6MG98+qrsbh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R4zEw+iwmEClYjE6caYrRZoQbTfkgbCbVzm+MkF2T2vqc8zN1w48vDmDpgnkjscP/Az/sNEFZIApnuWxazWGM9OE0WT9HBNaQVpT6RYuxY5GrqEH/NUSaSMPiM8Z6zG0nejBD+tMXtJKPpnllrHiTcZaPWSlAeNAblSJBiwnU/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-344447f9c3dso121567eec.0
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Oct 2026 18:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790990836; x=1791595636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/BU06CtUrguuFA4ph2pK8mOWJDR8MrG8VSMsF7a8eg=;
        b=nb+sY9DJXzASTR4TO15p+jrGAkcvgwbILeujqop8RwXXNggxzGzO/iDeii95kTc0Qx
         QfdmYkJlL1JoSRrzLy/pwRS/VrQP6EyYpgWPW+TS+35ShT3C2gXum2Fx+bUfxoqB+ei+
         id8bwejLPEX6HiSfgof3pb4Ij9YSip8Ig7+dJb5NFW+6g7ypX8X1SBclnPZ43HYgPyyP
         tyW/tqCUU341U1PqQlhKuAA6TimyYKIJ/YedjmnV2gepiBb5np7GvGmiOoKRmXxsKP7o
         Wcpcl/ajY2IRgdrCxFc+W2v1k/x/PtwtmOhnNMIXOa9B79Wms1dMQQV8gKBn4sq/DQlP
         8LcA==
X-Forwarded-Encrypted: i=1; AKwUvBwvTx5DheGMyj++Qbs7lx0QoYVMT8gVZsl/xUbV7uwvG7/K8UG1TUpOG618GYIarCvrT2568KS2EiPA4A==@lists.linux.dev
X-Gm-Message-State: AFq9FYJETDuZ4BCmt5DbWUR6v+pharFGPFrjmZ+coi00kELxdXg2Jxb8
	Ze4sRZAmzA5zNG8OlYFcgxKWinRaRc5xoII83LKQKyoaQigj/LEKeKZx
X-Gm-Gg: AYBFou3UXtOLrOGPbd9ZkjJ5tQzdkNSAkTn4vVhBSuP80l2cQhBDOGRgPJquOHRlr0a
	ywiX/ec3ElM7Ul4QuDpK+WckvbKm5JZ474IXlTWGMtku6TfNrzyfHo2l2Of/p2s9jthEyLikK12
	/fX7df5guIzXCXp4AWsyKElKl4hioeCJUevBcyWtP88y7MzWIRWF/IfWPnUUXLnOP+Kb03m3ton
	MH58bgLSPH5Bmx+wf6yh+Li7+jgZbQz6w7x/1lIbWhktlOBsuwqLzt5vyqlU4Qc9fkkODXeHJ4E
	VkgE+9IBD+08fpDr04V3x3+fevD4l2GmPcHKw3d4FNxSF8Yo1Y0PQ2VvDFvfG5WzeL3aZJSpLr0
	wHfFIRNDEE1m42GqZb7UsSK5dy13pRwSAKG6zCD/UWM0OQBuCenDQC7l5txW8B9AdpXXTNIMAwn
	K1jc+vqM4+eBQljwy3YzjJIiPkRkErhN+XQIsfa13sCS3KF/kMwXghy8KM1EHILKf3GHkbdPeUv
	uOw5bMZ4hSb/ptTw+OGKJ+HF7F42P7sau2xoX9HmWRtzt3xzByCsXbE85yDqxummRRexh/AoQ3i
	LujMS1L+uHh5WaT4Sjl0AvLZrmNY2NcpJcE/mrHxM+r8bYiA2/Cr4pk=
X-Received: by 2002:a05:7301:77c4:b0:33b:b0c8:73d2 with SMTP id 5a478bee46e88-34f14f18d51mr4593744eec.3.1790990836120;
        Fri, 02 Oct 2026 18:27:16 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f067301b5sm10442242eec.1.2026.10.02.18.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 18:27:15 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 0/2] Add SID and THS calibration for Allwinner R40
Date: Fri,  2 Oct 2026 22:25:34 -0300
Message-ID: <20261003012534.418820-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The R40 thermal sensor node has no calibration data. The THS driver
then keeps the calibration registers at their reset value (0x800), and
the reported temperatures have a chip-dependent offset.

This series adds the R40 SID (eFuse) controller and connects the THS
node to its factory calibration at eFuse offset 0x40.

Patch 1 adds the R40 compatible to the SID binding, with the A64
compatible as fallback. The SID driver needs no change.

Patch 2 adds the SID node to sun8i-r40.dtsi and the nvmem cell for the
THS calibration.

Checked with dt_binding_check, and with dtbs_check on all R40, V40 and
T3 board DTBs. No warnings. Tested on two Boardcon EMA40i (A40i) boards.

Otavio Salvador (2):
  dt-bindings: nvmem: SID: Add binding for R40 SID controller
  ARM: dts: sun8i-r40: Add SID node and THS calibration

 .../bindings/nvmem/allwinner,sun4i-a10-sid.yaml   |  1 +
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi        | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)


base-commit: ff47652a4b66c067c765a7ad464d930b5a9367cc
-- 
2.55.0

