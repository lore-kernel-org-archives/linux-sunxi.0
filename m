Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5AD8C01
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Mar 2023 16:08:27 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6C9E1E0002;
	Wed, 22 Mar 2023 16:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679501300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVIf0xBR1dhGg/rt0kkDl4rNkivAG+axMpXPPBjw85M=;
	b=owCwyVQhPVV5yGruQwAfTRLhAW7by3LXFlI9h3IDn+DN63T27PK5gW84sP1IULijqCStO5
	+6S/lYq4NGyuna9nY8rl8tEF7fNsAjv1Ia6Za62sPMj+/BzZPVdIf8ijjwDra39BG997iC
	/R62Z+s6BP4Ku/ZV34WTPt6yx96fhD4fzFUfwbMwujUG3q1VIsYTcuUTGFwapbgpq7E0qV
	5wxL6L42lvurv2YeqsqEcjTk1opWrN2isiK6jDwICPHf2wBsv7z06Gjr0SMLBC24sqYX4c
	kBAWVMkXPV0s5PQiRdsRXlbk9qrBVsAgWE0C1QD3VyZWx2+FgphikFaPpkKOcw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Naga Sureshkumar Relli <nagasure@xilinx.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] dt-bindings: mtd: Drop unneeded quotes
Date: Wed, 22 Mar 2023 17:08:12 +0100
Message-Id: <20230322160812.2232713-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230317233631.3968509-1-robh@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'85ef1236fb6915aba83d156ec02c14b6b378298b'
Content-Transfer-Encoding: 8bit

On Fri, 2023-03-17 at 23:36:30 UTC, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
