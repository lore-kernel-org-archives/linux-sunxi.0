Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E1B2591
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Nov 2022 15:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=6rfZ0+MVQCixP+2u55j4i4SsY6z48ejiPHC0AtI1mbw=; b=iemQmT3liHFJc0ZsdB/GUBwrxs
	wMEFdfObOoMgpXpBvDGAOuriqzvc0RmX+nhcH3+fDzQJMtWzUsPkYP354iRCFyf31UVmyO+3oONiT
	2dxA7Kx5LTUihtn7Avw+/Bmh45hyokn5KVnPxHqm4wOSGpz3UrhfBb9jAYN4ZrJk7q7HDJliPLmB9
	qo4yO/HrsCiYuLDv51WkrPEfSBs/miVkcbUIvysNuKgFOLPiMrDCMVHmNxy0d7zTa2HeNGDFN4xyO
	fsRMsTPfY9usXh79QnRllvpnZVs/KCBh3AYcYcbwt7R2rLVF7+Ee9lTZIaYkgDOwi0+k9jxwZ/Eqa
	KhfR5ivQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1orLAp-004CNe-Ak; Sat, 05 Nov 2022 15:33:30 +0000
From: Bastian Germann <bage@debian.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Bastian Germann <bage@debian.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] arm64: dts: allwinner: a64: enable Bluetooth on Pinebook
Date: Sat,  5 Nov 2022 16:33:18 +0100
Message-Id: <20221105153319.19345-1-bage@debian.org>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Debian-User: bage

Pinebook uses RTL8723CS for WiFi and Bluetooth. Enable BT in the device tree.
This was part of a patch series adding RTL8723CS Bluetooth support to btrtl.

Changelog:
  v2: Fix subject
      Drop misleading I2C sentence
      Add enable-gpios to bluetooth device tree node

Vasily Khoruzhick (1):
  arm64: dts: allwinner: a64: enable Bluetooth on Pinebook

 .../boot/dts/allwinner/sun50i-a64-pinebook.dts     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.38.1

