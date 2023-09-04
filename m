Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91891C2DA
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Sep 2023 18:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6041EC433C7;
	Mon,  4 Sep 2023 18:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693853539;
	bh=O1MC3wFR2Sy6fvMGMKwaFVW+8rboa7AiTtU4zV8hHVg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dXWBLYmfP6YG1YrnLK9lalz0EKyGqjAZTbzHa70LXySSbr4utgjJX3jDarlKAE6sj
	 Ap/iyjCgv6KjWgWDbsB/fDIeaUMPKA4Pzh4j3xwjTBouJbcg5Qlt/95wBJi/DQDAX4
	 h9zC7WWl9JcafOAKjWuPqYikFWTtjeUFUhSjVWQWeWO1olSCBn84tHAONT9Qi+MZe3
	 Vue0vvOYhPWhiZ2R1OAkNaHb7YBoA5+/ZwW9YdSOkT03nkc0FiC36fuHI+7pSFLzPC
	 ylB5GQgYdMPBJ0Lf9GygBZPvfaFd9GY7Jx11pBRD/xY19UkG8sYtUtsToDtdFmLO78
	 U+qIE/pnwofag==
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Tobias Schramm <t.schramm@manjaro.org>
Cc: linux-spi@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20230827152558.5368-1-t.schramm@manjaro.org>
References: <20230827152558.5368-1-t.schramm@manjaro.org>
Subject: Re: [PATCH 0/2] spi: sun6i: fix RX data corruption in DMA mode
Message-Id: <169385353709.55844.16088323808280958557.b4-ty@kernel.org>
Date: Mon, 04 Sep 2023 19:52:17 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2

On Sun, 27 Aug 2023 17:25:56 +0200, Tobias Schramm wrote:
> Hey folks,
> 
> this set of patches fixes two bugs in the sun6i SPI driver that result in
> corruption of received data in DMA RX mode.
> 
> The first bug seems to be related to an incompatibility of the SPI RX FIFO
> with wider than single byte read accesses during SPI transfers. I'm not
> sure if this bug affects all types of SPI controllers found in Allwinner
> SoCs supported by this driver. However reducing the access width should
> always be safe. I've tested this change on a V3s SoC. Further testing to
> narrow down the set of affected SoCs in the future would be welcome.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: sun6i: reduce DMA RX transfer width to single byte
      commit: 171f8a49f212e87a8b04087568e1b3d132e36a18
[2/2] spi: sun6i: fix race between DMA RX transfer completion and RX FIFO drain
      commit: 1f11f4202caf5710204d334fe63392052783876d

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

