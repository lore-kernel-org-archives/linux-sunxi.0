Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9F763C0
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Jun 2023 16:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6874FC433C0;
	Mon, 26 Jun 2023 16:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687798047;
	bh=Obz/MP3+5f5WsojkieAxPZB8yzfyYQEuS9/BmlPUDZM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n40vzvPCVHCq2oIDnBjwzSLBMikXrzYjE17YTYhpaoB/me80EzYtBPLi8k+lVxSBm
	 BAISVrzwwJqcYusEZUTBaSBYi6qj9S/7GUK+rwEjLTP7A3Gkipr7UGUlnile2DJm9J
	 P36vBCSvloD6x/BbDXVLzDVI+tkH6KZzONa+zSPaXf19NqrTp/LGpV+DmdrfQnH70c
	 EZIHHowbgSOI4pMCkEb7c0Bd0iGyrjKYEuq4UWBI4Gxa/rJAHpAaz8tPAGL+pJqT2Q
	 O/N9qlWRNTZwn/8ALI782GXieICJve4sEm3BWEPciNGYohwoIYW93iO+DtqwJF+8/X
	 G8jMg47p1SHLg==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20230619155349.3118420-1-miquel.raynal@bootlin.com>
References: <20230619155349.3118420-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 0/3] spi: Helper for deriving timeout values
Message-Id: <168779804513.51048.18037271269695955851.b4-ty@kernel.org>
Date: Mon, 26 Jun 2023 17:47:25 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835

On Mon, 19 Jun 2023 17:53:46 +0200, Miquel Raynal wrote:
> I recently came across an issue with the Atmel spi controller driver
> which would stop my transfers after a too small timeout when performing
> big transfers (reading a 4MiB flash in one transfer). My initial idea
> was to derive a the maximum amount of time a transfer would take
> depending on its size and use that as value to avoid erroring-out when
> not relevant. Mark wanted to go further by creating a core helper doing
> that, based on the heuristics from the sun6i driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: Create a helper to derive adaptive timeouts
      commit: d8e4ebf87018736c0c29e2eb4afe3915156483cd
[2/3] spi: atmel: Prevent false timeouts on long transfers
      commit: e0205d6203c2ce598ae26d4b2707ca4224a9c90b
[3/3] spi: sun6i: Use the new helper to derive the xfer timeout value
      commit: 6eef895581c9b5fcd002ff77837e0c3a4b1eecf6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

