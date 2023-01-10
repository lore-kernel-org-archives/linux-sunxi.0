Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5016FCF
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Jan 2023 16:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A474DC43396;
	Tue, 10 Jan 2023 16:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673367449;
	bh=B1wBKo3cDbweRD7XMkug8uJodBE8kcjQKvZBxTx7Ok8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hJN56HNsaSeSc4ovjlSJA6QcqyPrLqV5l1jDxV2jatRDTB6Kj6RSRJ+pLDWC3kVnu
	 Bdh82Xfutc3h6yzmv+da8gn0BEHZWwvePdWHvWz8Xmy+MZA5KDr1m6+O83HO5ZLv1Z
	 JcW8wWvrAU8yq8MECxEOqtVf3AHfXxnQ7vKsd/LGAG13z86kP7djxbDXyHbqXr3IQR
	 YBxOFk0V1/HKcvSKK9ksmrcM+pH6bVM+Z2OdQxAlvXIeW/4E0vJOMvtxhRJ8Z/LuyV
	 FdiYehaFml2GcrPHFF0A9GF0AJxIaJlcYFDt5QyhTNmtEHIpZGqPf7imkuPJ2AFtZQ
	 PtJVUOtNK889w==
From: Bjorn Andersson <andersson@kernel.org>
To: samuel@sholland.org,
	agx@sigxcpu.org,
	megous@megous.com,
	heiko@sntech.de,
	hdegoede@redhat.com,
	robh+dt@kernel.org,
	wens@csie.org,
	michael.riesch@wolfvision.net,
	lukma@denx.de,
	icenowy@aosc.io,
	kernel@pengutronix.de,
	david@protonic.nl,
	shawnguo@kernel.org,
	foss+kernel@0leil.net,
	linux-imx@nxp.com,
	festevam@gmail.com,
	pgwipeout@gmail.com,
	jagan@amarulasolutions.com,
	agross@kernel.org,
	hadess@hadess.net,
	dmitry.torokhov@gmail.com,
	jernej.skrabec@gmail.com,
	angelogioacchino.delregno@somainline.org,
	mamlinav@gmail.com,
	frieder.schrempf@kontron.de,
	angus@akkea.ca,
	Sascha Hauer <s.hauer@pengutronix.de>,
	konrad.dybcio@somainline.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	quentin.schulz@theobroma-systems.com,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH v3 0/9] fix reset line polarity for Goodix touchscreen controllers
Date: Tue, 10 Jan 2023 10:17:20 -0600
Message-Id: <167336743963.2134489.16668389773212954467.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221103-upstream-goodix-reset-v3-0-0975809eb183@theobroma-systems.com>
References: <20221103-upstream-goodix-reset-v3-0-0975809eb183@theobroma-systems.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 5 Dec 2022 14:40:29 +0100, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> The Goodix touchscreen controller has a reset line active low. It happens to
> also be used to configure its i2c address at runtime. If the reset line is
> incorrectly asserted, the address will be wrongly configured. This cost me a few
> hours, trying to figure out why the touchscreen wouldn't work.
> 
> [...]

Applied, thanks!

[8/9] arm64: dts: qcom: msm8998-fxtec: fix touchscreen reset GPIO polarity
      commit: 8a0721dae68fdb4534e220fc9faae7a0ef2f3785

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
