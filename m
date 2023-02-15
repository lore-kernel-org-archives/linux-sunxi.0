Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBFD2F2F
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Feb 2023 20:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=e/h7Jd3Bftz4I/V3GwkrnB37sFuV2tm61VzgB83k3L4=; b=OffNwXDw2cmv09Gyr4ScW2cmR8
	ddg010JHL6upKIJS4YL0BLf8upSmjs0nkBYuycSPCIadhCthTA2OEyUAD7WrEWSrOTD/jBIFtip0O
	y9mYrS1MDbym6lMeKM7aN9N3OkLrRe838X02Oh7HRxUXTSoev4o2Ex0dL4NV9i2V4gk6ROQ88Yr4L
	L6CecifHmbvpBDCN0DDtSaAx3mxcJt15rWoEokXcRu1WwJ70FULOBRfb8qvGyTJ9glwwfOrNbayEK
	8893zclLjf36lU5GfinPl02IIz6VkH4byI7ZmYMdMhokXq2snKBBiBR41fIrI4NAomTbv1EwVaReW
	HijuX0KA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1pSOWi-002j5f-B0; Wed, 15 Feb 2023 20:37:16 +0000
From: Bastian Germann <bage@debian.org>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Bastian Germann <bage@debian.org>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/5] Enable hwlock on Allwinner A64
Date: Wed, 15 Feb 2023 21:37:05 +0100
Message-Id: <20230215203711.6293-1-bage@debian.org>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Debian-User: bage

The allwinner,sun6i-a31-hwspinlock compatible driver can be used with
the Allwinner A64 chip. Add the wiring required to enable it.

The device tree binding needs some work to verify everything that is
needed by the sun6i hwlock driver.

The hwlock device was verified to be available with this series applied
on a Pinebook.

1/5 was already applied in linux-next.

Changelog:
v2:
   Fix the dt-binding example for the added properties.
   Add a compatible string for a64.
   Wording 3/5: driver -> Linux driver.

Bastian Germann (5):
  dt-bindings: hwlock: sun6i: Add missing #hwlock-cells
  dt-bindings: hwlock: sun6i: Add #hwlock-cells to example
  dt-bindings: hwlock: sun6i: Add missing names
  dt-bindings: hwlock: sun6i: Add a64 compatible string
  arm64: dts: allwinner: a64: Add hwspinlock node

 .../allwinner,sun6i-a31-hwspinlock.yaml       | 21 ++++++++++++++++++-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 11 ++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

-- 
2.39.1

