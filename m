Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C8EBA31
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Feb 2023 23:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=OCI6fqD9gzc4MuoROC/VX7fuVyhOhZd7xWI46OaPwyM=; b=tbPJ4OKIE6/AWDasq3pg1N//kB
	Sv9bY9TvShBRZwupzOGTw3tZseg9eizrahFv+UXDb4G462kHbfb0XjFku8fbXf6NoM3YgyN8gDt5A
	OLD5d7xeAxX0YCTey2oLKk3UeeRbwGMSuPmFL50dTtPTlTBmHGPZZKVJN89iNlYTVREXKwx2k1Qer
	UHXHr1Cmwt7jiGcov5ba1l8XYSPtp+R8dVZ3tqwbn6YUw5RSyalcrf1Uw7O9LJf9q7YdVORN6s9sl
	RDzgY49yCD5W8X5b9/Czzp+694uKiIkkI+sLWDUi8KKp2xFsQfIxlPeEqCx9M9pw8aCIiVzPGpAGj
	Fxvmcx/w==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1pRi78-0013qZ-Rx; Mon, 13 Feb 2023 23:20:03 +0000
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
Subject: [PATCH 0/3] Enable hwlock on Allwinner A64
Date: Tue, 14 Feb 2023 00:19:27 +0100
Message-Id: <20230213231931.6546-1-bage@debian.org>
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

The device tree schema needs some work to verify everything that is
needed by the sun6i hwlock driver.

The hwlock device was verified to be available with this series applied
on a Pinebook.

Bastian Germann (3):
  dt-bindings: hwlock: sun6i: Add missing #hwlock-cells
  dt-bindings: hwlock: sun6i: Add missing names
  arm64: dts: allwinner: a64: Add hwspinlock node

 .../hwlock/allwinner,sun6i-a31-hwspinlock.yaml     | 14 ++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      | 10 ++++++++++
 2 files changed, 24 insertions(+)

-- 
2.39.1

