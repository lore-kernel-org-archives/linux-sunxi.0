Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9AB1FECCD;
	Wed, 28 Jan 2026 00:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769560640; cv=none; b=mFGmEcRIEkR5Oj/cYnFy/8qzHPE8Br8Ek89K9TQP78oGN7SaiX+yuqZQLBfbbvHBvIue3Yk8ShViHt8oo1WaxdxbkczuR/MG9gef32AD6UUjDRg/spIdjnQTFGflkhRelf8bh6HdqEa9wkd8Oj6cT+IOgPcdTN+35lHHbV7Mtvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769560640; c=relaxed/simple;
	bh=3HKL1uGM12hoyqBDnBz72rYrhDDgXcv6Fn/aZXK0xx4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TtKZ1kczQ+4DgpGevw0mL4nuo74VgWIFF990VDnkRzPxHwIfn17OcV9t2lMEE3gaTjCzMfpLxk+EzvKyj/u2XJ2cbU5bsxrZGCteiccSTRLubROE9ZUxBKF4neH8Kz9UipJOXx2Yg21G+smiLe7QK+gB/dI524o/rQ9+IFORWMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pS/E3Jj+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pS/E3Jj+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B21C116C6;
	Wed, 28 Jan 2026 00:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769560640;
	bh=3HKL1uGM12hoyqBDnBz72rYrhDDgXcv6Fn/aZXK0xx4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pS/E3Jj+p3TvOmNrgN86e4nKrI6A5a9Io56PUSW2vMEjiWILlMgm0CoHCgytgTf28
	 vplIlSXAywsVbwFdINDnUi3xH0/zn6qO3CSTKeF1puGU9oOuHBpFGazy3IgVxUGpBs
	 PUZafb1vLxI55N45DcEDeZJps3raa4KJQxG/7Ty/xDVMd6tzIu4YR1gIcvjkRh2W4Z
	 w3BboQvraE/U+atqOXw/PqFZhGK9MHn3cgDl6X0RteRGAhwU07a7/ne/AaVqiR8BKx
	 pEnef0S/Acba3ai/ZlpMLMIioK8Al1NVDvLwxhS/fNkW5bNX/Sw4B8U/LXpb96OvS6
	 7Mp5JwNj+D3Kw==
From: Mark Brown <broonie@kernel.org>
To: fengzheng923@gmail.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, wens@kernel.org, jernej.skrabec@gmail.com, 
 samuel@sholland.org, Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260127033250.2044608-1-nichen@iscas.ac.cn>
References: <20260127033250.2044608-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: sunxi: sun50i-dmic: Add missing check for
 devm_regmap_init_mmio
Message-Id: <176956063766.1483098.13549944935065058916.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 00:37:17 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 27 Jan 2026 11:32:50 +0800, Chen Ni wrote:
> Add check for the return value of devm_regmap_init_mmio() and return the
> error if it fails in order to catch the error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sunxi: sun50i-dmic: Add missing check for devm_regmap_init_mmio
      commit: 74823db9ba2e13f3ec007b354759b3d8125e462c

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

